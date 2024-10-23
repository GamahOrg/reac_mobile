// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaimResponse _$ClaimResponseFromJson(Map<String, dynamic> json) =>
    ClaimResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      pageCount: (json['pageCount'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ClaimResponseToJson(ClaimResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'currentPage': instance.currentPage,
      'pageCount': instance.pageCount,
      'pageSize': instance.pageSize,
      'totalCount': instance.totalCount,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      requestCode: json['requestCode'] as String?,
      response: (json['response'] as num?)?.toInt(),
      status: json['status'] as String?,
      isDone: json['isDone'] as String?,
      arbitratorsCount: (json['arbitratorsCount'] as num?)?.toInt(),
      requestDate: json['requestDate'] as String?,
      requestTypeName: json['requestTypeName'] as String?,
      createdOn: json['createdOn'] as String?,
      firstPartyName: json['firstPartyName'] as String?,
      secondPartyName: json['secondPartyName'] as String?,
      internalStatusId: (json['internalStatusId'] as num?)?.toInt(),
      externalStatusId: (json['externalStatusId'] as num?)?.toInt(),
      litigationRequestContractTypeId:
          (json['litigationRequestContractTypeId'] as num?)?.toInt(),
      litigationRequestContractType:
          json['litigationRequestContractType'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'requestCode': instance.requestCode,
      'createdOn': instance.createdOn,
      'firstPartyName': instance.firstPartyName,
      'secondPartyName': instance.secondPartyName,
      'internalStatusId': instance.internalStatusId,
      'externalStatusId': instance.externalStatusId,
      'litigationRequestContractTypeId':
          instance.litigationRequestContractTypeId,
      'litigationRequestContractType': instance.litigationRequestContractType,
      'id': instance.id,
      'requestDate': instance.requestDate,
      'requestTypeName': instance.requestTypeName,
      'status': instance.status,
      'arbitratorsCount': instance.arbitratorsCount,
      'response': instance.response,
      'isDone': instance.isDone,
    };
