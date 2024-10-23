import 'package:json_annotation/json_annotation.dart';
part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseDM<T> {
  int? code;
  String? message;
  T? data;
  String? exceptionMessage;
  bool? isDone;
  BaseDM(
      { this.code,
         this.message,
        required this.data,
        this.exceptionMessage,
         this.isDone = true});
  factory BaseDM.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseDMFromJson(json, fromJsonT);
}
