import 'package:json_annotation/json_annotation.dart';

part 'comment_response.g.dart';

@JsonSerializable()
class GetCommentsResponse {
  final String status;
  final List<Comment> data;
  final int code;

  GetCommentsResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory GetCommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCommentsResponseToJson(this);
}

@JsonSerializable()
class CreateCommentResponse {
  final String status;
  final Comment data;
  final int code;

  CreateCommentResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory CreateCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCommentResponseToJson(this);
}

@JsonSerializable()
class DeleteCommentResponse {
  final String status;
  final String message;
  final int code;

  DeleteCommentResponse({
    required this.status,
    required this.message,
    required this.code,
  });

  factory DeleteCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCommentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteCommentResponseToJson(this);
}

@JsonSerializable()
class Comment {
  final String id;
  final String userId;
  final String postId;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Comment({
    required this.id,
    required this.userId,
    required this.postId,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
