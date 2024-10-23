import 'package:json_annotation/json_annotation.dart';
part 'claim_details_model.g.dart';
@JsonSerializable()
class ClaimDetailsModel {
  ClaimDetailsModel({
    this.requestCode,
     this.litigationRequestStage,
     this.contractId,
     this.cityId,
     this.areaId,
     this.contractAddress,
     this.applicantCitizenId,
     this.internalStatusId,
     this.externalStatusId,
     this.title,
     this.description,
     this.isFinancialLitigation,
     this.fees,
    this.arbitratorsCount,
     this.reconciliationPeriod,
     this.isPaid,
     this.createdOn,
     this.isSent,
     this.sentOn,
     this.isActive,
     this.isFinished,
     this.isExemptionReduction,
     this.applicantCitizen,
     this.city,
     this.area,
     this.contract,
     this.litigationRequestCategory,
     this.litigationRequestSessions,
     this.litigationRequestReformerAssigningRequests,
     this.litigationRequestArbitratorAssigningRequests,
     this.litigationRequestCorrespondences,
     this.litigationRequestExtendPeriodRequests,
     this.litigationRequestArbitrationReports,
     this.litigationRequestArbitratorRecusalRequests,
     this.litigationRequestGrounds,
     this.litigationRequestReconciliationReports,
     this.litigationRequestNotes,
     this.litigationRequestArbitratorLists,
     this.litigationRequestArbitratorNominationLists,
     this.litigationRequestArbitratorsChairmanNominationLists,
     this.litigationRequestRequests,
     this.workFlowProcessingLogs,
     this.id,
  });
   String? requestCode;
   int? litigationRequestStage;
   String? contractId;
   String? cityId;
   String? areaId;
   int? arbitratorsCount;
   String? contractAddress;
   String? applicantCitizenId;
   bool? isAllowEdit;
   int? internalStatusId;
   int? externalStatusId;
   String? title;
   String? description;
   bool? isFinancialLitigation;
   int? fees;
   int? reconciliationPeriod;
   bool? isPaid;
   String? createdOn;
   bool? isSent;
   String? sentOn;
   bool? isActive;
   bool? isFinished;
   bool? isExemptionReduction;
   ApplicantCitizen? applicantCitizen;
   City? city;
   Area? area;
   Contract? contract;
   LitigationRequestCategory? litigationRequestCategory;
   LitigationRequestAmount? litigationRequestAmount;
   List<dynamic>? litigationRequestSessions;
   List<dynamic>? litigationRequestReformerAssigningRequests;
   List<dynamic>? litigationRequestArbitratorAssigningRequests;
   List<dynamic>? litigationRequestCorrespondences;
   List<dynamic>? litigationRequestExtendPeriodRequests;
   List<dynamic>? litigationRequestArbitrationReports;
   List<dynamic>? litigationRequestArbitratorRecusalRequests;
   List<LitigationRequestGrounds>? litigationRequestGrounds;
   List<dynamic>? litigationRequestReconciliationReports;
   List<dynamic>? litigationRequestNotes;
   List<dynamic>? litigationRequestArbitratorLists;
   List<dynamic>? litigationRequestArbitratorNominationLists;
   List<dynamic>? litigationRequestArbitratorsChairmanNominationLists;
   List<LitigationRequestRequests>? litigationRequestRequests;
   List<dynamic>? workFlowProcessingLogs;
   String? id;
  factory ClaimDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ClaimDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClaimDetailsModelToJson(this);

}
@JsonSerializable()
class LitigationRequestAmount{
  String? fee;
  String? litigationAmount;
  String? id;
  LitigationRequestAmount({this.id,this.litigationAmount,this.fee});
  factory LitigationRequestAmount.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestAmountFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestAmountToJson(this);
}
@JsonSerializable()
class SecondPartyFacility{
  String? code;
  String? citizenId;
  String? commercialRegisterNumber;
  String? facility700Number;
  String? arabicFacilityName;
  String? englishFacilityName;
  String? email;
  String? city;
  String? district;
  String? street;
  String? subNumber;
  String? buildingNumber;
  String? unitNumber;
  String? id;
  SecondPartyFacility({this.id,this.email,this.city,this.code,this.district,this.arabicFacilityName,this.buildingNumber,this.citizenId,this.commercialRegisterNumber,this.englishFacilityName,this.facility700Number,this.street,this.subNumber,this.unitNumber});
  factory SecondPartyFacility.fromJson(Map<String, dynamic> json) =>
      _$SecondPartyFacilityFromJson(json);
  Map<String, dynamic> toJson() => _$SecondPartyFacilityToJson(this);
}

@JsonSerializable()
class ApplicantCitizen {
  ApplicantCitizen({
     this.identityNumber,
     this.fullName,
     this.nationalityId,
     this.shortName,
     this.birthDate,
     this.genderId,
     this.identityExpiryDate,
     this.code,
     this.identityTypeId,
     this.userId,
     this.passCitizenId,
     this.identityFileId,
     this.employer,
     this.mobile,
     this.email,
     this.areaId,
     this.cityId,
     this.district,
     this.street,
     this.subNumber,
     this.buildingNumber,
     this.unitNumber,
     this.isLawyer,
     this.isReformer,
     this.reformerStatusId,
     this.isArbitrator,
     this.arbitratorStatusId,
     this.litigationRequestArbitratorsChairmanNominationListArbitratorValues,
     this.litigationRequestArbitratorRecusalRequests,
     this.litigationRequestArbitratorsChairmanNominationListChairmanValues,
     this.facilities,
     this.fromDelegators,
     this.reformerStopFreeUpDecisions,
     this.arbitratorStopFreeUpDecisions,
     this.toDelegators,
     this.citizenRequests,
     this.litigationRequestArbitratorLists,
     this.litigationRequestArbitratorNominationLists,
     this.litigationRequestArbitratorsChairmanNominationLists,
     this.litigationRequestNotes,
     this.citizenBankAccounts,
     this.arbitratorLitigationRequests,
     this.litigationRequestArbitratorAssigningRequests,
     this.reformerLitigationRequests,
     this.litigationRequestContractFirstPartyCitizens,
     this.litigationRequestContractSecondPartyCitizens,
     this.litigationRequestReformerAssigningRequests,
     this.delegatorLitigationRequests,
     this.sysRegistrationRequestCitizens,
     this.sysRegistrationRequestSourceCitizens,
     this.id,
  });
   String? identityNumber;
   String? fullName;
   String? nationalityId;
   String? shortName;
   String? birthDate;
   int? genderId;
   String? identityExpiryDate;
   String? code;
   int? identityTypeId;
   String? userId;
   String? passCitizenId;
   String? identityFileId;
   String? employer;
   String? mobile;
   String? email;
   String? areaId;
   String? cityId;
   String? district;
   String? street;
   String? subNumber;
   String? buildingNumber;
   String? unitNumber;
   bool? isLawyer;
   bool? isReformer;
   int? reformerStatusId;
   bool? isArbitrator;
   int? arbitratorStatusId;
   List<dynamic>? litigationRequestArbitratorsChairmanNominationListArbitratorValues;
   List<dynamic>? litigationRequestArbitratorRecusalRequests;
   List<dynamic>? litigationRequestArbitratorsChairmanNominationListChairmanValues;
   List<dynamic>? facilities;
   List<dynamic>? fromDelegators;
   List<dynamic>? reformerStopFreeUpDecisions;
   List<dynamic>? arbitratorStopFreeUpDecisions;
   List<dynamic>? toDelegators;
   List<dynamic>? citizenRequests;
   List<dynamic>? litigationRequestArbitratorLists;
   List<dynamic>? litigationRequestArbitratorNominationLists;
   List<dynamic>? litigationRequestArbitratorsChairmanNominationLists;
   List<dynamic>? litigationRequestNotes;
   List<dynamic>? citizenBankAccounts;
   List<dynamic>? arbitratorLitigationRequests;
   List<dynamic>? litigationRequestArbitratorAssigningRequests;
   List<dynamic>? reformerLitigationRequests;
   List<LitigationRequestContractFirstPartyCitizens>? litigationRequestContractFirstPartyCitizens;
   List<dynamic>? litigationRequestContractSecondPartyCitizens;
   List<dynamic>? litigationRequestReformerAssigningRequests;
   List<dynamic>? delegatorLitigationRequests;
   List<dynamic>? sysRegistrationRequestCitizens;
   List<dynamic>? sysRegistrationRequestSourceCitizens;
   String? id;
  factory ApplicantCitizen.fromJson(Map<String, dynamic> json) =>
      _$ApplicantCitizenFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicantCitizenToJson(this);

}
@JsonSerializable()
class Nationality {
  Nationality({
     this.nationalityName,
     this.nationalityCode,
     this.createdBy,
     this.createdOn,
     this.isDeleted,
     this.id,
  });
   String? nationalityName;
   int? nationalityCode;
   String? createdBy;
   String? createdOn;
   bool? isDeleted;
   String? id;
  factory Nationality.fromJson(Map<String, dynamic> json) =>
      _$NationalityFromJson(json);
  Map<String, dynamic> toJson() => _$NationalityToJson(this);

}

@JsonSerializable()
class LitigationRequestContractSecondPartyCitizens {
  LitigationRequestContractSecondPartyCitizens({
     this.litigationRequestContractTypeId,
     this.contractKey,
     this.versionNumber,
     this.contractFileId,
     this.firstPartyCitizenId,
     this.firstPartyCapacity,
     this.secondPartyCitizenId,
     this.secondPartyCapacity,
     this.contractFile,
     this.id,
  });
   int? litigationRequestContractTypeId;
   String? contractKey;
   String? versionNumber;
   String? contractFileId;
   String? firstPartyCitizenId;
   String? firstPartyCapacity;
   String? secondPartyCitizenId;
   String? secondPartyCapacity;
   ContractFile? contractFile;
   String? id;
  factory LitigationRequestContractSecondPartyCitizens.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestContractSecondPartyCitizensFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestContractSecondPartyCitizensToJson(this);

}
@JsonSerializable()
class ContractFile {
  ContractFile({
     this.fileDescription,
     this.filePath,
     this.fileType,
     this.litigationRequestArbitratorRecusalRequestFiles,
     this.litigationRequestArbitrationReportExplanationRequestFiles,
     this.indentityCitizens,
     this.lawLicenseCitizens,
     this.citizenRequestExperienceCertificateFiles,
     this.citizenRequestFreelanceWorkDocumentFiles,
     this.exemptionReductionCategoryFiles,
     this.workFlowProcessingLogFiles,
     this.associationRegistrationCertificateContracts,
     this.foundingLetterContracts,
     this.internalRegulationsContracts,
     this.citizenRequestAcademicDegreeFiles,
     this.delegators,
     this.delegationRequests,
     this.litigationRequestCorrespondenceFiles,
     this.litigationRequestExtendPeriodRequestFiles,
     this.litigationRequestGroundFiles,
     this.litigationRequestNoteFiles,
     this.litigationRequestRequestFiles,
     this.createdBy,
     this.createdOn,
     this.id,
  });
   String? fileDescription;
   String? filePath;
   String? fileType;
   List<dynamic>? litigationRequestArbitratorRecusalRequestFiles;
   List<dynamic>? litigationRequestArbitrationReportExplanationRequestFiles;
   List<dynamic>? indentityCitizens;
   List<dynamic>? lawLicenseCitizens;
   List<dynamic>? citizenRequestExperienceCertificateFiles;
   List<dynamic>? citizenRequestFreelanceWorkDocumentFiles;
   List<dynamic>? exemptionReductionCategoryFiles;
   List<dynamic>? workFlowProcessingLogFiles;
   List<dynamic>? associationRegistrationCertificateContracts;
   List<dynamic>? foundingLetterContracts;
   List<dynamic>? internalRegulationsContracts;
   List<dynamic>? citizenRequestAcademicDegreeFiles;
   List<dynamic>? delegators;
   List<dynamic>? delegationRequests;
   List<dynamic>? litigationRequestCorrespondenceFiles;
   List<dynamic>? litigationRequestExtendPeriodRequestFiles;
   List<dynamic>? litigationRequestGroundFiles;
   List<dynamic>? litigationRequestNoteFiles;
   List<dynamic>? litigationRequestRequestFiles;
   String? createdBy;
   String? createdOn;
   String? id;
  factory ContractFile.fromJson(Map<String, dynamic> json) =>
      _$ContractFileFromJson(json);
  Map<String, dynamic> toJson() => _$ContractFileToJson(this);


}
@JsonSerializable()
class LitigationRequestContractFirstPartyCitizens {
  LitigationRequestContractFirstPartyCitizens({
     this.litigationRequestContractTypeId,
     this.contractKey,
     this.versionNumber,
     this.contractFileId,
     this.firstPartyCitizenId,
     this.firstPartyCapacity,
     this.secondPartyCitizenId,
     this.secondPartyCapacity,
     this.contractFile,
     this.secondPartyCitizen,
     this.id,
  });
  late  int? litigationRequestContractTypeId;
  late  String? contractKey;
  late  String? versionNumber;
  late  String? contractFileId;
  late  String? firstPartyCitizenId;
  late  String? firstPartyCapacity;
  late  String? secondPartyCitizenId;
  late  String? secondPartyCapacity;
  late  ContractFile? contractFile;
  late  SecondPartyCitizen? secondPartyCitizen;
  late  String? id;
  factory LitigationRequestContractFirstPartyCitizens.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestContractFirstPartyCitizensFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestContractFirstPartyCitizensToJson(this);

}
@JsonSerializable()
class SecondPartyCitizen {
  SecondPartyCitizen({
     this.identityNumber,
     this.fullName,
     this.nationalityId,
     this.shortName,
     this.birthDate,
     this.genderId,
     this.identityExpiryDate,
     this.code,
     this.identityTypeId,
     this.userId,
     this.passCitizenId,
     this.identityFileId,
     this.employer,
     this.mobile,
     this.email,
     this.areaId,
     this.cityId,
     this.district,
     this.street,
     this.subNumber,
     this.buildingNumber,
     this.unitNumber,
     this.isLawyer,
     this.isReformer,
     this.isArbitrator,
     this.arbitratorStatusId,
     this.litigationRequestArbitratorsChairmanNominationListArbitratorValues,
     this.litigationRequestArbitratorRecusalRequests,
     this.litigationRequestArbitratorsChairmanNominationListChairmanValues,
     this.facilities,
     this.fromDelegators,
     this.reformerStopFreeUpDecisions,
     this.arbitratorStopFreeUpDecisions,
     this.toDelegators,
     this.citizenRequests,
     this.litigationRequestArbitratorLists,
     this.litigationRequestArbitratorNominationLists,
     this.litigationRequestArbitratorsChairmanNominationLists,
     this.litigationRequestNotes,
     this.citizenBankAccounts,
     this.nationality,
     this.arbitratorLitigationRequests,
     this.litigationRequestArbitratorAssigningRequests,
     this.reformerLitigationRequests,
     this.litigationRequestContractFirstPartyCitizens,
     this.litigationRequestReformerAssigningRequests,
     this.delegatorLitigationRequests,
     this.litigationRequests,
     this.sysRegistrationRequestCitizens,
     this.sysRegistrationRequestSourceCitizens,

     this.id,
  });
   String? identityNumber;
   String? fullName;
   String? nationalityId;
   String? shortName;
   String? birthDate;
   int? genderId;
   String? identityExpiryDate;
   String? code;
   int? identityTypeId;
   String? userId;
   String? passCitizenId;
   String? identityFileId;
   String? employer;
   String? mobile;
   String? email;
   String? areaId;
   String? cityId;
   String? district;
   String? street;
   String? subNumber;
   String? buildingNumber;
   String? unitNumber;
   bool? isLawyer;
   bool? isReformer;
   bool? isArbitrator;
   int? arbitratorStatusId;
   List<dynamic>? litigationRequestArbitratorsChairmanNominationListArbitratorValues;
   List<dynamic>? litigationRequestArbitratorRecusalRequests;
   List<dynamic>? litigationRequestArbitratorsChairmanNominationListChairmanValues;
   List<dynamic>? facilities;
   List<dynamic>? fromDelegators;
   List<dynamic>? reformerStopFreeUpDecisions;
   List<dynamic>? arbitratorStopFreeUpDecisions;
   List<dynamic>? toDelegators;
   List<dynamic>? citizenRequests;
   List<dynamic>? litigationRequestArbitratorLists;
   List<dynamic>? litigationRequestArbitratorNominationLists;
   List<dynamic>? litigationRequestArbitratorsChairmanNominationLists;
   List<dynamic>? litigationRequestNotes;
   List<dynamic>? citizenBankAccounts;
   Nationality? nationality;
   List<dynamic>? arbitratorLitigationRequests;
   List<dynamic>? litigationRequestArbitratorAssigningRequests;
   List<dynamic>? reformerLitigationRequests;
   List<dynamic>? litigationRequestContractFirstPartyCitizens;
   List<dynamic>? litigationRequestReformerAssigningRequests;
   List<dynamic>? delegatorLitigationRequests;
   List<dynamic>? litigationRequests;
   List<dynamic>? sysRegistrationRequestCitizens;
   List<dynamic>? sysRegistrationRequestSourceCitizens;
   String? id;
  factory SecondPartyCitizen.fromJson(Map<String, dynamic> json) =>
      _$SecondPartyCitizenFromJson(json);
  Map<String, dynamic> toJson() => _$SecondPartyCitizenToJson(this);

}
@JsonSerializable()
class City {
  City({
     this.cityName,
     this.areaId,
     this.area,
     this.translations,
     this.id,
  });
   String? cityName;
   String? areaId;
   Area? area;
   List<dynamic>? translations;
   String? id;
  factory City.fromJson(Map<String, dynamic> json) =>
      _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);

}
@JsonSerializable()
class Area {
  Area({
     this.areaName,
     this.citizenRequests,
     this.translations,
     this.id,
  });
   String? areaName;
   List<dynamic>? citizenRequests;
   List<dynamic>? translations;
   String? id;
  factory Area.fromJson(Map<String, dynamic> json) =>
      _$AreaFromJson(json);
  Map<String, dynamic> toJson() => _$AreaToJson(this);

}
@JsonSerializable()
class Contract {
  Contract({
     this.litigationRequestContractTypeId,
     this.contractKey,
     this.versionNumber,
     this.contractFileId,
     this.firstPartyCitizenId,
     this.firstPartyCapacity,
     this.secondPartyCitizenId,
     this.secondPartyCapacity,
     this.firstPartyCitizen,
     this.contractFile,
     this.secondPartyCitizen,
    this.secondPartyFacility,
    this.associationRegistrationCertificateFile,this.internalRegulationsFile,this.foundingLetterFile,
     this.id,
  });
  late  int? litigationRequestContractTypeId;
  late  String? contractKey;
  late  String? versionNumber;
  late  String? contractFileId;
  late  String? firstPartyCitizenId;
  late  String? firstPartyCapacity;
  late  String? secondPartyCitizenId;
  late  String? secondPartyCapacity;
  SecondPartyFacility? secondPartyFacility;
  late  FirstPartyCitizen? firstPartyCitizen;
  late  ContractFile? contractFile;
  late  SecondPartyCitizen? secondPartyCitizen;
  AssociationRegistrationCertificateFile? associationRegistrationCertificateFile;
  FoundingLetterFile? foundingLetterFile;
  InternalRegulationsFile? internalRegulationsFile;
  late  String? id;
  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);
  Map<String, dynamic> toJson() => _$ContractToJson(this);
}
@JsonSerializable()
class AssociationRegistrationCertificateFile{
 late String? fileDescription;
 late  String? filePath;
 late  String? fileType;
  AssociationRegistrationCertificateFile({this.filePath,this.fileType,this.fileDescription});
  factory AssociationRegistrationCertificateFile.fromJson(Map<String, dynamic> json) =>
      _$AssociationRegistrationCertificateFileFromJson(json);
  Map<String, dynamic> toJson() => _$AssociationRegistrationCertificateFileToJson(this);
}
@JsonSerializable()
class FoundingLetterFile{
  late String? fileDescription;
  late String? filePath;
  late String? fileType;
  FoundingLetterFile({this.filePath,this.fileType,this.fileDescription});
  factory FoundingLetterFile.fromJson(Map<String, dynamic> json) =>
      _$FoundingLetterFileFromJson(json);
  Map<String, dynamic> toJson() => _$FoundingLetterFileToJson(this);
}
@JsonSerializable()
class InternalRegulationsFile{
  late String? fileDescription;
  late String? filePath;
  late String? fileType;
  InternalRegulationsFile({this.filePath,this.fileType,this.fileDescription});
  factory InternalRegulationsFile.fromJson(Map<String, dynamic> json) =>
      _$InternalRegulationsFileFromJson(json);
  Map<String, dynamic> toJson() => _$InternalRegulationsFileToJson(this);
}
@JsonSerializable()
class FirstPartyCitizen {
  FirstPartyCitizen({
     this.identityNumber,
     this.fullName,
     this.nationalityId,
     this.shortName,
     this.birthDate,
     this.genderId,
     this.identityExpiryDate,
     this.code,
     this.identityTypeId,
     this.userId,
     this.passCitizenId,
     this.identityFileId,
     this.employer,
     this.mobile,
     this.email,
     this.areaId,
     this.cityId,
     this.district,
     this.street,
     this.subNumber,
     this.buildingNumber,
     this.unitNumber,
     this.isLawyer,
     this.isReformer,
     this.reformerStatusId,
     this.isArbitrator,
     this.arbitratorStatusId,
     this.litigationRequestArbitratorsChairmanNominationListArbitratorValues,
     this.litigationRequestArbitratorRecusalRequests,
     this.litigationRequestArbitratorsChairmanNominationListChairmanValues,
     this.facilities,
     this.fromDelegators,
     this.reformerStopFreeUpDecisions,
     this.arbitratorStopFreeUpDecisions,
     this.toDelegators,
    this.nationality,
     this.citizenRequests,
     this.litigationRequestArbitratorLists,
     this.litigationRequestArbitratorNominationLists,
     this.litigationRequestArbitratorsChairmanNominationLists,
     this.litigationRequestNotes,
     this.citizenBankAccounts,
     this.arbitratorLitigationRequests,
     this.litigationRequestArbitratorAssigningRequests,
     this.reformerLitigationRequests,
     this.litigationRequestContractSecondPartyCitizens,
     this.litigationRequestReformerAssigningRequests,
     this.delegatorLitigationRequests,
     this.sysRegistrationRequestCitizens,
     this.sysRegistrationRequestSourceCitizens,
     this.id,
  });
   String? identityNumber;
   String? fullName;
   String? nationalityId;
   String? shortName;
   String? birthDate;
   int? genderId;
   String? identityExpiryDate;
   String? code;
   int? identityTypeId;
   String? userId;
   String? passCitizenId;
   String? identityFileId;
   String? employer;
   String? mobile;
   String? email;
   String? areaId;
   String? cityId;
   String? district;
   String? street;
   String? subNumber;
   String? buildingNumber;
   String? unitNumber;
   bool? isLawyer;
   bool? isReformer;
   int? reformerStatusId;
   bool? isArbitrator;
   int? arbitratorStatusId;
   List<dynamic>? litigationRequestArbitratorsChairmanNominationListArbitratorValues;
   List<dynamic>? litigationRequestArbitratorRecusalRequests;
   List<dynamic>? litigationRequestArbitratorsChairmanNominationListChairmanValues;
   List<dynamic>? facilities;
   List<dynamic>? fromDelegators;
   List<dynamic>? reformerStopFreeUpDecisions;
   List<dynamic>? arbitratorStopFreeUpDecisions;
   List<dynamic>? toDelegators;
   List<dynamic>? citizenRequests;
   List<dynamic>? litigationRequestArbitratorLists;
   List<dynamic>? litigationRequestArbitratorNominationLists;
   List<dynamic>? litigationRequestArbitratorsChairmanNominationLists;
   List<dynamic>? litigationRequestNotes;
   List<dynamic>? citizenBankAccounts;
   List<dynamic>? arbitratorLitigationRequests;
   List<dynamic>? litigationRequestArbitratorAssigningRequests;
   List<dynamic>? reformerLitigationRequests;
   List<dynamic>? litigationRequestContractSecondPartyCitizens;
   List<dynamic>? litigationRequestReformerAssigningRequests;
   List<dynamic>? delegatorLitigationRequests;
   List<dynamic>? sysRegistrationRequestCitizens;
   List<dynamic>? sysRegistrationRequestSourceCitizens;
   String? id;
  Nationality? nationality;
  factory FirstPartyCitizen.fromJson(Map<String, dynamic> json) =>
      _$FirstPartyCitizenFromJson(json);
  Map<String, dynamic> toJson() => _$FirstPartyCitizenToJson(this);

}
@JsonSerializable()
class LitigationRequestCategory {
  LitigationRequestCategory({
     this.categoryName,
     this.bpfId,
     this.translations,
     this.id,
  });
   String? categoryName;
   String? bpfId;
   List<Translations>? translations;
   int? id;
  factory LitigationRequestCategory.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestCategoryToJson(this);
}
@JsonSerializable()
class Translations {
  Translations({
     this.categoryName,
     this.languageCode,
  });
   String? categoryName;

   String? languageCode;
  factory Translations.fromJson(Map<String, dynamic> json) =>
      _$TranslationsFromJson(json);
  Map<String, dynamic> toJson() => _$TranslationsToJson(this);

}
@JsonSerializable()
class LitigationRequestGrounds {
  LitigationRequestGrounds({
     this.litigationRequestId,
     this.title,
     this.litigationRequestGroundFiles,
     this.id,
  });
   String? litigationRequestId;
   String? title;
   List<LitigationRequestGroundFiles>?litigationRequestGroundFiles;
   String? id;
  factory LitigationRequestGrounds.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestGroundsFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestGroundsToJson(this);
}
@JsonSerializable()
class LitigationRequestGroundFiles {
  LitigationRequestGroundFiles({
     this.litigationRequestGroundId,
     this.fileManagerId,
     this.fileManager,
     this.id,
  });
   String? litigationRequestGroundId;
   String? fileManagerId;
   FileManager? fileManager;
   String? id;
  factory LitigationRequestGroundFiles.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestGroundFilesFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestGroundFilesToJson(this);

}
@JsonSerializable()
class FileManager {
  FileManager({
     this.fileDescription,
     this.filePath,
     this.fileType,
     this.litigationRequestArbitratorRecusalRequestFiles,
     this.litigationRequestArbitrationReportExplanationRequestFiles,
     this.indentityCitizens,
     this.lawLicenseCitizens,
     this.citizenRequestExperienceCertificateFiles,
     this.citizenRequestFreelanceWorkDocumentFiles,
     this.exemptionReductionCategoryFiles,
     this.workFlowProcessingLogFiles,
     this.associationRegistrationCertificateContracts,
     this.foundingLetterContracts,
     this.internalRegulationsContracts,
     this.citizenRequestAcademicDegreeFiles,
     this.delegators,
     this.delegationRequests,
     this.litigationRequestContracts,
     this.litigationRequestCorrespondenceFiles,
     this.litigationRequestExtendPeriodRequestFiles,
     this.litigationRequestNoteFiles,
     this.litigationRequestRequestFiles,
     this.createdBy,
     this.createdOn,
     this.id,
  });
   String? fileDescription;
   String? filePath;
   String? fileType;
   List<dynamic>? litigationRequestArbitratorRecusalRequestFiles;
   List<dynamic>? litigationRequestArbitrationReportExplanationRequestFiles;
   List<dynamic>? indentityCitizens;
   List<dynamic>? lawLicenseCitizens;
   List<dynamic>? citizenRequestExperienceCertificateFiles;
   List<dynamic>? citizenRequestFreelanceWorkDocumentFiles;
   List<dynamic>? exemptionReductionCategoryFiles;
   List<dynamic>? workFlowProcessingLogFiles;
   List<dynamic>? associationRegistrationCertificateContracts;
   List<dynamic>? foundingLetterContracts;
   List<dynamic>? internalRegulationsContracts;
   List<dynamic>? citizenRequestAcademicDegreeFiles;
   List<dynamic>? delegators;
   List<dynamic>? delegationRequests;
   List<dynamic>? litigationRequestContracts;
   List<dynamic>? litigationRequestCorrespondenceFiles;
   List<dynamic>? litigationRequestExtendPeriodRequestFiles;
   List<dynamic>? litigationRequestNoteFiles;
   List<dynamic>? litigationRequestRequestFiles;
   String? createdBy;
   String? createdOn;
   String? id;
  factory FileManager.fromJson(Map<String, dynamic> json) =>
      _$FileManagerFromJson(json);
  Map<String, dynamic> toJson() => _$FileManagerToJson(this);
}
@JsonSerializable()
class LitigationRequestRequests {
  LitigationRequestRequests({
     this.litigationRequestId,
     this.requestContent,
     this.litigationRequestRequestFiles,
     this.id,
  });
   String? litigationRequestId;
   String? requestContent;
   List<dynamic>? litigationRequestRequestFiles;
   String? id;
  factory LitigationRequestRequests.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestRequestsFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestRequestsToJson(this);

}