import 'package:json_annotation/json_annotation.dart';
part 'reconciliation.g.dart';
@JsonSerializable()
class Reconciliation {
  bool? allowAdd;
  bool? allowDecision;
  int? approveRejectStatus;
  LitigationRequestShortDto? litigationRequestShortDto;
  Report? report;

  Reconciliation(
      {this.allowAdd,
        this.allowDecision,
        this.approveRejectStatus,
        this.litigationRequestShortDto,
        this.report});
  factory Reconciliation.fromJson(Map<String, dynamic> json) =>
      _$ReconciliationFromJson(json);
  Map<String, dynamic> toJson() => _$ReconciliationToJson(this);
}
@JsonSerializable()
class LitigationRequestShortDto {
  String? requestCode;
  String? cityName;
  String? areaName;
  String? contractAddress;
  String? title;
  String? description;
  int? mintuesOfMeetingApprovalPlaintiffStatus;
  int? mintuesOfMeetingApprovalDefendantStatus;
  bool? isFinancialLitigation;
  bool? isExemptionReduction;
  ApplicantCitizen? applicantCitizen;
  Contract? contract;
  ReformerCitizen? reformerCitizen;
  ExternalStatus? externalStatus;
  ExternalStatus? internalStatus;
  LitigationRequestAmount? litigationRequestAmount;
  LitigationRequestCategory? litigationRequestCategory;
  LitigationRequestOwnerType? litigationRequestOwnerType;
  String? id;

  LitigationRequestShortDto(
      {this.requestCode,
        this.cityName,
        this.areaName,
        this.reformerCitizen,
        this.contractAddress,
        this.mintuesOfMeetingApprovalPlaintiffStatus,
        this.mintuesOfMeetingApprovalDefendantStatus,
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
class ReformerCitizen {
  String? fullName;

  ReformerCitizen(
      {this.fullName,
        });
  factory ReformerCitizen.fromJson(Map<String, dynamic> json) =>
      _$ReformerCitizenFromJson(json);
  Map<String, dynamic> toJson() => _$ReformerCitizenToJson(this);
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
        this.email,
        this.id,this.workTelephone,this.homeTelephone,this.fax});
  factory ApplicantCitizen.fromJson(Map<String, dynamic> json) =>
      _$ApplicantCitizenFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicantCitizenToJson(this);
}
@JsonSerializable()
class Contract {
  int? litigationRequestContractTypeId;
  String? contractKey;
  String? versionNumber;
  String? firstPartyCapacity;
  String? secondPartyCapacity;
  ApplicantCitizen? firstPartyCitizen;
  ApplicantCitizen? secondPartyCitizen;
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
        this.secondPartyCitizen,
        this.contractFile,
        this.litigationRequestContractType,
        this.id});
  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);
  Map<String, dynamic> toJson() => _$ContractToJson(this);

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
@JsonSerializable()
class Report {
  String? litigationRequestId;
  String? reportDate;
  String? reconciliationSessionDetails;
  String? modificationRequest;
  List<LitigationRequestMeetingReconciliationItems>?
  litigationRequestMeetingReconciliationItems;
  String? id;

  Report(
      {this.litigationRequestId,
        this.reportDate,
        this.reconciliationSessionDetails,
        this.modificationRequest,
        this.litigationRequestMeetingReconciliationItems,
        this.id});
  factory Report.fromJson(Map<String, dynamic> json) =>
      _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);

}
@JsonSerializable()
class LitigationRequestMeetingReconciliationItems {
  String? reconciliationItem;
  String? id;

  LitigationRequestMeetingReconciliationItems(
      {this.reconciliationItem, this.id});
  factory LitigationRequestMeetingReconciliationItems.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestMeetingReconciliationItemsFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestMeetingReconciliationItemsToJson(this);
}
