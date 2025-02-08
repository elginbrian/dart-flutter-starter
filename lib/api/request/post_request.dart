import 'package:json_annotation/json_annotation.dart';

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
