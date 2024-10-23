// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsResponseModel _$DetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    DetailsResponseModel(
      allowAdd: json['allowAdd'] as bool?,
      arbitratorsCount: (json['arbitratorsCount'] as num?)?.toInt(),
      firstPartyArbitratorsCount:
          (json['firstPartyArbitratorsCount'] as num?)?.toInt(),
      secondPartyArbitratorsCount:
          (json['secondPartyArbitratorsCount'] as num?)?.toInt(),
      citizenArbitratorShortStatusDtos:
          (json['citizenArbitratorShortStatusDtos'] as List<dynamic>?)
              ?.map((e) => CitizenArbitratorShortStatusDtos.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      litigationRequestShortDto: json['litigationRequestShortDto'] == null
          ? null
          : LitigationRequestShortDto.fromJson(
              json['litigationRequestShortDto'] as Map<String, dynamic>),
    )..report = json['report'] == null
        ? null
        : Report.fromJson(json['report'] as Map<String, dynamic>);

Map<String, dynamic> _$DetailsResponseModelToJson(
        DetailsResponseModel instance) =>
    <String, dynamic>{
      'allowAdd': instance.allowAdd,
      'arbitratorsCount': instance.arbitratorsCount,
      'secondPartyArbitratorsCount': instance.secondPartyArbitratorsCount,
      'firstPartyArbitratorsCount': instance.firstPartyArbitratorsCount,
      'report': instance.report,
      'citizenArbitratorShortStatusDtos':
          instance.citizenArbitratorShortStatusDtos,
      'litigationRequestShortDto': instance.litigationRequestShortDto,
    };

CitizenArbitratorShortStatusDtos _$CitizenArbitratorShortStatusDtosFromJson(
        Map<String, dynamic> json) =>
    CitizenArbitratorShortStatusDtos(
      citizenId: json['citizenId'] as String?,
      fullName: json['fullName'] as String?,
      brief: json['brief'] as String?,
      id: json['id'] as String?,
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CitizenArbitratorShortStatusDtosToJson(
        CitizenArbitratorShortStatusDtos instance) =>
    <String, dynamic>{
      'citizenId': instance.citizenId,
      'fullName': instance.fullName,
      'brief': instance.brief,
      'value': instance.value,
      'id': instance.id,
    };

LitigationRequestShortDto _$LitigationRequestShortDtoFromJson(
        Map<String, dynamic> json) =>
    LitigationRequestShortDto(
      requestCode: json['requestCode'] as String?,
      cityName: json['cityName'] as String?,
      areaName: json['areaName'] as String?,
      contractAddress: json['contractAddress'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      isFinancialLitigation: json['isFinancialLitigation'] as bool?,
      isExemptionReduction: json['isExemptionReduction'] as bool?,
      contract: json['contract'] == null
          ? null
          : Contract.fromJson(json['contract'] as Map<String, dynamic>),
      externalStatus: json['externalStatus'] == null
          ? null
          : ExternalStatus.fromJson(
              json['externalStatus'] as Map<String, dynamic>),
      internalStatus: json['internalStatus'] == null
          ? null
          : ExternalStatus.fromJson(
              json['internalStatus'] as Map<String, dynamic>),
      id: json['id'] as String?,
    )..litigationRequestCategory = json['litigationRequestCategory'] == null
        ? null
        : LitigationRequestCategory.fromJson(
            json['litigationRequestCategory'] as Map<String, dynamic>);

Map<String, dynamic> _$LitigationRequestShortDtoToJson(
        LitigationRequestShortDto instance) =>
    <String, dynamic>{
      'requestCode': instance.requestCode,
      'cityName': instance.cityName,
      'areaName': instance.areaName,
      'contractAddress': instance.contractAddress,
      'title': instance.title,
      'description': instance.description,
      'isFinancialLitigation': instance.isFinancialLitigation,
      'isExemptionReduction': instance.isExemptionReduction,
      'contract': instance.contract,
      'litigationRequestCategory': instance.litigationRequestCategory,
      'externalStatus': instance.externalStatus,
      'internalStatus': instance.internalStatus,
      'id': instance.id,
    };

LitigationRequestCategory _$LitigationRequestCategoryFromJson(
        Map<String, dynamic> json) =>
    LitigationRequestCategory(
      categoryName: json['categoryName'] as String?,
      bpfId: json['bpfId'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LitigationRequestCategoryToJson(
        LitigationRequestCategory instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'bpfId': instance.bpfId,
      'id': instance.id,
    };

Contract _$ContractFromJson(Map<String, dynamic> json) => Contract(
      litigationRequestContractTypeId:
          (json['litigationRequestContractTypeId'] as num?)?.toInt(),
      contractKey: json['contractKey'] as String?,
      versionNumber: json['versionNumber'] as String?,
      firstPartyCapacity: json['firstPartyCapacity'] as String?,
      secondPartyCapacity: json['secondPartyCapacity'] as String?,
      firstPartyCitizen: json['firstPartyCitizen'] == null
          ? null
          : FirstPartyCitizen.fromJson(
              json['firstPartyCitizen'] as Map<String, dynamic>),
      secondPartyCitizen: json['secondPartyCitizen'] == null
          ? null
          : FirstPartyCitizen.fromJson(
              json['secondPartyCitizen'] as Map<String, dynamic>),
      litigationRequestContractType: json['litigationRequestContractType'] ==
              null
          ? null
          : LitigationRequestContractType.fromJson(
              json['litigationRequestContractType'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ContractToJson(Contract instance) => <String, dynamic>{
      'litigationRequestContractTypeId':
          instance.litigationRequestContractTypeId,
      'contractKey': instance.contractKey,
      'versionNumber': instance.versionNumber,
      'firstPartyCapacity': instance.firstPartyCapacity,
      'secondPartyCapacity': instance.secondPartyCapacity,
      'firstPartyCitizen': instance.firstPartyCitizen,
      'secondPartyCitizen': instance.secondPartyCitizen,
      'litigationRequestContractType': instance.litigationRequestContractType,
      'id': instance.id,
    };

FirstPartyCitizen _$FirstPartyCitizenFromJson(Map<String, dynamic> json) =>
    FirstPartyCitizen(
      identityNumber: json['identityNumber'] as String?,
      fullName: json['fullName'] as String?,
      mobile: json['mobile'] as String?,
      homeTelephone: json['homeTelephone'] as String?,
      workTelephone: json['workTelephone'] as String?,
      fax: json['fax'] as String?,
      email: json['email'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$FirstPartyCitizenToJson(FirstPartyCitizen instance) =>
    <String, dynamic>{
      'identityNumber': instance.identityNumber,
      'fullName': instance.fullName,
      'mobile': instance.mobile,
      'homeTelephone': instance.homeTelephone,
      'workTelephone': instance.workTelephone,
      'fax': instance.fax,
      'email': instance.email,
      'id': instance.id,
    };

LitigationRequestContractType _$LitigationRequestContractTypeFromJson(
        Map<String, dynamic> json) =>
    LitigationRequestContractType(
      typeName: json['typeName'] as String?,
      codingPrefixSymbol: json['codingPrefixSymbol'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LitigationRequestContractTypeToJson(
        LitigationRequestContractType instance) =>
    <String, dynamic>{
      'typeName': instance.typeName,
      'codingPrefixSymbol': instance.codingPrefixSymbol,
      'id': instance.id,
    };

ExternalStatus _$ExternalStatusFromJson(Map<String, dynamic> json) =>
    ExternalStatus(
      requestStatus: json['requestStatus'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExternalStatusToJson(ExternalStatus instance) =>
    <String, dynamic>{
      'requestStatus': instance.requestStatus,
      'id': instance.id,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      explanationRequestDate: json['explanationRequestDate'] as String?,
      explanationRequests: json['explanationRequests'] as String?,
      response: json['response'] as String?,
      responseOn: json['responseOn'] as String?,
      litigationRequestId: json['litigationRequestId'] as String?,
      judgmentDate: json['judgmentDate'] as String?,
      facts: json['facts'] as String?,
      reasons: json['reasons'] as String?,
      judgmentDecisionText: json['judgmentDecisionText'] as String?,
      modificationRequest: json['modificationRequest'] as String?,
      judgmentDecisionDate: json['judgmentDecisionDate'] as String?,
      judgmentDecisionPlace: json['judgmentDecisionPlace'] as String?,
      meetingLocationId: json['meetingLocationId'] as String?,
      meetingLocationName: json['meetingLocationName'] as String?,
      litigationRequestArbitrationReportExplanationRequestFiles:
          (json['litigationRequestArbitrationReportExplanationRequestFiles']
                  as List<dynamic>?)
              ?.map((e) =>
                  LitigationRequestArbitrationReportExplanationRequestFiles
                      .fromJson(e as Map<String, dynamic>))
              .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'explanationRequestDate': instance.explanationRequestDate,
      'explanationRequests': instance.explanationRequests,
      'response': instance.response,
      'responseOn': instance.responseOn,
      'litigationRequestArbitrationReportExplanationRequestFiles':
          instance.litigationRequestArbitrationReportExplanationRequestFiles,
      'id': instance.id,
      'litigationRequestId': instance.litigationRequestId,
      'judgmentDate': instance.judgmentDate,
      'facts': instance.facts,
      'reasons': instance.reasons,
      'judgmentDecisionText': instance.judgmentDecisionText,
      'modificationRequest': instance.modificationRequest,
      'judgmentDecisionDate': instance.judgmentDecisionDate,
      'judgmentDecisionPlace': instance.judgmentDecisionPlace,
      'meetingLocationId': instance.meetingLocationId,
      'meetingLocationName': instance.meetingLocationName,
    };

LitigationRequestArbitrationReportExplanationRequestFiles
    _$LitigationRequestArbitrationReportExplanationRequestFilesFromJson(
            Map<String, dynamic> json) =>
        LitigationRequestArbitrationReportExplanationRequestFiles(
          explanationRequestFile: json['explanationRequestFile'] == null
              ? null
              : ContractFile.fromJson(
                  json['explanationRequestFile'] as Map<String, dynamic>),
          id: json['id'] as String?,
        );

Map<String,
    dynamic> _$LitigationRequestArbitrationReportExplanationRequestFilesToJson(
        LitigationRequestArbitrationReportExplanationRequestFiles instance) =>
    <String, dynamic>{
      'explanationRequestFile': instance.explanationRequestFile,
      'id': instance.id,
    };

ContractFile _$ContractFileFromJson(Map<String, dynamic> json) => ContractFile(
      id: json['id'] as String?,
      fileDescription: json['fileDescription'] as String?,
      filePath: json['filePath'] as String?,
      fileType: json['fileType'] as String?,
    );

Map<String, dynamic> _$ContractFileToJson(ContractFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileDescription': instance.fileDescription,
      'filePath': instance.filePath,
      'fileType': instance.fileType,
    };
