// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reconciliation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reconciliation _$ReconciliationFromJson(Map<String, dynamic> json) =>
    Reconciliation(
      allowAdd: json['allowAdd'] as bool?,
      allowDecision: json['allowDecision'] as bool?,
      approveRejectStatus: (json['approveRejectStatus'] as num?)?.toInt(),
      litigationRequestShortDto: json['litigationRequestShortDto'] == null
          ? null
          : LitigationRequestShortDto.fromJson(
              json['litigationRequestShortDto'] as Map<String, dynamic>),
      report: json['report'] == null
          ? null
          : Report.fromJson(json['report'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReconciliationToJson(Reconciliation instance) =>
    <String, dynamic>{
      'allowAdd': instance.allowAdd,
      'allowDecision': instance.allowDecision,
      'approveRejectStatus': instance.approveRejectStatus,
      'litigationRequestShortDto': instance.litigationRequestShortDto,
      'report': instance.report,
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
      applicantCitizen: json['applicantCitizen'] == null
          ? null
          : ApplicantCitizen.fromJson(
              json['applicantCitizen'] as Map<String, dynamic>),
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
      litigationRequestAmount: json['litigationRequestAmount'] == null
          ? null
          : LitigationRequestAmount.fromJson(
              json['litigationRequestAmount'] as Map<String, dynamic>),
      litigationRequestCategory: json['litigationRequestCategory'] == null
          ? null
          : LitigationRequestCategory.fromJson(
              json['litigationRequestCategory'] as Map<String, dynamic>),
      litigationRequestOwnerType: json['litigationRequestOwnerType'] == null
          ? null
          : LitigationRequestOwnerType.fromJson(
              json['litigationRequestOwnerType'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

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
      'applicantCitizen': instance.applicantCitizen,
      'contract': instance.contract,
      'externalStatus': instance.externalStatus,
      'internalStatus': instance.internalStatus,
      'litigationRequestAmount': instance.litigationRequestAmount,
      'litigationRequestCategory': instance.litigationRequestCategory,
      'litigationRequestOwnerType': instance.litigationRequestOwnerType,
      'id': instance.id,
    };

ApplicantCitizen _$ApplicantCitizenFromJson(Map<String, dynamic> json) =>
    ApplicantCitizen(
      identityNumber: json['identityNumber'] as String?,
      fullName: json['fullName'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      id: json['id'] as String?,
      workTelephone: json['workTelephone'] as String?,
      homeTelephone: json['homeTelephone'] as String?,
      fax: json['fax'] as String?,
    );

Map<String, dynamic> _$ApplicantCitizenToJson(ApplicantCitizen instance) =>
    <String, dynamic>{
      'identityNumber': instance.identityNumber,
      'fullName': instance.fullName,
      'mobile': instance.mobile,
      'email': instance.email,
      'id': instance.id,
      'homeTelephone': instance.homeTelephone,
      'workTelephone': instance.workTelephone,
      'fax': instance.fax,
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
          : ApplicantCitizen.fromJson(
              json['firstPartyCitizen'] as Map<String, dynamic>),
      secondPartyCitizen: json['secondPartyCitizen'] == null
          ? null
          : ApplicantCitizen.fromJson(
              json['secondPartyCitizen'] as Map<String, dynamic>),
      contractFile: json['contractFile'] == null
          ? null
          : ContractFile.fromJson(json['contractFile'] as Map<String, dynamic>),
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
      'contractFile': instance.contractFile,
      'litigationRequestContractType': instance.litigationRequestContractType,
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

LitigationRequestAmount _$LitigationRequestAmountFromJson(
        Map<String, dynamic> json) =>
    LitigationRequestAmount(
      litigationAmount: json['litigationAmount'] as String?,
      fees: (json['fees'] as num?)?.toInt(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LitigationRequestAmountToJson(
        LitigationRequestAmount instance) =>
    <String, dynamic>{
      'litigationAmount': instance.litigationAmount,
      'fees': instance.fees,
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

LitigationRequestOwnerType _$LitigationRequestOwnerTypeFromJson(
        Map<String, dynamic> json) =>
    LitigationRequestOwnerType(
      litigationRequestOwnerType: json['litigationRequestOwnerType'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LitigationRequestOwnerTypeToJson(
        LitigationRequestOwnerType instance) =>
    <String, dynamic>{
      'litigationRequestOwnerType': instance.litigationRequestOwnerType,
      'id': instance.id,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      litigationRequestId: json['litigationRequestId'] as String?,
      reportDate: json['reportDate'] as String?,
      reconciliationSessionDetails:
          json['reconciliationSessionDetails'] as String?,
      modificationRequest: json['modificationRequest'] as String?,
      litigationRequestMeetingReconciliationItems:
          (json['litigationRequestMeetingReconciliationItems']
                  as List<dynamic>?)
              ?.map((e) => LitigationRequestMeetingReconciliationItems.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'litigationRequestId': instance.litigationRequestId,
      'reportDate': instance.reportDate,
      'reconciliationSessionDetails': instance.reconciliationSessionDetails,
      'modificationRequest': instance.modificationRequest,
      'litigationRequestMeetingReconciliationItems':
          instance.litigationRequestMeetingReconciliationItems,
      'id': instance.id,
    };

LitigationRequestMeetingReconciliationItems
    _$LitigationRequestMeetingReconciliationItemsFromJson(
            Map<String, dynamic> json) =>
        LitigationRequestMeetingReconciliationItems(
          reconciliationItem: json['reconciliationItem'] as String?,
          id: json['id'] as String?,
        );

Map<String, dynamic> _$LitigationRequestMeetingReconciliationItemsToJson(
        LitigationRequestMeetingReconciliationItems instance) =>
    <String, dynamic>{
      'reconciliationItem': instance.reconciliationItem,
      'id': instance.id,
    };
