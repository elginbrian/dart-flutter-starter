// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as String,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      status: json['status'] as String,
      data: RegisterData.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) => RegisterData(
      message: json['message'] as String,
    );

Map<String, dynamic> _$RegisterDataToJson(RegisterData instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

GetCurrentUserResponse _$GetCurrentUserResponseFromJson(
        Map<String, dynamic> json) =>
    GetCurrentUserResponse(
      status: json['status'] as String,
      data: User.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$GetCurrentUserResponseToJson(
        GetCurrentUserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

ChangePasswordResponse _$ChangePasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordResponse(
      status: json['status'] as String,
      data: ChangePasswordData.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$ChangePasswordResponseToJson(
        ChangePasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

ChangePasswordData _$ChangePasswordDataFromJson(Map<String, dynamic> json) =>
    ChangePasswordData(
      message: json['message'] as String,
    );

Map<String, dynamic> _$ChangePasswordDataToJson(ChangePasswordData instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

RefreshTokenResponse _$RefreshTokenResponseFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenResponse(
      status: json['status'] as String,
      data: RefreshTokenData.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$RefreshTokenResponseToJson(
        RefreshTokenResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
    };

RefreshTokenData _$RefreshTokenDataFromJson(Map<String, dynamic> json) =>
    RefreshTokenData(
      accessToken: json['access_token'] as String,
    );

Map<String, dynamic> _$RefreshTokenDataToJson(RefreshTokenData instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
    };
