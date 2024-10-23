import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  int? code;
  String? message;
  T? data;
  String? exceptionMessage;
  bool? isDone;

  BaseResponse(
      {this.code, this.message, this.data, this.exceptionMessage, this.isDone}); // from json

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}
