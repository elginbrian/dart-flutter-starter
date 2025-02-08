import 'package:dio/dio.dart';
import 'package:flutter_starter/api/api_config.dart';
import 'package:flutter_starter/api/interceptor.dart';
import 'package:flutter_starter/api/request/post_request.dart';
import 'package:flutter_starter/api/response/post_response.dart';

class PostService {
  final Dio _dio;

  PostService() : _dio = Dio() {
    _dio.interceptors.add(AuthInterceptor(_dio));
  }

  Future<List<GetAllPostsResponse>> getAllPosts() async {
    try {
      final response = await _dio.get(ApiConfig.posts);
      return (response.data as List)
          .map((json) => GetAllPostsResponse.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch posts: ${e.toString()}");
    }
  }

  Future<GetPostByIDResponse> getPostById(String id) async {
    try {
      final response = await _dio.get(ApiConfig.postById(id));
      return GetPostByIDResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to fetch post: ${e.toString()}");
    }
  }

  Future<List<GetAllPostsResponse>> getPostsByUserId(String userId) async {
    try {
      final response = await _dio.get(ApiConfig.postsByUser(userId));
      return (response.data as List)
          .map((json) => GetAllPostsResponse.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch user posts: ${e.toString()}");
    }
  }

  Future<UpdatePostResponse> updatePost(
      String id, UpdatePostRequest request) async {
    try {
      final response =
          await _dio.patch("${ApiConfig.posts}/$id", data: request.toJson());
      return UpdatePostResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to update post: ${e.toString()}");
    }
  }

  Future<void> deletePost(String id) async {
    try {
      await _dio.delete(ApiConfig.postById(id));
    } catch (e) {
      throw Exception("Failed to delete post: ${e.toString()}");
    }
  }

  Future<List<SearchPostsResponse>> searchPosts(String query) async {
    try {
      final response = await _dio.get("${ApiConfig.searchPosts}?query=$query");
      return (response.data as List)
          .map((json) => SearchPostsResponse.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to search posts: ${e.toString()}");
    }
  }

  Future<CreatePostResponse> createPost(CreatePostRequest request) async {
    try {
      FormData formData = FormData.fromMap({
        'caption': request.caption,
        if (request.image != null)
          'image': await MultipartFile.fromFile(request.image!.path,
              filename: request.image!.path.split('/').last),
      });

      final response = await _dio.post(
        ApiConfig.posts,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      return CreatePostResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Post creation failed: ${e.toString()}");
    }
  }
}
