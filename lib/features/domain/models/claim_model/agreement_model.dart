import 'package:json_annotation/json_annotation.dart';
part 'agreement_model.g.dart';
@JsonSerializable()
class AgreementModel {
  bool? allowAdd;
  int? approveRejectStatus;
  LitigationRequestShortDto? litigationRequestShortDto;

  AgreementModel(
      {this.allowAdd,
        this.approveRejectStatus,
        this.litigationRequestShortDto});
  factory AgreementModel.fromJson(Map<String, dynamic> json) =>
      _$AgreementModelFromJson(json);
  Map<String, dynamic> toJson() => _$AgreementModelToJson(this);
}
@JsonSerializable()
class LitigationRequestShortDto {
  String? requestCode;
  String? cityName;
  String? areaName;
  String? contractAddress;
  String? title;
  String? description;
  bool? isFinancialLitigation;
  bool? isExemptionReduction;
  ApplicantCitizen? applicantCitizen;
  Contract? contract;
  ExternalStatus? externalStatus;
  ExternalStatus? internalStatus;
  LitigationRequestAmount? litigationRequestAmount;
  LitigationRequestCategory? litigationRequestCategory;
  LitigationRequestOwnerType? litigationRequestOwnerType;
  String? id;

  LitigationRequestShortDto(
      {this.requestCode,
        this.cityName,this.areaName,
        this.contractAddress,
        this.title,
        this.description,
        this.isFinancialLitigation,
        this.isExemptionReduction,
        this.applicantCitizen,
        this.contract,
        this.externalStatus,
        this.internalStatus,
        this.litigationRequestAmount,
        this.litigationRequestCategory,
        this.litigationRequestOwnerType,
        this.id});
  factory LitigationRequestShortDto.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestShortDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestShortDtoToJson(this);

}
@JsonSerializable()
class ApplicantCitizen {
  String? identityNumber;
  String? fullName;
  String? mobile;
  String? email;
  String? id;
  String? homeTelephone;
  String? workTelephone;
  String? fax;
  ApplicantCitizen(
      {this.identityNumber,
        this.fullName,
        this.mobile,
        this.fax,this.homeTelephone,this.workTelephone,
        this.email,
        this.id});
  factory ApplicantCitizen.fromJson(Map<String, dynamic> json) =>
      _$ApplicantCitizenFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicantCitizenToJson(this);

}
@JsonSerializable()
class SecondPartyCitizen{
  String? identityNumber;
  String? fullName;
  String? mobile;
  String? email;
  String? id;
  String? homeTelephone;
  String? workTelephone;
  String? fax;
  SecondPartyCitizen(
      {this.identityNumber,
        this.fullName,
        this.mobile,
        this.fax,this.homeTelephone,this.workTelephone,
        this.email,
        this.id});
  factory SecondPartyCitizen.fromJson(Map<String, dynamic> json) =>
      _$SecondPartyCitizenFromJson(json);
  Map<String, dynamic> toJson() => _$SecondPartyCitizenToJson(this);
}
@JsonSerializable()
class Contract {
  int? litigationRequestContractTypeId;
  String? contractKey;
  String? versionNumber;
  String? firstPartyCapacity;
  String? secondPartyCapacity;
  ApplicantCitizen? firstPartyCitizen;
  SecondPartyFacility? secondPartyFacility;
  SecondPartyCitizen? secondPartyCitizen;
  ContractFile? contractFile;
  LitigationRequestContractType? litigationRequestContractType;
  String? id;

  Contract(
      {this.litigationRequestContractTypeId,
        this.contractKey,
        this.versionNumber,
        this.firstPartyCapacity,
        this.secondPartyCapacity,
        this.firstPartyCitizen,
        this.secondPartyFacility,
        this.contractFile,
        this.litigationRequestContractType,
        this.id});
  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);
  Map<String, dynamic> toJson() => _$ContractToJson(this);

}
@JsonSerializable()
class SecondPartyFacility {
  String? id;
  String? code;
  String? arabicFacilityName;
  String? englishFacilityName;
  String? facility700Number;
  String? commercialRegisterNumber;

  SecondPartyFacility(
      {this.id,
        this.code,
        this.arabicFacilityName,
        this.englishFacilityName,
        this.facility700Number,
        this.commercialRegisterNumber});
  factory SecondPartyFacility.fromJson(Map<String, dynamic> json) =>
      _$SecondPartyFacilityFromJson(json);
  Map<String, dynamic> toJson() => _$SecondPartyFacilityToJson(this);

}
@JsonSerializable()
class ContractFile {
  String? id;
  String? fileDescription;
  String? filePath;
  String? fileType;

  ContractFile({this.id, this.fileDescription, this.filePath, this.fileType});
  factory ContractFile.fromJson(Map<String, dynamic> json) =>
      _$ContractFileFromJson(json);
  Map<String, dynamic> toJson() => _$ContractFileToJson(this);


}
@JsonSerializable()
class LitigationRequestContractType {
  String? typeName;
  String? codingPrefixSymbol;
  int? id;

  LitigationRequestContractType(
      {this.typeName, this.codingPrefixSymbol, this.id});

  factory LitigationRequestContractType.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestContractTypeFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestContractTypeToJson(this);
}

@JsonSerializable()
class ExternalStatus {
  String? requestStatus;
  int? id;

  ExternalStatus({this.requestStatus, this.id});
  factory ExternalStatus.fromJson(Map<String, dynamic> json) =>
      _$ExternalStatusFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalStatusToJson(this);


}
@JsonSerializable()
class LitigationRequestAmount {
  String? litigationAmount;
  int? fees;
  String? id;

  LitigationRequestAmount({this.litigationAmount, this.fees, this.id});
  factory LitigationRequestAmount.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestAmountFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestAmountToJson(this);

}
@JsonSerializable()

class LitigationRequestCategory {
  String? categoryName;

  String? bpfId;
  int? id;

  LitigationRequestCategory(
      {this.categoryName,

        this.bpfId,
        this.id});
  factory LitigationRequestCategory.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestCategoryToJson(this);
}
@JsonSerializable()

class LitigationRequestOwnerType {
  String? litigationRequestOwnerType;
  int? id;

  LitigationRequestOwnerType({this.litigationRequestOwnerType, this.id});
  factory LitigationRequestOwnerType.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestOwnerTypeFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestOwnerTypeToJson(this);
}
