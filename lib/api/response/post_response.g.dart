// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllPostsResponse _$GetAllPostsResponseFromJson(Map<String, dynamic> json) =>
    GetAllPostsResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$GetAllPostsResponseToJson(
        GetAllPostsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

SearchPostsResponse _$SearchPostsResponseFromJson(Map<String, dynamic> json) =>
    SearchPostsResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$SearchPostsResponseToJson(
        SearchPostsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

GetPostByIDResponse _$GetPostByIDResponseFromJson(Map<String, dynamic> json) =>
    GetPostByIDResponse(
      status: json['status'] as String,
      data: Post.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$GetPostByIDResponseToJson(
        GetPostByIDResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

CreatePostResponse _$CreatePostResponseFromJson(Map<String, dynamic> json) =>
    CreatePostResponse(
      status: json['status'] as String,
      data: Post.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$CreatePostResponseToJson(CreatePostResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

UpdatePostResponse _$UpdatePostResponseFromJson(Map<String, dynamic> json) =>
    UpdatePostResponse(
      status: json['status'] as String,
      data: Post.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$UpdatePostResponseToJson(UpdatePostResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

DeletePostResponse _$DeletePostResponseFromJson(Map<String, dynamic> json) =>
    DeletePostResponse(
      status: json['status'] as String,
      data: DeletePostData.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$DeletePostResponseToJson(DeletePostResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

DeletePostData _$DeletePostDataFromJson(Map<String, dynamic> json) =>
    DeletePostData(
      message: json['message'] as String,
    );

Map<String, dynamic> _$DeletePostDataToJson(DeletePostData instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String,
      userId: json['userId'] as String,
      caption: json['caption'] as String,
      imageUrl: json['imageUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'caption': instance.caption,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
