// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arbitration_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArbitrationRequestModelImpl _$$ArbitrationRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ArbitrationRequestModelImpl(
      litigationRequestId: json['litigationRequestId'] as String?,
      explanationRequests: json['explanationRequests'] as String?,
      litigationRequestArbitrationReportExplanationRequestFiles:
          (json['litigationRequestArbitrationReportExplanationRequestFiles']
                  as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$$ArbitrationRequestModelImplToJson(
        _$ArbitrationRequestModelImpl instance) =>
    <String, dynamic>{
      'litigationRequestId': instance.litigationRequestId,
      'explanationRequests': instance.explanationRequests,
      'litigationRequestArbitrationReportExplanationRequestFiles':
          instance.litigationRequestArbitrationReportExplanationRequestFiles,
    };
