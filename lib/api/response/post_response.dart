import 'package:flutter_starter/models/post_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_response.g.dart';

@JsonSerializable()
class GetAllPostsResponse {
  final String status;
  final List<Post> data;
  final int code;

  GetAllPostsResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory GetAllPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllPostsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllPostsResponseToJson(this);
}

@JsonSerializable()
class SearchPostsResponse {
  final String status;
  final List<Post> data;
  final int code;

  SearchPostsResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory SearchPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchPostsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchPostsResponseToJson(this);
}

@JsonSerializable()
class GetPostByIDResponse {
  final String status;
  final Post data;
  final int code;

  GetPostByIDResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory GetPostByIDResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPostByIDResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetPostByIDResponseToJson(this);
}

@JsonSerializable()
class CreatePostResponse {
  final String status;
  final Post data;
  final int code;

  CreatePostResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory CreatePostResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreatePostResponseToJson(this);
}

@JsonSerializable()
class UpdatePostResponse {
  final String status;
  final Post data;
  final int code;

  UpdatePostResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory UpdatePostResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatePostResponseToJson(this);
}

@JsonSerializable()
class DeletePostResponse {
  final String status;
  final DeletePostData data;
  final int code;

  DeletePostResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory DeletePostResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeletePostResponseToJson(this);
}

@JsonSerializable()
class DeletePostData {
  final String message;

  DeletePostData({
    required this.message,
  });

  factory DeletePostData.fromJson(Map<String, dynamic> json) =>
      _$DeletePostDataFromJson(json);
  Map<String, dynamic> toJson() => _$DeletePostDataToJson(this);
}
