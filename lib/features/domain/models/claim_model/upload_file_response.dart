import 'package:json_annotation/json_annotation.dart';
part 'upload_file_response.g.dart';
@JsonSerializable()
class UploadFileResponse {
  String? fileName;
  String? id;
  String? path;
  String? fileType;

  UploadFileResponse({this.fileName, this.id, this.path, this.fileType});
  factory UploadFileResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UploadFileResponseToJson(this);
}
