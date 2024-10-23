// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_of_arbitrations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberOfArbitrationsModel _$NumberOfArbitrationsModelFromJson(
        Map<String, dynamic> json) =>
    NumberOfArbitrationsModel(
      arbitratorCount: (json['arbitratorCount'] as num?)?.toInt(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$NumberOfArbitrationsModelToJson(
        NumberOfArbitrationsModel instance) =>
    <String, dynamic>{
      'arbitratorCount': instance.arbitratorCount,
      'id': instance.id,
    };
