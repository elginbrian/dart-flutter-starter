// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeResponse _$LikeResponseFromJson(Map<String, dynamic> json) => LikeResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$LikeResponseToJson(LikeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };

GetAllLikesResponse _$GetAllLikesResponseFromJson(Map<String, dynamic> json) =>
    GetAllLikesResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Like.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$GetAllLikesResponseToJson(
        GetAllLikesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

Like _$LikeFromJson(Map<String, dynamic> json) => Like(
      id: json['id'] as String,
      userId: json['userId'] as String,
      postId: json['postId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$LikeToJson(Like instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'postId': instance.postId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
