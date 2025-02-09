import 'package:dio/dio.dart';
import 'package:flutter_starter/api/api_config.dart';
import 'package:flutter_starter/api/interceptor.dart';
import 'package:flutter_starter/api/request/auth_request.dart';
import 'package:flutter_starter/api/response/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  late final Dio _dio;

  AuthService._privateConstructor() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    _dio.interceptors.add(AuthInterceptor(_dio));
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  static final AuthService _instance = AuthService._privateConstructor();
  factory AuthService() => _instance;

  Future<LoginResponse> login(UserLoginRequest request) async {
    return _handleRequest<LoginResponse>(
      () async {
        final response =
            await _dio.post(ApiConfig.login, data: request.toJson());

        final accessToken = response.data['data']['access_token'];
        final refreshToken = response.data['data']['refresh_token'];

        await _saveTokens(accessToken, refreshToken);
        return response;
      },
      (data) => LoginResponse.fromJson(data),
    );
  }

  Future<RegisterResponse> register(UserRegistrationRequest request) async {
    return _handleRequest<RegisterResponse>(
      () => _dio.post(ApiConfig.register, data: request.toJson()),
      (data) => RegisterResponse.fromJson(data),
    );
  }

  Future<GetCurrentUserResponse> getCurrentUser() async {
    return _handleRequest<GetCurrentUserResponse>(
      () => _dio.get(ApiConfig.currentUser),
      (data) => GetCurrentUserResponse.fromJson(data),
    );
  }

  Future<ChangePasswordResponse> changePassword(
      ChangePasswordRequest request) async {
    return _handleRequest<ChangePasswordResponse>(
      () => _dio.patch(ApiConfig.changePassword, data: request.toJson()),
      (data) => ChangePasswordResponse.fromJson(data),
    );
  }

  Future<RefreshTokenResponse> refreshAccessToken(
      RefreshTokenRequest request) async {
    return _handleRequest<RefreshTokenResponse>(
      () => _dio.post(ApiConfig.refreshToken, data: request.toJson()),
      (data) => RefreshTokenResponse.fromJson(data),
    );
  }

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
  }

  Future<T> _handleRequest<T>(
      Future<Response> Function() request, T Function(dynamic) fromJson) async {
    try {
      final response = await request();
      return fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("API Error: ${e.response?.data ?? e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
