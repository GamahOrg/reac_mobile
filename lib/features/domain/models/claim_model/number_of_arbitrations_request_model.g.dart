// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_of_arbitrations_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NumberOfArbitractionsRequestModelImpl
    _$$NumberOfArbitractionsRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$NumberOfArbitractionsRequestModelImpl(
          requestId: json['requestId'] as String?,
          arbitratorCount: (json['arbitratorCount'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$NumberOfArbitractionsRequestModelImplToJson(
        _$NumberOfArbitractionsRequestModelImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'arbitratorCount': instance.arbitratorCount,
    };
