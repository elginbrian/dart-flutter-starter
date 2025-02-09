// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUsersResponse _$GetAllUsersResponseFromJson(Map<String, dynamic> json) =>
    GetAllUsersResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$GetAllUsersResponseToJson(
        GetAllUsersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

SearchUsersResponse _$SearchUsersResponseFromJson(Map<String, dynamic> json) =>
    SearchUsersResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$SearchUsersResponseToJson(
        SearchUsersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

GetUserByIDResponse _$GetUserByIDResponseFromJson(Map<String, dynamic> json) =>
    GetUserByIDResponse(
      status: json['status'] as String,
      data: User.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$GetUserByIDResponseToJson(
        GetUserByIDResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) =>
    UpdateUserResponse(
      status: json['status'] as String,
      data: User.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateUserResponseToJson(UpdateUserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

DeleteUserResponse _$DeleteUserResponseFromJson(Map<String, dynamic> json) =>
    DeleteUserResponse(
      status: json['status'] as String,
      data: json['data'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$DeleteUserResponseToJson(DeleteUserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };
