// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaimEventModel _$ClaimEventModelFromJson(Map<String, dynamic> json) =>
    ClaimEventModel(
      createdOn: json['createdOn'] as String?,
      requestId: json['requestId'] as String?,
      logMessage: json['logMessage'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ClaimEventModelToJson(ClaimEventModel instance) =>
    <String, dynamic>{
      'createdOn': instance.createdOn,
      'requestId': instance.requestId,
      'logMessage': instance.logMessage,
      'id': instance.id,
    };
