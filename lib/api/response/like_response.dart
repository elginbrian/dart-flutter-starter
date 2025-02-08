import 'package:json_annotation/json_annotation.dart';

part 'like_response.g.dart';

@JsonSerializable()
class LikeResponse {
  final String status;
  final String message;
  final int code;

  LikeResponse({
    required this.status,
    required this.message,
    required this.code,
  });

  factory LikeResponse.fromJson(Map<String, dynamic> json) =>
      _$LikeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LikeResponseToJson(this);
}

@JsonSerializable()
class GetAllLikesResponse {
  final String status;
  final List<Like> data;
  final int code;

  GetAllLikesResponse({
    required this.status,
    required this.data,
    required this.code,
  });

  factory GetAllLikesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllLikesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllLikesResponseToJson(this);
}

@JsonSerializable()
class Like {
  final String id;
  final String userId;
  final String postId;
  final DateTime createdAt;

  Like({
    required this.id,
    required this.userId,
    required this.postId,
    required this.createdAt,
  });

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
  Map<String, dynamic> toJson() => _$LikeToJson(this);
}
