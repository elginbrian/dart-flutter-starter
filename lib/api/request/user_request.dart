import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable()
class UpdateUserRequest {
  @JsonKey(name: 'username')
  final String username;

  @JsonKey(toJson: _fileToJson, fromJson: _fileFromJson)
  final File image;

  UpdateUserRequest({
    required this.username,
    required this.image,
  });

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);

  static String _fileToJson(File file) {
    return base64Encode(file.readAsBytesSync());
  }

  static File _fileFromJson(String base64String) {
    final bytes = base64Decode(base64String);
    final tempDir = Directory.systemTemp;
    final tempFile = File('${tempDir.path}/temp_image');
    tempFile.writeAsBytesSync(bytes);
    return tempFile;
  }
}
