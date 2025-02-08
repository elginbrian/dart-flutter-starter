import 'package:json_annotation/json_annotation.dart';

part 'comment_request.g.dart';

@JsonSerializable()
class CreateCommentRequest {
  @JsonKey(name: 'content')
  final String content;

  CreateCommentRequest({
    required this.content,
  });

  factory CreateCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCommentRequestToJson(this);
}
