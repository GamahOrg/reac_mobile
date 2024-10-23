// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgreementModel _$AgreementModelFromJson(Map<String, dynamic> json) =>
    AgreementModel(
      allowAdd: json['allowAdd'] as bool?,
      approveRejectStatus: (json['approveRejectStatus'] as num?)?.toInt(),
      litigationRequestShortDto: json['litigationRequestShortDto'] == null
          ? null
          : LitigationRequestShortDto.fromJson(
              json['litigationRequestShortDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AgreementModelToJson(AgreementModel instance) =>
    <String, dynamic>{
      'allowAdd': instance.allowAdd,
      'approveRejectStatus': instance.approveRejectStatus,
      'litigationRequestShortDto': instance.litigationRequestShortDto,
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
      fax: json['fax'] as String?,
      homeTelephone: json['homeTelephone'] as String?,
      workTelephone: json['workTelephone'] as String?,
      email: json['email'] as String?,
      id: json['id'] as String?,
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

SecondPartyCitizen _$SecondPartyCitizenFromJson(Map<String, dynamic> json) =>
    SecondPartyCitizen(
      identityNumber: json['identityNumber'] as String?,
      fullName: json['fullName'] as String?,
      mobile: json['mobile'] as String?,
      fax: json['fax'] as String?,
      homeTelephone: json['homeTelephone'] as String?,
      workTelephone: json['workTelephone'] as String?,
      email: json['email'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SecondPartyCitizenToJson(SecondPartyCitizen instance) =>
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
      secondPartyFacility: json['secondPartyFacility'] == null
          ? null
          : SecondPartyFacility.fromJson(
              json['secondPartyFacility'] as Map<String, dynamic>),
      contractFile: json['contractFile'] == null
          ? null
          : ContractFile.fromJson(json['contractFile'] as Map<String, dynamic>),
      litigationRequestContractType: json['litigationRequestContractType'] ==
              null
          ? null
          : LitigationRequestContractType.fromJson(
              json['litigationRequestContractType'] as Map<String, dynamic>),
      id: json['id'] as String?,
    )..secondPartyCitizen = json['secondPartyCitizen'] == null
        ? null
        : SecondPartyCitizen.fromJson(
            json['secondPartyCitizen'] as Map<String, dynamic>);

Map<String, dynamic> _$ContractToJson(Contract instance) => <String, dynamic>{
      'litigationRequestContractTypeId':
          instance.litigationRequestContractTypeId,
      'contractKey': instance.contractKey,
      'versionNumber': instance.versionNumber,
      'firstPartyCapacity': instance.firstPartyCapacity,
      'secondPartyCapacity': instance.secondPartyCapacity,
      'firstPartyCitizen': instance.firstPartyCitizen,
      'secondPartyFacility': instance.secondPartyFacility,
      'secondPartyCitizen': instance.secondPartyCitizen,
      'contractFile': instance.contractFile,
      'litigationRequestContractType': instance.litigationRequestContractType,
      'id': instance.id,
    };

SecondPartyFacility _$SecondPartyFacilityFromJson(Map<String, dynamic> json) =>
    SecondPartyFacility(
      id: json['id'] as String?,
      code: json['code'] as String?,
      arabicFacilityName: json['arabicFacilityName'] as String?,
      englishFacilityName: json['englishFacilityName'] as String?,
      facility700Number: json['facility700Number'] as String?,
      commercialRegisterNumber: json['commercialRegisterNumber'] as String?,
    );

Map<String, dynamic> _$SecondPartyFacilityToJson(
        SecondPartyFacility instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'arabicFacilityName': instance.arabicFacilityName,
      'englishFacilityName': instance.englishFacilityName,
      'facility700Number': instance.facility700Number,
      'commercialRegisterNumber': instance.commercialRegisterNumber,
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
