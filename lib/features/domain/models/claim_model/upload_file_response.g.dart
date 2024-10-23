// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileResponse _$UploadFileResponseFromJson(Map<String, dynamic> json) =>
    UploadFileResponse(
      fileName: json['fileName'] as String?,
      id: json['id'] as String?,
      path: json['path'] as String?,
      fileType: json['fileType'] as String?,
    );

Map<String, dynamic> _$UploadFileResponseToJson(UploadFileResponse instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'id': instance.id,
      'path': instance.path,
      'fileType': instance.fileType,
    };
