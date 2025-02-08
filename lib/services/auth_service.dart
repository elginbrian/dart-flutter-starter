import 'package:dio/dio.dart';
import 'package:flutter_starter/api/api_config.dart';
import 'package:flutter_starter/api/interceptor.dart';
import 'package:flutter_starter/api/request/auth_request.dart';
import 'package:flutter_starter/api/response/auth_response.dart';

class AuthService {
  final Dio _dio;

  AuthService() : _dio = Dio() {
    _dio.interceptors.add(AuthInterceptor(_dio));
  }

  Future<LoginResponse> login(UserLoginRequest request) async {
    try {
      final response = await _dio.post(
        ApiConfig.login,
        data: request.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  Future<RegisterResponse> register(UserRegistrationRequest request) async {
    try {
      final response = await _dio.post(
        ApiConfig.register,
        data: request.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Registration failed: ${e.toString()}");
    }
  }

  Future<GetCurrentUserResponse> getCurrentUser() async {
    try {
      final response = await _dio.get(ApiConfig.currentUser);
      return GetCurrentUserResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Fetching user data failed: ${e.toString()}");
    }
  }

  Future<ChangePasswordResponse> changePassword(
      ChangePasswordRequest request) async {
    try {
      final response = await _dio.patch(
        ApiConfig.changePassword,
        data: request.toJson(),
      );
      return ChangePasswordResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Change password failed: ${e.toString()}");
    }
  }

  Future<RefreshTokenResponse> refreshAccessToken(
      RefreshTokenRequest request) async {
    try {
      final response = await _dio.post(
        ApiConfig.refreshToken,
        data: request.toJson(),
      );
      return RefreshTokenResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Token refresh failed: ${e.toString()}");
    }
  }
}
