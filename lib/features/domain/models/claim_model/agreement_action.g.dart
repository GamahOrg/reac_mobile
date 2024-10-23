// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreement_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgreementAction _$AgreementActionFromJson(Map<String, dynamic> json) =>
    AgreementAction(
      requestId: json['requestId'] as String?,
      agreementRequestStatus: (json['agreementRequestStatus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AgreementActionToJson(AgreementAction instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'agreementRequestStatus': instance.agreementRequestStatus,
    };
