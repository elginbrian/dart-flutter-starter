import 'package:dio/dio.dart';
import 'package:flutter_starter/api/api_config.dart';
import 'package:flutter_starter/api/interceptor.dart';
import 'package:flutter_starter/api/request/comment_request.dart';
import 'package:flutter_starter/api/response/comment_response.dart';

class CommentService {
  final Dio _dio;

  CommentService() : _dio = Dio() {
    _dio.interceptors.add(AuthInterceptor(_dio));
  }

  Future<List<GetCommentsResponse>> getCommentsByPostID(String postID) async {
    try {
      final response = await _dio.get(ApiConfig.commentsByPost(postID));
      return (response.data as List)
          .map((json) => GetCommentsResponse.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch comments: ${e.toString()}");
    }
  }

  Future<CreateCommentResponse> createComment(
      String postID, CreateCommentRequest request) async {
    try {
      final response = await _dio.post(
        "${ApiConfig.posts}/$postID/comments",
        data: request.toJson(),
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      return CreateCommentResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to create comment: ${e.toString()}");
    }
  }

  Future<void> deleteComment(String commentID) async {
    try {
      await _dio.delete(ApiConfig.deleteCommentById(commentID));
    } catch (e) {
      throw Exception("Failed to delete comment: ${e.toString()}");
    }
  }
}
