import 'package:dio/dio.dart';
import 'package:flutter_starter/api/api_config.dart';
import 'package:flutter_starter/api/interceptor.dart';
import 'package:flutter_starter/api/request/user_request.dart';
import 'package:flutter_starter/api/response/user_response.dart';

class UserService {
  final Dio _dio;

  UserService() : _dio = Dio() {
    _dio.interceptors.add(AuthInterceptor(_dio));
  }

  Future<GetAllUsersResponse> getAllUsers() async {
    try {
      final response = await _dio.get(ApiConfig.users);
      return GetAllUsersResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to fetch users: ${e.toString()}");
    }
  }

  Future<GetUserByIDResponse> getUserById(String id) async {
    try {
      final response = await _dio.get(ApiConfig.userById(id));
      return GetUserByIDResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to fetch user: ${e.toString()}");
    }
  }

  Future<UpdateUserResponse> updateUser(UpdateUserRequest request) async {
    try {
      FormData formData = FormData.fromMap({
        'username': request.username,
      });

      final response = await _dio.patch(
        ApiConfig.users,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      return UpdateUserResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to update user: ${e.toString()}");
    }
  }

  Future<List<SearchUsersResponse>> searchUsers(String query) async {
    try {
      final response = await _dio.get(
        ApiConfig.searchUsers,
        queryParameters: {'query': query},
      );
      return (response.data as List)
          .map((json) => SearchUsersResponse.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to search users: ${e.toString()}");
    }
  }
}
