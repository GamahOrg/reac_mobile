// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaimDetailsModel _$ClaimDetailsModelFromJson(Map<String, dynamic> json) =>
    ClaimDetailsModel(
      requestCode: json['requestCode'] as String?,
      litigationRequestStage: (json['litigationRequestStage'] as num?)?.toInt(),
      contractId: json['contractId'] as String?,
      cityId: json['cityId'] as String?,
      areaId: json['areaId'] as String?,
      contractAddress: json['contractAddress'] as String?,
      applicantCitizenId: json['applicantCitizenId'] as String?,
      internalStatusId: (json['internalStatusId'] as num?)?.toInt(),
      externalStatusId: (json['externalStatusId'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      isFinancialLitigation: json['isFinancialLitigation'] as bool?,
      fees: (json['fees'] as num?)?.toInt(),
      arbitratorsCount: (json['arbitratorsCount'] as num?)?.toInt(),
      reconciliationPeriod: (json['reconciliationPeriod'] as num?)?.toInt(),
      isPaid: json['isPaid'] as bool?,
      createdOn: json['createdOn'] as String?,
      isSent: json['isSent'] as bool?,
      sentOn: json['sentOn'] as String?,
      isActive: json['isActive'] as bool?,
      isFinished: json['isFinished'] as bool?,
      isExemptionReduction: json['isExemptionReduction'] as bool?,
      applicantCitizen: json['applicantCitizen'] == null
          ? null
          : ApplicantCitizen.fromJson(
              json['applicantCitizen'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      area: json['area'] == null
          ? null
          : Area.fromJson(json['area'] as Map<String, dynamic>),
      contract: json['contract'] == null
          ? null
          : Contract.fromJson(json['contract'] as Map<String, dynamic>),
      litigationRequestCategory: json['litigationRequestCategory'] == null
          ? null
          : LitigationRequestCategory.fromJson(
              json['litigationRequestCategory'] as Map<String, dynamic>),
      litigationRequestSessions:
          json['litigationRequestSessions'] as List<dynamic>?,
      litigationRequestReformerAssigningRequests:
          json['litigationRequestReformerAssigningRequests'] as List<dynamic>?,
      litigationRequestArbitratorAssigningRequests:
          json['litigationRequestArbitratorAssigningRequests']
              as List<dynamic>?,
      litigationRequestCorrespondences:
          json['litigationRequestCorrespondences'] as List<dynamic>?,
      litigationRequestExtendPeriodRequests:
          json['litigationRequestExtendPeriodRequests'] as List<dynamic>?,
      litigationRequestArbitrationReports:
          json['litigationRequestArbitrationReports'] as List<dynamic>?,
      litigationRequestArbitratorRecusalRequests:
          json['litigationRequestArbitratorRecusalRequests'] as List<dynamic>?,
      litigationRequestGrounds:
          (json['litigationRequestGrounds'] as List<dynamic>?)
              ?.map((e) =>
                  LitigationRequestGrounds.fromJson(e as Map<String, dynamic>))
              .toList(),
      litigationRequestReconciliationReports:
          json['litigationRequestReconciliationReports'] as List<dynamic>?,
      litigationRequestNotes: json['litigationRequestNotes'] as List<dynamic>?,
      litigationRequestArbitratorLists:
          json['litigationRequestArbitratorLists'] as List<dynamic>?,
      litigationRequestArbitratorNominationLists:
          json['litigationRequestArbitratorNominationLists'] as List<dynamic>?,
      litigationRequestArbitratorsChairmanNominationLists:
          json['litigationRequestArbitratorsChairmanNominationLists']
              as List<dynamic>?,
      litigationRequestRequests:
          (json['litigationRequestRequests'] as List<dynamic>?)
              ?.map((e) =>
                  LitigationRequestRequests.fromJson(e as Map<String, dynamic>))
              .toList(),
      workFlowProcessingLogs: json['workFlowProcessingLogs'] as List<dynamic>?,
      id: json['id'] as String?,
    )
      ..isAllowEdit = json['isAllowEdit'] as bool?
      ..litigationRequestAmount = json['litigationRequestAmount'] == null
          ? null
          : LitigationRequestAmount.fromJson(
              json['litigationRequestAmount'] as Map<String, dynamic>);

Map<String, dynamic> _$ClaimDetailsModelToJson(ClaimDetailsModel instance) =>
    <String, dynamic>{
      'requestCode': instance.requestCode,
      'litigationRequestStage': instance.litigationRequestStage,
      'contractId': instance.contractId,
      'cityId': instance.cityId,
      'areaId': instance.areaId,
      'arbitratorsCount': instance.arbitratorsCount,
      'contractAddress': instance.contractAddress,
      'applicantCitizenId': instance.applicantCitizenId,
      'isAllowEdit': instance.isAllowEdit,
      'internalStatusId': instance.internalStatusId,
      'externalStatusId': instance.externalStatusId,
      'title': instance.title,
      'description': instance.description,
      'isFinancialLitigation': instance.isFinancialLitigation,
      'fees': instance.fees,
      'reconciliationPeriod': instance.reconciliationPeriod,
      'isPaid': instance.isPaid,
      'createdOn': instance.createdOn,
      'isSent': instance.isSent,
      'sentOn': instance.sentOn,
      'isActive': instance.isActive,
      'isFinished': instance.isFinished,
      'isExemptionReduction': instance.isExemptionReduction,
      'applicantCitizen': instance.applicantCitizen,
      'city': instance.city,
      'area': instance.area,
      'contract': instance.contract,
      'litigationRequestCategory': instance.litigationRequestCategory,
      'litigationRequestAmount': instance.litigationRequestAmount,
      'litigationRequestSessions': instance.litigationRequestSessions,
      'litigationRequestReformerAssigningRequests':
          instance.litigationRequestReformerAssigningRequests,
      'litigationRequestArbitratorAssigningRequests':
          instance.litigationRequestArbitratorAssigningRequests,
      'litigationRequestCorrespondences':
          instance.litigationRequestCorrespondences,
      'litigationRequestExtendPeriodRequests':
          instance.litigationRequestExtendPeriodRequests,
      'litigationRequestArbitrationReports':
          instance.litigationRequestArbitrationReports,
      'litigationRequestArbitratorRecusalRequests':
          instance.litigationRequestArbitratorRecusalRequests,
      'litigationRequestGrounds': instance.litigationRequestGrounds,
      'litigationRequestReconciliationReports':
          instance.litigationRequestReconciliationReports,
      'litigationRequestNotes': instance.litigationRequestNotes,
      'litigationRequestArbitratorLists':
          instance.litigationRequestArbitratorLists,
      'litigationRequestArbitratorNominationLists':
          instance.litigationRequestArbitratorNominationLists,
      'litigationRequestArbitratorsChairmanNominationLists':
          instance.litigationRequestArbitratorsChairmanNominationLists,
      'litigationRequestRequests': instance.litigationRequestRequests,
      'workFlowProcessingLogs': instance.workFlowProcessingLogs,
      'id': instance.id,
    };

LitigationRequestAmount _$LitigationRequestAmountFromJson(
        Map<String, dynamic> json) =>
    LitigationRequestAmount(
      id: json['id'] as String?,
      litigationAmount: json['litigationAmount'] as String?,
      fee: json['fee'] as String?,
    );

Map<String, dynamic> _$LitigationRequestAmountToJson(
        LitigationRequestAmount instance) =>
    <String, dynamic>{
      'fee': instance.fee,
      'litigationAmount': instance.litigationAmount,
      'id': instance.id,
    };

SecondPartyFacility _$SecondPartyFacilityFromJson(Map<String, dynamic> json) =>
    SecondPartyFacility(
      id: json['id'] as String?,
      email: json['email'] as String?,
      city: json['city'] as String?,
      code: json['code'] as String?,
      district: json['district'] as String?,
      arabicFacilityName: json['arabicFacilityName'] as String?,
      buildingNumber: json['buildingNumber'] as String?,
      citizenId: json['citizenId'] as String?,
      commercialRegisterNumber: json['commercialRegisterNumber'] as String?,
      englishFacilityName: json['englishFacilityName'] as String?,
      facility700Number: json['facility700Number'] as String?,
      street: json['street'] as String?,
      subNumber: json['subNumber'] as String?,
      unitNumber: json['unitNumber'] as String?,
    );

Map<String, dynamic> _$SecondPartyFacilityToJson(
        SecondPartyFacility instance) =>
    <String, dynamic>{
      'code': instance.code,
      'citizenId': instance.citizenId,
      'commercialRegisterNumber': instance.commercialRegisterNumber,
      'facility700Number': instance.facility700Number,
      'arabicFacilityName': instance.arabicFacilityName,
      'englishFacilityName': instance.englishFacilityName,
      'email': instance.email,
      'city': instance.city,
      'district': instance.district,
      'street': instance.street,
      'subNumber': instance.subNumber,
      'buildingNumber': instance.buildingNumber,
      'unitNumber': instance.unitNumber,
      'id': instance.id,
    };

ApplicantCitizen _$ApplicantCitizenFromJson(Map<String, dynamic> json) =>
    ApplicantCitizen(
      identityNumber: json['identityNumber'] as String?,
      fullName: json['fullName'] as String?,
      nationalityId: json['nationalityId'] as String?,
      shortName: json['shortName'] as String?,
      birthDate: json['birthDate'] as String?,
      genderId: (json['genderId'] as num?)?.toInt(),
      identityExpiryDate: json['identityExpiryDate'] as String?,
      code: json['code'] as String?,
      identityTypeId: (json['identityTypeId'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      passCitizenId: json['passCitizenId'] as String?,
      identityFileId: json['identityFileId'] as String?,
      employer: json['employer'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      areaId: json['areaId'] as String?,
      cityId: json['cityId'] as String?,
      district: json['district'] as String?,
      street: json['street'] as String?,
      subNumber: json['subNumber'] as String?,
      buildingNumber: json['buildingNumber'] as String?,
      unitNumber: json['unitNumber'] as String?,
      isLawyer: json['isLawyer'] as bool?,
      isReformer: json['isReformer'] as bool?,
      reformerStatusId: (json['reformerStatusId'] as num?)?.toInt(),
      isArbitrator: json['isArbitrator'] as bool?,
      arbitratorStatusId: (json['arbitratorStatusId'] as num?)?.toInt(),
      litigationRequestArbitratorsChairmanNominationListArbitratorValues: json[
              'litigationRequestArbitratorsChairmanNominationListArbitratorValues']
          as List<dynamic>?,
      litigationRequestArbitratorRecusalRequests:
          json['litigationRequestArbitratorRecusalRequests'] as List<dynamic>?,
      litigationRequestArbitratorsChairmanNominationListChairmanValues: json[
              'litigationRequestArbitratorsChairmanNominationListChairmanValues']
          as List<dynamic>?,
      facilities: json['facilities'] as List<dynamic>?,
      fromDelegators: json['fromDelegators'] as List<dynamic>?,
      reformerStopFreeUpDecisions:
          json['reformerStopFreeUpDecisions'] as List<dynamic>?,
      arbitratorStopFreeUpDecisions:
          json['arbitratorStopFreeUpDecisions'] as List<dynamic>?,
      toDelegators: json['toDelegators'] as List<dynamic>?,
      citizenRequests: json['citizenRequests'] as List<dynamic>?,
      litigationRequestArbitratorLists:
          json['litigationRequestArbitratorLists'] as List<dynamic>?,
      litigationRequestArbitratorNominationLists:
          json['litigationRequestArbitratorNominationLists'] as List<dynamic>?,
      litigationRequestArbitratorsChairmanNominationLists:
          json['litigationRequestArbitratorsChairmanNominationLists']
              as List<dynamic>?,
      litigationRequestNotes: json['litigationRequestNotes'] as List<dynamic>?,
      citizenBankAccounts: json['citizenBankAccounts'] as List<dynamic>?,
      arbitratorLitigationRequests:
          json['arbitratorLitigationRequests'] as List<dynamic>?,
      litigationRequestArbitratorAssigningRequests:
          json['litigationRequestArbitratorAssigningRequests']
              as List<dynamic>?,
      reformerLitigationRequests:
          json['reformerLitigationRequests'] as List<dynamic>?,
      litigationRequestContractFirstPartyCitizens:
          (json['litigationRequestContractFirstPartyCitizens']
                  as List<dynamic>?)
              ?.map((e) => LitigationRequestContractFirstPartyCitizens.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      litigationRequestContractSecondPartyCitizens:
          json['litigationRequestContractSecondPartyCitizens']
              as List<dynamic>?,
      litigationRequestReformerAssigningRequests:
          json['litigationRequestReformerAssigningRequests'] as List<dynamic>?,
      delegatorLitigationRequests:
          json['delegatorLitigationRequests'] as List<dynamic>?,
      sysRegistrationRequestCitizens:
          json['sysRegistrationRequestCitizens'] as List<dynamic>?,
      sysRegistrationRequestSourceCitizens:
          json['sysRegistrationRequestSourceCitizens'] as List<dynamic>?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ApplicantCitizenToJson(ApplicantCitizen instance) =>
    <String, dynamic>{
      'identityNumber': instance.identityNumber,
      'fullName': instance.fullName,
      'nationalityId': instance.nationalityId,
      'shortName': instance.shortName,
      'birthDate': instance.birthDate,
      'genderId': instance.genderId,
      'identityExpiryDate': instance.identityExpiryDate,
      'code': instance.code,
      'identityTypeId': instance.identityTypeId,
      'userId': instance.userId,
      'passCitizenId': instance.passCitizenId,
      'identityFileId': instance.identityFileId,
      'employer': instance.employer,
      'mobile': instance.mobile,
      'email': instance.email,
      'areaId': instance.areaId,
      'cityId': instance.cityId,
      'district': instance.district,
      'street': instance.street,
      'subNumber': instance.subNumber,
      'buildingNumber': instance.buildingNumber,
      'unitNumber': instance.unitNumber,
      'isLawyer': instance.isLawyer,
      'isReformer': instance.isReformer,
      'reformerStatusId': instance.reformerStatusId,
      'isArbitrator': instance.isArbitrator,
      'arbitratorStatusId': instance.arbitratorStatusId,
      'litigationRequestArbitratorsChairmanNominationListArbitratorValues':
          instance
              .litigationRequestArbitratorsChairmanNominationListArbitratorValues,
      'litigationRequestArbitratorRecusalRequests':
          instance.litigationRequestArbitratorRecusalRequests,
      'litigationRequestArbitratorsChairmanNominationListChairmanValues':
          instance
              .litigationRequestArbitratorsChairmanNominationListChairmanValues,
      'facilities': instance.facilities,
      'fromDelegators': instance.fromDelegators,
      'reformerStopFreeUpDecisions': instance.reformerStopFreeUpDecisions,
      'arbitratorStopFreeUpDecisions': instance.arbitratorStopFreeUpDecisions,
      'toDelegators': instance.toDelegators,
      'citizenRequests': instance.citizenRequests,
      'litigationRequestArbitratorLists':
          instance.litigationRequestArbitratorLists,
      'litigationRequestArbitratorNominationLists':
          instance.litigationRequestArbitratorNominationLists,
      'litigationRequestArbitratorsChairmanNominationLists':
          instance.litigationRequestArbitratorsChairmanNominationLists,
      'litigationRequestNotes': instance.litigationRequestNotes,
      'citizenBankAccounts': instance.citizenBankAccounts,
      'arbitratorLitigationRequests': instance.arbitratorLitigationRequests,
      'litigationRequestArbitratorAssigningRequests':
          instance.litigationRequestArbitratorAssigningRequests,
      'reformerLitigationRequests': instance.reformerLitigationRequests,
      'litigationRequestContractFirstPartyCitizens':
          instance.litigationRequestContractFirstPartyCitizens,
      'litigationRequestContractSecondPartyCitizens':
          instance.litigationRequestContractSecondPartyCitizens,
      'litigationRequestReformerAssigningRequests':
          instance.litigationRequestReformerAssigningRequests,
      'delegatorLitigationRequests': instance.delegatorLitigationRequests,
      'sysRegistrationRequestCitizens': instance.sysRegistrationRequestCitizens,
      'sysRegistrationRequestSourceCitizens':
          instance.sysRegistrationRequestSourceCitizens,
      'id': instance.id,
    };

Nationality _$NationalityFromJson(Map<String, dynamic> json) => Nationality(
      nationalityName: json['nationalityName'] as String?,
      nationalityCode: (json['nationalityCode'] as num?)?.toInt(),
      createdBy: json['createdBy'] as String?,
      createdOn: json['createdOn'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$NationalityToJson(Nationality instance) =>
    <String, dynamic>{
      'nationalityName': instance.nationalityName,
      'nationalityCode': instance.nationalityCode,
      'createdBy': instance.createdBy,
      'createdOn': instance.createdOn,
      'isDeleted': instance.isDeleted,
      'id': instance.id,
    };

LitigationRequestContractSecondPartyCitizens
    _$LitigationRequestContractSecondPartyCitizensFromJson(
            Map<String, dynamic> json) =>
        LitigationRequestContractSecondPartyCitizens(
          litigationRequestContractTypeId:
              (json['litigationRequestContractTypeId'] as num?)?.toInt(),
          contractKey: json['contractKey'] as String?,
          versionNumber: json['versionNumber'] as String?,
          contractFileId: json['contractFileId'] as String?,
          firstPartyCitizenId: json['firstPartyCitizenId'] as String?,
          firstPartyCapacity: json['firstPartyCapacity'] as String?,
          secondPartyCitizenId: json['secondPartyCitizenId'] as String?,
          secondPartyCapacity: json['secondPartyCapacity'] as String?,
          contractFile: json['contractFile'] == null
              ? null
              : ContractFile.fromJson(
                  json['contractFile'] as Map<String, dynamic>),
          id: json['id'] as String?,
        );

Map<String, dynamic> _$LitigationRequestContractSecondPartyCitizensToJson(
        LitigationRequestContractSecondPartyCitizens instance) =>
    <String, dynamic>{
      'litigationRequestContractTypeId':
          instance.litigationRequestContractTypeId,
      'contractKey': instance.contractKey,
      'versionNumber': instance.versionNumber,
      'contractFileId': instance.contractFileId,
      'firstPartyCitizenId': instance.firstPartyCitizenId,
      'firstPartyCapacity': instance.firstPartyCapacity,
      'secondPartyCitizenId': instance.secondPartyCitizenId,
      'secondPartyCapacity': instance.secondPartyCapacity,
      'contractFile': instance.contractFile,
      'id': instance.id,
    };

ContractFile _$ContractFileFromJson(Map<String, dynamic> json) => ContractFile(
      fileDescription: json['fileDescription'] as String?,
      filePath: json['filePath'] as String?,
      fileType: json['fileType'] as String?,
      litigationRequestArbitratorRecusalRequestFiles:
          json['litigationRequestArbitratorRecusalRequestFiles']
              as List<dynamic>?,
      litigationRequestArbitrationReportExplanationRequestFiles:
          json['litigationRequestArbitrationReportExplanationRequestFiles']
              as List<dynamic>?,
      indentityCitizens: json['indentityCitizens'] as List<dynamic>?,
      lawLicenseCitizens: json['lawLicenseCitizens'] as List<dynamic>?,
      citizenRequestExperienceCertificateFiles:
          json['citizenRequestExperienceCertificateFiles'] as List<dynamic>?,
      citizenRequestFreelanceWorkDocumentFiles:
          json['citizenRequestFreelanceWorkDocumentFiles'] as List<dynamic>?,
      exemptionReductionCategoryFiles:
          json['exemptionReductionCategoryFiles'] as List<dynamic>?,
      workFlowProcessingLogFiles:
          json['workFlowProcessingLogFiles'] as List<dynamic>?,
      associationRegistrationCertificateContracts:
          json['associationRegistrationCertificateContracts'] as List<dynamic>?,
      foundingLetterContracts:
          json['foundingLetterContracts'] as List<dynamic>?,
      internalRegulationsContracts:
          json['internalRegulationsContracts'] as List<dynamic>?,
      citizenRequestAcademicDegreeFiles:
          json['citizenRequestAcademicDegreeFiles'] as List<dynamic>?,
      delegators: json['delegators'] as List<dynamic>?,
      delegationRequests: json['delegationRequests'] as List<dynamic>?,
      litigationRequestCorrespondenceFiles:
          json['litigationRequestCorrespondenceFiles'] as List<dynamic>?,
      litigationRequestExtendPeriodRequestFiles:
          json['litigationRequestExtendPeriodRequestFiles'] as List<dynamic>?,
      litigationRequestGroundFiles:
          json['litigationRequestGroundFiles'] as List<dynamic>?,
      litigationRequestNoteFiles:
          json['litigationRequestNoteFiles'] as List<dynamic>?,
      litigationRequestRequestFiles:
          json['litigationRequestRequestFiles'] as List<dynamic>?,
      createdBy: json['createdBy'] as String?,
      createdOn: json['createdOn'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ContractFileToJson(ContractFile instance) =>
    <String, dynamic>{
      'fileDescription': instance.fileDescription,
      'filePath': instance.filePath,
      'fileType': instance.fileType,
      'litigationRequestArbitratorRecusalRequestFiles':
          instance.litigationRequestArbitratorRecusalRequestFiles,
      'litigationRequestArbitrationReportExplanationRequestFiles':
          instance.litigationRequestArbitrationReportExplanationRequestFiles,
      'indentityCitizens': instance.indentityCitizens,
      'lawLicenseCitizens': instance.lawLicenseCitizens,
      'citizenRequestExperienceCertificateFiles':
          instance.citizenRequestExperienceCertificateFiles,
      'citizenRequestFreelanceWorkDocumentFiles':
          instance.citizenRequestFreelanceWorkDocumentFiles,
      'exemptionReductionCategoryFiles':
          instance.exemptionReductionCategoryFiles,
      'workFlowProcessingLogFiles': instance.workFlowProcessingLogFiles,
      'associationRegistrationCertificateContracts':
          instance.associationRegistrationCertificateContracts,
      'foundingLetterContracts': instance.foundingLetterContracts,
      'internalRegulationsContracts': instance.internalRegulationsContracts,
      'citizenRequestAcademicDegreeFiles':
          instance.citizenRequestAcademicDegreeFiles,
      'delegators': instance.delegators,
      'delegationRequests': instance.delegationRequests,
      'litigationRequestCorrespondenceFiles':
          instance.litigationRequestCorrespondenceFiles,
      'litigationRequestExtendPeriodRequestFiles':
          instance.litigationRequestExtendPeriodRequestFiles,
      'litigationRequestGroundFiles': instance.litigationRequestGroundFiles,
      'litigationRequestNoteFiles': instance.litigationRequestNoteFiles,
      'litigationRequestRequestFiles': instance.litigationRequestRequestFiles,
      'createdBy': instance.createdBy,
      'createdOn': instance.createdOn,
      'id': instance.id,
    };

LitigationRequestContractFirstPartyCitizens
    _$LitigationRequestContractFirstPartyCitizensFromJson(
            Map<String, dynamic> json) =>
        LitigationRequestContractFirstPartyCitizens(
          litigationRequestContractTypeId:
              (json['litigationRequestContractTypeId'] as num?)?.toInt(),
          contractKey: json['contractKey'] as String?,
          versionNumber: json['versionNumber'] as String?,
          contractFileId: json['contractFileId'] as String?,
          firstPartyCitizenId: json['firstPartyCitizenId'] as String?,
          firstPartyCapacity: json['firstPartyCapacity'] as String?,
          secondPartyCitizenId: json['secondPartyCitizenId'] as String?,
          secondPartyCapacity: json['secondPartyCapacity'] as String?,
          contractFile: json['contractFile'] == null
              ? null
              : ContractFile.fromJson(
                  json['contractFile'] as Map<String, dynamic>),
          secondPartyCitizen: json['secondPartyCitizen'] == null
              ? null
              : SecondPartyCitizen.fromJson(
                  json['secondPartyCitizen'] as Map<String, dynamic>),
          id: json['id'] as String?,
        );

Map<String, dynamic> _$LitigationRequestContractFirstPartyCitizensToJson(
        LitigationRequestContractFirstPartyCitizens instance) =>
    <String, dynamic>{
      'litigationRequestContractTypeId':
          instance.litigationRequestContractTypeId,
      'contractKey': instance.contractKey,
      'versionNumber': instance.versionNumber,
      'contractFileId': instance.contractFileId,
      'firstPartyCitizenId': instance.firstPartyCitizenId,
      'firstPartyCapacity': instance.firstPartyCapacity,
      'secondPartyCitizenId': instance.secondPartyCitizenId,
      'secondPartyCapacity': instance.secondPartyCapacity,
      'contractFile': instance.contractFile,
      'secondPartyCitizen': instance.secondPartyCitizen,
      'id': instance.id,
    };

SecondPartyCitizen _$SecondPartyCitizenFromJson(Map<String, dynamic> json) =>
    SecondPartyCitizen(
      identityNumber: json['identityNumber'] as String?,
      fullName: json['fullName'] as String?,
      nationalityId: json['nationalityId'] as String?,
      shortName: json['shortName'] as String?,
      birthDate: json['birthDate'] as String?,
      genderId: (json['genderId'] as num?)?.toInt(),
      identityExpiryDate: json['identityExpiryDate'] as String?,
      code: json['code'] as String?,
      identityTypeId: (json['identityTypeId'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      passCitizenId: json['passCitizenId'] as String?,
      identityFileId: json['identityFileId'] as String?,
      employer: json['employer'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      areaId: json['areaId'] as String?,
      cityId: json['cityId'] as String?,
      district: json['district'] as String?,
      street: json['street'] as String?,
      subNumber: json['subNumber'] as String?,
      buildingNumber: json['buildingNumber'] as String?,
      unitNumber: json['unitNumber'] as String?,
      isLawyer: json['isLawyer'] as bool?,
      isReformer: json['isReformer'] as bool?,
      isArbitrator: json['isArbitrator'] as bool?,
      arbitratorStatusId: (json['arbitratorStatusId'] as num?)?.toInt(),
      litigationRequestArbitratorsChairmanNominationListArbitratorValues: json[
              'litigationRequestArbitratorsChairmanNominationListArbitratorValues']
          as List<dynamic>?,
      litigationRequestArbitratorRecusalRequests:
          json['litigationRequestArbitratorRecusalRequests'] as List<dynamic>?,
      litigationRequestArbitratorsChairmanNominationListChairmanValues: json[
              'litigationRequestArbitratorsChairmanNominationListChairmanValues']
          as List<dynamic>?,
      facilities: json['facilities'] as List<dynamic>?,
      fromDelegators: json['fromDelegators'] as List<dynamic>?,
      reformerStopFreeUpDecisions:
          json['reformerStopFreeUpDecisions'] as List<dynamic>?,
      arbitratorStopFreeUpDecisions:
          json['arbitratorStopFreeUpDecisions'] as List<dynamic>?,
      toDelegators: json['toDelegators'] as List<dynamic>?,
      citizenRequests: json['citizenRequests'] as List<dynamic>?,
      litigationRequestArbitratorLists:
          json['litigationRequestArbitratorLists'] as List<dynamic>?,
      litigationRequestArbitratorNominationLists:
          json['litigationRequestArbitratorNominationLists'] as List<dynamic>?,
      litigationRequestArbitratorsChairmanNominationLists:
          json['litigationRequestArbitratorsChairmanNominationLists']
              as List<dynamic>?,
      litigationRequestNotes: json['litigationRequestNotes'] as List<dynamic>?,
      citizenBankAccounts: json['citizenBankAccounts'] as List<dynamic>?,
      nationality: json['nationality'] == null
          ? null
          : Nationality.fromJson(json['nationality'] as Map<String, dynamic>),
      arbitratorLitigationRequests:
          json['arbitratorLitigationRequests'] as List<dynamic>?,
      litigationRequestArbitratorAssigningRequests:
          json['litigationRequestArbitratorAssigningRequests']
              as List<dynamic>?,
      reformerLitigationRequests:
          json['reformerLitigationRequests'] as List<dynamic>?,
      litigationRequestContractFirstPartyCitizens:
          json['litigationRequestContractFirstPartyCitizens'] as List<dynamic>?,
      litigationRequestReformerAssigningRequests:
          json['litigationRequestReformerAssigningRequests'] as List<dynamic>?,
      delegatorLitigationRequests:
          json['delegatorLitigationRequests'] as List<dynamic>?,
      litigationRequests: json['litigationRequests'] as List<dynamic>?,
      sysRegistrationRequestCitizens:
          json['sysRegistrationRequestCitizens'] as List<dynamic>?,
      sysRegistrationRequestSourceCitizens:
          json['sysRegistrationRequestSourceCitizens'] as List<dynamic>?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SecondPartyCitizenToJson(SecondPartyCitizen instance) =>
    <String, dynamic>{
      'identityNumber': instance.identityNumber,
      'fullName': instance.fullName,
      'nationalityId': instance.nationalityId,
      'shortName': instance.shortName,
      'birthDate': instance.birthDate,
      'genderId': instance.genderId,
      'identityExpiryDate': instance.identityExpiryDate,
      'code': instance.code,
      'identityTypeId': instance.identityTypeId,
      'userId': instance.userId,
      'passCitizenId': instance.passCitizenId,
      'identityFileId': instance.identityFileId,
      'employer': instance.employer,
      'mobile': instance.mobile,
      'email': instance.email,
      'areaId': instance.areaId,
      'cityId': instance.cityId,
      'district': instance.district,
      'street': instance.street,
      'subNumber': instance.subNumber,
      'buildingNumber': instance.buildingNumber,
      'unitNumber': instance.unitNumber,
      'isLawyer': instance.isLawyer,
      'isReformer': instance.isReformer,
      'isArbitrator': instance.isArbitrator,
      'arbitratorStatusId': instance.arbitratorStatusId,
      'litigationRequestArbitratorsChairmanNominationListArbitratorValues':
          instance
              .litigationRequestArbitratorsChairmanNominationListArbitratorValues,
      'litigationRequestArbitratorRecusalRequests':
          instance.litigationRequestArbitratorRecusalRequests,
      'litigationRequestArbitratorsChairmanNominationListChairmanValues':
          instance
              .litigationRequestArbitratorsChairmanNominationListChairmanValues,
      'facilities': instance.facilities,
      'fromDelegators': instance.fromDelegators,
      'reformerStopFreeUpDecisions': instance.reformerStopFreeUpDecisions,
      'arbitratorStopFreeUpDecisions': instance.arbitratorStopFreeUpDecisions,
      'toDelegators': instance.toDelegators,
      'citizenRequests': instance.citizenRequests,
      'litigationRequestArbitratorLists':
          instance.litigationRequestArbitratorLists,
      'litigationRequestArbitratorNominationLists':
          instance.litigationRequestArbitratorNominationLists,
      'litigationRequestArbitratorsChairmanNominationLists':
          instance.litigationRequestArbitratorsChairmanNominationLists,
      'litigationRequestNotes': instance.litigationRequestNotes,
      'citizenBankAccounts': instance.citizenBankAccounts,
      'nationality': instance.nationality,
      'arbitratorLitigationRequests': instance.arbitratorLitigationRequests,
      'litigationRequestArbitratorAssigningRequests':
          instance.litigationRequestArbitratorAssigningRequests,
      'reformerLitigationRequests': instance.reformerLitigationRequests,
      'litigationRequestContractFirstPartyCitizens':
          instance.litigationRequestContractFirstPartyCitizens,
      'litigationRequestReformerAssigningRequests':
          instance.litigationRequestReformerAssigningRequests,
      'delegatorLitigationRequests': instance.delegatorLitigationRequests,
      'litigationRequests': instance.litigationRequests,
      'sysRegistrationRequestCitizens': instance.sysRegistrationRequestCitizens,
      'sysRegistrationRequestSourceCitizens':
          instance.sysRegistrationRequestSourceCitizens,
      'id': instance.id,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      cityName: json['cityName'] as String?,
      areaId: json['areaId'] as String?,
      area: json['area'] == null
          ? null
          : Area.fromJson(json['area'] as Map<String, dynamic>),
      translations: json['translations'] as List<dynamic>?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'areaId': instance.areaId,
      'area': instance.area,
      'translations': instance.translations,
      'id': instance.id,
    };

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      areaName: json['areaName'] as String?,
      citizenRequests: json['citizenRequests'] as List<dynamic>?,
      translations: json['translations'] as List<dynamic>?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'areaName': instance.areaName,
      'citizenRequests': instance.citizenRequests,
      'translations': instance.translations,
      'id': instance.id,
    };

Contract _$ContractFromJson(Map<String, dynamic> json) => Contract(
      litigationRequestContractTypeId:
          (json['litigationRequestContractTypeId'] as num?)?.toInt(),
      contractKey: json['contractKey'] as String?,
      versionNumber: json['versionNumber'] as String?,
      contractFileId: json['contractFileId'] as String?,
      firstPartyCitizenId: json['firstPartyCitizenId'] as String?,
      firstPartyCapacity: json['firstPartyCapacity'] as String?,
      secondPartyCitizenId: json['secondPartyCitizenId'] as String?,
      secondPartyCapacity: json['secondPartyCapacity'] as String?,
      firstPartyCitizen: json['firstPartyCitizen'] == null
          ? null
          : FirstPartyCitizen.fromJson(
              json['firstPartyCitizen'] as Map<String, dynamic>),
      contractFile: json['contractFile'] == null
          ? null
          : ContractFile.fromJson(json['contractFile'] as Map<String, dynamic>),
      secondPartyCitizen: json['secondPartyCitizen'] == null
          ? null
          : SecondPartyCitizen.fromJson(
              json['secondPartyCitizen'] as Map<String, dynamic>),
      secondPartyFacility: json['secondPartyFacility'] == null
          ? null
          : SecondPartyFacility.fromJson(
              json['secondPartyFacility'] as Map<String, dynamic>),
      associationRegistrationCertificateFile:
          json['associationRegistrationCertificateFile'] == null
              ? null
              : AssociationRegistrationCertificateFile.fromJson(
                  json['associationRegistrationCertificateFile']
                      as Map<String, dynamic>),
      internalRegulationsFile: json['internalRegulationsFile'] == null
          ? null
          : InternalRegulationsFile.fromJson(
              json['internalRegulationsFile'] as Map<String, dynamic>),
      foundingLetterFile: json['foundingLetterFile'] == null
          ? null
          : FoundingLetterFile.fromJson(
              json['foundingLetterFile'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ContractToJson(Contract instance) => <String, dynamic>{
      'litigationRequestContractTypeId':
          instance.litigationRequestContractTypeId,
      'contractKey': instance.contractKey,
      'versionNumber': instance.versionNumber,
      'contractFileId': instance.contractFileId,
      'firstPartyCitizenId': instance.firstPartyCitizenId,
      'firstPartyCapacity': instance.firstPartyCapacity,
      'secondPartyCitizenId': instance.secondPartyCitizenId,
      'secondPartyCapacity': instance.secondPartyCapacity,
      'secondPartyFacility': instance.secondPartyFacility,
      'firstPartyCitizen': instance.firstPartyCitizen,
      'contractFile': instance.contractFile,
      'secondPartyCitizen': instance.secondPartyCitizen,
      'associationRegistrationCertificateFile':
          instance.associationRegistrationCertificateFile,
      'foundingLetterFile': instance.foundingLetterFile,
      'internalRegulationsFile': instance.internalRegulationsFile,
      'id': instance.id,
    };

AssociationRegistrationCertificateFile
    _$AssociationRegistrationCertificateFileFromJson(
            Map<String, dynamic> json) =>
        AssociationRegistrationCertificateFile(
          filePath: json['filePath'] as String?,
          fileType: json['fileType'] as String?,
          fileDescription: json['fileDescription'] as String?,
        );

Map<String, dynamic> _$AssociationRegistrationCertificateFileToJson(
        AssociationRegistrationCertificateFile instance) =>
    <String, dynamic>{
      'fileDescription': instance.fileDescription,
      'filePath': instance.filePath,
      'fileType': instance.fileType,
    };

FoundingLetterFile _$FoundingLetterFileFromJson(Map<String, dynamic> json) =>
    FoundingLetterFile(
      filePath: json['filePath'] as String?,
      fileType: json['fileType'] as String?,
      fileDescription: json['fileDescription'] as String?,
    );

Map<String, dynamic> _$FoundingLetterFileToJson(FoundingLetterFile instance) =>
    <String, dynamic>{
      'fileDescription': instance.fileDescription,
      'filePath': instance.filePath,
      'fileType': instance.fileType,
    };

InternalRegulationsFile _$InternalRegulationsFileFromJson(
        Map<String, dynamic> json) =>
    InternalRegulationsFile(
      filePath: json['filePath'] as String?,
      fileType: json['fileType'] as String?,
      fileDescription: json['fileDescription'] as String?,
    );

Map<String, dynamic> _$InternalRegulationsFileToJson(
        InternalRegulationsFile instance) =>
    <String, dynamic>{
      'fileDescription': instance.fileDescription,
      'filePath': instance.filePath,
      'fileType': instance.fileType,
    };

FirstPartyCitizen _$FirstPartyCitizenFromJson(Map<String, dynamic> json) =>
    FirstPartyCitizen(
      identityNumber: json['identityNumber'] as String?,
      fullName: json['fullName'] as String?,
      nationalityId: json['nationalityId'] as String?,
      shortName: json['shortName'] as String?,
      birthDate: json['birthDate'] as String?,
      genderId: (json['genderId'] as num?)?.toInt(),
      identityExpiryDate: json['identityExpiryDate'] as String?,
      code: json['code'] as String?,
      identityTypeId: (json['identityTypeId'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      passCitizenId: json['passCitizenId'] as String?,
      identityFileId: json['identityFileId'] as String?,
      employer: json['employer'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      areaId: json['areaId'] as String?,
      cityId: json['cityId'] as String?,
      district: json['district'] as String?,
      street: json['street'] as String?,
      subNumber: json['subNumber'] as String?,
      buildingNumber: json['buildingNumber'] as String?,
      unitNumber: json['unitNumber'] as String?,
      isLawyer: json['isLawyer'] as bool?,
      isReformer: json['isReformer'] as bool?,
      reformerStatusId: (json['reformerStatusId'] as num?)?.toInt(),
      isArbitrator: json['isArbitrator'] as bool?,
      arbitratorStatusId: (json['arbitratorStatusId'] as num?)?.toInt(),
      litigationRequestArbitratorsChairmanNominationListArbitratorValues: json[
              'litigationRequestArbitratorsChairmanNominationListArbitratorValues']
          as List<dynamic>?,
      litigationRequestArbitratorRecusalRequests:
          json['litigationRequestArbitratorRecusalRequests'] as List<dynamic>?,
      litigationRequestArbitratorsChairmanNominationListChairmanValues: json[
              'litigationRequestArbitratorsChairmanNominationListChairmanValues']
          as List<dynamic>?,
      facilities: json['facilities'] as List<dynamic>?,
      fromDelegators: json['fromDelegators'] as List<dynamic>?,
      reformerStopFreeUpDecisions:
          json['reformerStopFreeUpDecisions'] as List<dynamic>?,
      arbitratorStopFreeUpDecisions:
          json['arbitratorStopFreeUpDecisions'] as List<dynamic>?,
      toDelegators: json['toDelegators'] as List<dynamic>?,
      nationality: json['nationality'] == null
          ? null
          : Nationality.fromJson(json['nationality'] as Map<String, dynamic>),
      citizenRequests: json['citizenRequests'] as List<dynamic>?,
      litigationRequestArbitratorLists:
          json['litigationRequestArbitratorLists'] as List<dynamic>?,
      litigationRequestArbitratorNominationLists:
          json['litigationRequestArbitratorNominationLists'] as List<dynamic>?,
      litigationRequestArbitratorsChairmanNominationLists:
          json['litigationRequestArbitratorsChairmanNominationLists']
              as List<dynamic>?,
      litigationRequestNotes: json['litigationRequestNotes'] as List<dynamic>?,
      citizenBankAccounts: json['citizenBankAccounts'] as List<dynamic>?,
      arbitratorLitigationRequests:
          json['arbitratorLitigationRequests'] as List<dynamic>?,
      litigationRequestArbitratorAssigningRequests:
          json['litigationRequestArbitratorAssigningRequests']
              as List<dynamic>?,
      reformerLitigationRequests:
          json['reformerLitigationRequests'] as List<dynamic>?,
      litigationRequestContractSecondPartyCitizens:
          json['litigationRequestContractSecondPartyCitizens']
              as List<dynamic>?,
      litigationRequestReformerAssigningRequests:
          json['litigationRequestReformerAssigningRequests'] as List<dynamic>?,
      delegatorLitigationRequests:
          json['delegatorLitigationRequests'] as List<dynamic>?,
      sysRegistrationRequestCitizens:
          json['sysRegistrationRequestCitizens'] as List<dynamic>?,
      sysRegistrationRequestSourceCitizens:
          json['sysRegistrationRequestSourceCitizens'] as List<dynamic>?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$FirstPartyCitizenToJson(FirstPartyCitizen instance) =>
    <String, dynamic>{
      'identityNumber': instance.identityNumber,
      'fullName': instance.fullName,
      'nationalityId': instance.nationalityId,
      'shortName': instance.shortName,
      'birthDate': instance.birthDate,
      'genderId': instance.genderId,
      'identityExpiryDate': instance.identityExpiryDate,
      'code': instance.code,
      'identityTypeId': instance.identityTypeId,
      'userId': instance.userId,
      'passCitizenId': instance.passCitizenId,
      'identityFileId': instance.identityFileId,
      'employer': instance.employer,
      'mobile': instance.mobile,
      'email': instance.email,
      'areaId': instance.areaId,
      'cityId': instance.cityId,
      'district': instance.district,
      'street': instance.street,
      'subNumber': instance.subNumber,
      'buildingNumber': instance.buildingNumber,
      'unitNumber': instance.unitNumber,
      'isLawyer': instance.isLawyer,
      'isReformer': instance.isReformer,
      'reformerStatusId': instance.reformerStatusId,
      'isArbitrator': instance.isArbitrator,
      'arbitratorStatusId': instance.arbitratorStatusId,
      'litigationRequestArbitratorsChairmanNominationListArbitratorValues':
          instance
              .litigationRequestArbitratorsChairmanNominationListArbitratorValues,
      'litigationRequestArbitratorRecusalRequests':
          instance.litigationRequestArbitratorRecusalRequests,
      'litigationRequestArbitratorsChairmanNominationListChairmanValues':
          instance
              .litigationRequestArbitratorsChairmanNominationListChairmanValues,
      'facilities': instance.facilities,
      'fromDelegators': instance.fromDelegators,
      'reformerStopFreeUpDecisions': instance.reformerStopFreeUpDecisions,
      'arbitratorStopFreeUpDecisions': instance.arbitratorStopFreeUpDecisions,
      'toDelegators': instance.toDelegators,
      'citizenRequests': instance.citizenRequests,
      'litigationRequestArbitratorLists':
          instance.litigationRequestArbitratorLists,
      'litigationRequestArbitratorNominationLists':
          instance.litigationRequestArbitratorNominationLists,
      'litigationRequestArbitratorsChairmanNominationLists':
          instance.litigationRequestArbitratorsChairmanNominationLists,
      'litigationRequestNotes': instance.litigationRequestNotes,
      'citizenBankAccounts': instance.citizenBankAccounts,
      'arbitratorLitigationRequests': instance.arbitratorLitigationRequests,
      'litigationRequestArbitratorAssigningRequests':
          instance.litigationRequestArbitratorAssigningRequests,
      'reformerLitigationRequests': instance.reformerLitigationRequests,
      'litigationRequestContractSecondPartyCitizens':
          instance.litigationRequestContractSecondPartyCitizens,
      'litigationRequestReformerAssigningRequests':
          instance.litigationRequestReformerAssigningRequests,
      'delegatorLitigationRequests': instance.delegatorLitigationRequests,
      'sysRegistrationRequestCitizens': instance.sysRegistrationRequestCitizens,
      'sysRegistrationRequestSourceCitizens':
          instance.sysRegistrationRequestSourceCitizens,
      'id': instance.id,
      'nationality': instance.nationality,
    };

LitigationRequestCategory _$LitigationRequestCategoryFromJson(
        Map<String, dynamic> json) =>
    LitigationRequestCategory(
      categoryName: json['categoryName'] as String?,
      bpfId: json['bpfId'] as String?,
      translations: (json['translations'] as List<dynamic>?)
          ?.map((e) => Translations.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LitigationRequestCategoryToJson(
        LitigationRequestCategory instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'bpfId': instance.bpfId,
      'translations': instance.translations,
      'id': instance.id,
    };

Translations _$TranslationsFromJson(Map<String, dynamic> json) => Translations(
      categoryName: json['categoryName'] as String?,
      languageCode: json['languageCode'] as String?,
    );

Map<String, dynamic> _$TranslationsToJson(Translations instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'languageCode': instance.languageCode,
    };

LitigationRequestGrounds _$LitigationRequestGroundsFromJson(
        Map<String, dynamic> json) =>
    LitigationRequestGrounds(
      litigationRequestId: json['litigationRequestId'] as String?,
      title: json['title'] as String?,
      litigationRequestGroundFiles: (json['litigationRequestGroundFiles']
              as List<dynamic>?)
          ?.map((e) =>
              LitigationRequestGroundFiles.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LitigationRequestGroundsToJson(
        LitigationRequestGrounds instance) =>
    <String, dynamic>{
      'litigationRequestId': instance.litigationRequestId,
      'title': instance.title,
      'litigationRequestGroundFiles': instance.litigationRequestGroundFiles,
      'id': instance.id,
    };

LitigationRequestGroundFiles _$LitigationRequestGroundFilesFromJson(
        Map<String, dynamic> json) =>
    LitigationRequestGroundFiles(
      litigationRequestGroundId: json['litigationRequestGroundId'] as String?,
      fileManagerId: json['fileManagerId'] as String?,
      fileManager: json['fileManager'] == null
          ? null
          : FileManager.fromJson(json['fileManager'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LitigationRequestGroundFilesToJson(
        LitigationRequestGroundFiles instance) =>
    <String, dynamic>{
      'litigationRequestGroundId': instance.litigationRequestGroundId,
      'fileManagerId': instance.fileManagerId,
      'fileManager': instance.fileManager,
      'id': instance.id,
    };

FileManager _$FileManagerFromJson(Map<String, dynamic> json) => FileManager(
      fileDescription: json['fileDescription'] as String?,
      filePath: json['filePath'] as String?,
      fileType: json['fileType'] as String?,
      litigationRequestArbitratorRecusalRequestFiles:
          json['litigationRequestArbitratorRecusalRequestFiles']
              as List<dynamic>?,
      litigationRequestArbitrationReportExplanationRequestFiles:
          json['litigationRequestArbitrationReportExplanationRequestFiles']
              as List<dynamic>?,
      indentityCitizens: json['indentityCitizens'] as List<dynamic>?,
      lawLicenseCitizens: json['lawLicenseCitizens'] as List<dynamic>?,
      citizenRequestExperienceCertificateFiles:
          json['citizenRequestExperienceCertificateFiles'] as List<dynamic>?,
      citizenRequestFreelanceWorkDocumentFiles:
          json['citizenRequestFreelanceWorkDocumentFiles'] as List<dynamic>?,
      exemptionReductionCategoryFiles:
          json['exemptionReductionCategoryFiles'] as List<dynamic>?,
      workFlowProcessingLogFiles:
          json['workFlowProcessingLogFiles'] as List<dynamic>?,
      associationRegistrationCertificateContracts:
          json['associationRegistrationCertificateContracts'] as List<dynamic>?,
      foundingLetterContracts:
          json['foundingLetterContracts'] as List<dynamic>?,
      internalRegulationsContracts:
          json['internalRegulationsContracts'] as List<dynamic>?,
      citizenRequestAcademicDegreeFiles:
          json['citizenRequestAcademicDegreeFiles'] as List<dynamic>?,
      delegators: json['delegators'] as List<dynamic>?,
      delegationRequests: json['delegationRequests'] as List<dynamic>?,
      litigationRequestContracts:
          json['litigationRequestContracts'] as List<dynamic>?,
      litigationRequestCorrespondenceFiles:
          json['litigationRequestCorrespondenceFiles'] as List<dynamic>?,
      litigationRequestExtendPeriodRequestFiles:
          json['litigationRequestExtendPeriodRequestFiles'] as List<dynamic>?,
      litigationRequestNoteFiles:
          json['litigationRequestNoteFiles'] as List<dynamic>?,
      litigationRequestRequestFiles:
          json['litigationRequestRequestFiles'] as List<dynamic>?,
      createdBy: json['createdBy'] as String?,
      createdOn: json['createdOn'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$FileManagerToJson(FileManager instance) =>
    <String, dynamic>{
      'fileDescription': instance.fileDescription,
      'filePath': instance.filePath,
      'fileType': instance.fileType,
      'litigationRequestArbitratorRecusalRequestFiles':
          instance.litigationRequestArbitratorRecusalRequestFiles,
      'litigationRequestArbitrationReportExplanationRequestFiles':
          instance.litigationRequestArbitrationReportExplanationRequestFiles,
      'indentityCitizens': instance.indentityCitizens,
      'lawLicenseCitizens': instance.lawLicenseCitizens,
      'citizenRequestExperienceCertificateFiles':
          instance.citizenRequestExperienceCertificateFiles,
      'citizenRequestFreelanceWorkDocumentFiles':
          instance.citizenRequestFreelanceWorkDocumentFiles,
      'exemptionReductionCategoryFiles':
          instance.exemptionReductionCategoryFiles,
      'workFlowProcessingLogFiles': instance.workFlowProcessingLogFiles,
      'associationRegistrationCertificateContracts':
          instance.associationRegistrationCertificateContracts,
      'foundingLetterContracts': instance.foundingLetterContracts,
      'internalRegulationsContracts': instance.internalRegulationsContracts,
      'citizenRequestAcademicDegreeFiles':
          instance.citizenRequestAcademicDegreeFiles,
      'delegators': instance.delegators,
      'delegationRequests': instance.delegationRequests,
      'litigationRequestContracts': instance.litigationRequestContracts,
      'litigationRequestCorrespondenceFiles':
          instance.litigationRequestCorrespondenceFiles,
      'litigationRequestExtendPeriodRequestFiles':
          instance.litigationRequestExtendPeriodRequestFiles,
      'litigationRequestNoteFiles': instance.litigationRequestNoteFiles,
      'litigationRequestRequestFiles': instance.litigationRequestRequestFiles,
      'createdBy': instance.createdBy,
      'createdOn': instance.createdOn,
      'id': instance.id,
    };

LitigationRequestRequests _$LitigationRequestRequestsFromJson(
        Map<String, dynamic> json) =>
    LitigationRequestRequests(
      litigationRequestId: json['litigationRequestId'] as String?,
      requestContent: json['requestContent'] as String?,
      litigationRequestRequestFiles:
          json['litigationRequestRequestFiles'] as List<dynamic>?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LitigationRequestRequestsToJson(
        LitigationRequestRequests instance) =>
    <String, dynamic>{
      'litigationRequestId': instance.litigationRequestId,
      'requestContent': instance.requestContent,
      'litigationRequestRequestFiles': instance.litigationRequestRequestFiles,
      'id': instance.id,
    };
