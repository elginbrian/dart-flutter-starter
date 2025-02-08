// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommentsResponse _$GetCommentsResponseFromJson(Map<String, dynamic> json) =>
    GetCommentsResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$GetCommentsResponseToJson(
        GetCommentsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

CreateCommentResponse _$CreateCommentResponseFromJson(
        Map<String, dynamic> json) =>
    CreateCommentResponse(
      status: json['status'] as String,
      data: Comment.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$CreateCommentResponseToJson(
        CreateCommentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

DeleteCommentResponse _$DeleteCommentResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteCommentResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$DeleteCommentResponseToJson(
        DeleteCommentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as String,
      userId: json['userId'] as String,
      postId: json['postId'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'postId': instance.postId,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
