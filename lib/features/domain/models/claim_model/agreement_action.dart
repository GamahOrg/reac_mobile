import 'package:json_annotation/json_annotation.dart';
part 'agreement_action.g.dart';
@JsonSerializable()
class AgreementAction{
  String? requestId;
  int? agreementRequestStatus;
  AgreementAction({this.requestId,this.agreementRequestStatus});
  factory AgreementAction.fromJson(Map<String, dynamic> json) =>
      _$AgreementActionFromJson(json);
  Map<String, dynamic> toJson() => _$AgreementActionToJson(this);
}