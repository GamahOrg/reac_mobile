import 'package:json_annotation/json_annotation.dart';
part 'claim_event_model.g.dart';
@JsonSerializable()
class ClaimEventModel {
  String? createdOn;
  String? requestId;
  String? logMessage;
  String? id;

  ClaimEventModel({this.createdOn, this.requestId, this.logMessage, this.id});
  factory ClaimEventModel.fromJson(Map<String, dynamic> json) =>
      _$ClaimEventModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClaimEventModelToJson(this);
}