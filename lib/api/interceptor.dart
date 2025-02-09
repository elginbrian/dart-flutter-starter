import 'package:dio/dio.dart';
import 'package:flutter_starter/api/api_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = accessToken;
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final success = await _refreshToken();
      if (success) {
        final retryRequest = await _retry(err.requestOptions);
        return handler.resolve(retryRequest);
      }
    }
    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refresh_token');

    if (refreshToken == null || refreshToken.isEmpty) return false;

    try {
      final response = await dio.post(
        ApiConfig.refreshToken,
        data: {'refresh_token': refreshToken},
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['access_token'];
        await prefs.setString('access_token', newAccessToken);
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final prefs = await SharedPreferences.getInstance();
    final newAccessToken = prefs.getString('access_token');

    final updatedHeaders = Map<String, dynamic>.from(requestOptions.headers);
    updatedHeaders['Authorization'] = newAccessToken;

    final options = Options(
      method: requestOptions.method,
      headers: updatedHeaders,
    );

    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
