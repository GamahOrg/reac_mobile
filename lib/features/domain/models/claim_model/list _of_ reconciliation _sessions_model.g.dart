// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list _of_ reconciliation _sessions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReconciliationSessionsModel _$ReconciliationSessionsModelFromJson(
        Map<String, dynamic> json) =>
    ReconciliationSessionsModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      pageCount: (json['pageCount'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReconciliationSessionsModelToJson(
        ReconciliationSessionsModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'currentPage': instance.currentPage,
      'pageCount': instance.pageCount,
      'pageSize': instance.pageSize,
      'totalCount': instance.totalCount,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      requestCode: json['requestCode'] as String?,
      requestDate: json['requestDate'] as String?,
      firstPartyName: json['firstPartyName'] as String?,
      secondPartyName: json['secondPartyName'] as String?,
      requestTypeName: json['requestTypeName'] as String?,
      sessionDatetime: json['sessionDatetime'] as String?,
      url: json['url'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'requestCode': instance.requestCode,
      'requestDate': instance.requestDate,
      'firstPartyName': instance.firstPartyName,
      'secondPartyName': instance.secondPartyName,
      'requestTypeName': instance.requestTypeName,
      'sessionDatetime': instance.sessionDatetime,
      'url': instance.url,
      'id': instance.id,
    };
