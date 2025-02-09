import 'package:flutter_starter/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class GetAllUsersResponse {
  final String status;
  final List<User> data;
  final int code;

  GetAllUsersResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory GetAllUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllUsersResponseToJson(this);
}

@JsonSerializable()
class SearchUsersResponse {
  final String status;
  final List<User> data;
  final int code;

  SearchUsersResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory SearchUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchUsersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchUsersResponseToJson(this);
}

@JsonSerializable()
class GetUserByIDResponse {
  final String status;
  final User data;
  final int code;

  GetUserByIDResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory GetUserByIDResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserByIDResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserByIDResponseToJson(this);
}

@JsonSerializable()
class UpdateUserResponse {
  final String status;
  final User data;
  final int code;

  UpdateUserResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserResponseToJson(this);
}

@JsonSerializable()
class DeleteUserResponse {
  final String status;
  final String data;
  final int code;

  DeleteUserResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteUserResponseToJson(this);
}
