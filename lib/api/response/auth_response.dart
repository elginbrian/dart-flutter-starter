import 'package:json_annotation/json_annotation.dart';
import '../../models/user_model.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String status;
  final LoginData data;
  final int code;

  LoginResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  LoginData({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class RegisterResponse {
  final String status;
  final RegisterData data;
  final int code;

  RegisterResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class RegisterData {
  final String message;

  RegisterData({required this.message});

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDataToJson(this);
}

@JsonSerializable()
class GetCurrentUserResponse {
  final String status;
  final User data;
  final int code;

  GetCurrentUserResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory GetCurrentUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCurrentUserResponseToJson(this);
}

@JsonSerializable()
class ChangePasswordResponse {
  final String status;
  final ChangePasswordData data;
  final int code;

  ChangePasswordResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);
}

@JsonSerializable()
class ChangePasswordData {
  final String message;

  ChangePasswordData({required this.message});

  factory ChangePasswordData.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordDataToJson(this);
}

@JsonSerializable()
class RefreshTokenResponse {
  final String status;
  final RefreshTokenData data;
  final int code;

  RefreshTokenResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}

@JsonSerializable()
class RefreshTokenData {
  @JsonKey(name: 'access_token')
  final String accessToken;

  RefreshTokenData({required this.accessToken});

  factory RefreshTokenData.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenDataFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenDataToJson(this);
}
