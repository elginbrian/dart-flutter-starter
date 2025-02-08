import 'package:json_annotation/json_annotation.dart';
import 'dart:io';

part 'post_request.g.dart';

@JsonSerializable()
class UpdatePostRequest {
  @JsonKey(name: 'caption')
  final String caption;

  UpdatePostRequest({
    required this.caption,
  });

  factory UpdatePostRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePostRequestToJson(this);
}

class CreatePostRequest {
  final String caption;
  final File? image;

  CreatePostRequest({
    required this.caption,
    this.image,
  });
}
