// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckStatusReponse _$CheckStatusReponseFromJson(Map<String, dynamic> json) =>
    CheckStatusReponse(
      transactionId: json['transactionId'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      isValid: json['isValid'] as bool?,
    );

Map<String, dynamic> _$CheckStatusReponseToJson(CheckStatusReponse instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'isValid': instance.isValid,
    };
