import 'package:dio/dio.dart';
import 'package:flutter_starter/api/api_config.dart';
import 'package:flutter_starter/api/interceptor.dart';
import 'package:flutter_starter/api/response/like_response.dart';

class LikeService {
  final Dio _dio;

  LikeService() : _dio = Dio() {
    _dio.interceptors.add(AuthInterceptor(_dio));
  }

  Future<LikeResponse> likePost(String postID) async {
    try {
      final response = await _dio.post(
        ApiConfig.likePost(postID),
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      return LikeResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to like post: ${e.toString()}");
    }
  }

  Future<void> unlikePost(String postID) async {
    try {
      await _dio.post(ApiConfig.unlikePost(postID));
    } catch (e) {
      throw Exception("Failed to unlike post: ${e.toString()}");
    }
  }

  Future<List<GetAllLikesResponse>> getLikesByPostID(String postID) async {
    try {
      final response = await _dio.get(ApiConfig.likesByPost(postID));
      return (response.data as List)
          .map((json) => GetAllLikesResponse.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch likes: ${e.toString()}");
    }
  }

  Future<List<GetAllLikesResponse>> getLikesByUserID(String userID) async {
    try {
      final response = await _dio.get(ApiConfig.likesByUser(userID));
      return (response.data as List)
          .map((json) => GetAllLikesResponse.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch user likes: ${e.toString()}");
    }
  }
}
