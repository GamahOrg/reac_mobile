import 'package:json_annotation/json_annotation.dart';
part 'details_response_model.g.dart';
@JsonSerializable()
class DetailsResponseModel {
  bool? allowAdd;
  int? arbitratorsCount;
  int? secondPartyArbitratorsCount;
  int? firstPartyArbitratorsCount;
  Report? report;
  List<CitizenArbitratorShortStatusDtos>? citizenArbitratorShortStatusDtos;
  LitigationRequestShortDto? litigationRequestShortDto;

  DetailsResponseModel(
      {this.allowAdd,
        this.arbitratorsCount,this.firstPartyArbitratorsCount,this.secondPartyArbitratorsCount,
        this.citizenArbitratorShortStatusDtos,
        this.litigationRequestShortDto});
  factory DetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsResponseModelToJson(this);
}
@JsonSerializable()
class CitizenArbitratorShortStatusDtos {
  String? citizenId;
  String? fullName;
  String? brief;
  int? value;
  String? id;

  CitizenArbitratorShortStatusDtos(
      {this.citizenId, this.fullName, this.brief, this.id,this.value});
  factory CitizenArbitratorShortStatusDtos.fromJson(Map<String, dynamic> json) =>
      _$CitizenArbitratorShortStatusDtosFromJson(json);
  Map<String, dynamic> toJson() => _$CitizenArbitratorShortStatusDtosToJson(this);
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
  Contract? contract;
  LitigationRequestCategory? litigationRequestCategory;
  LitigationRequestAmount? litigationRequestAmount;
  ExternalStatus? externalStatus;
  ExternalStatus? internalStatus;
  ArbitratorCitizen? arbitratorCitizen;
  String? id;

  LitigationRequestShortDto(
      {this.requestCode,
        this.cityName,
        this.areaName,
        this.arbitratorCitizen,
        this.contractAddress,
        this.title,
        this.description,
        this.isFinancialLitigation,
        this.isExemptionReduction,
        this.contract,
        this.externalStatus,
        this.internalStatus,
        this.id});
  factory LitigationRequestShortDto.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestShortDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestShortDtoToJson(this);
}

@JsonSerializable()
class LitigationRequestAmount {
  int? fees;

  LitigationRequestAmount(
      {this.fees,
        });
  factory LitigationRequestAmount.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestAmountFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestAmountToJson(this);
}

@JsonSerializable()
class ArbitratorCitizen {
  String? mobile;
  String? email;
  String? identityNumber;
  String? fullName;


  ArbitratorCitizen(
      {
        this.mobile,
        this.identityNumber,
        this.fullName,
        this.email
        });
  factory ArbitratorCitizen.fromJson(Map<String, dynamic> json) =>
      _$ArbitratorCitizenFromJson(json);
  Map<String, dynamic> toJson() => _$ArbitratorCitizenToJson(this);
}

@JsonSerializable()
class LitigationRequestCategory {
  LitigationRequestCategory({
    this.categoryName,
    this.bpfId,
    this.id,
  });
  String? categoryName;
  String? bpfId;
  int? id;
  factory LitigationRequestCategory.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestCategoryToJson(this);
}
@JsonSerializable()
class Contract {
  int? litigationRequestContractTypeId;
  String? contractKey;
  String? versionNumber;
  String? firstPartyCapacity;
  String? secondPartyCapacity;
  FirstPartyCitizen? firstPartyCitizen;
  FirstPartyCitizen? secondPartyCitizen;
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
        this.litigationRequestContractType,
        this.id});
  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);
  Map<String, dynamic> toJson() => _$ContractToJson(this);
}
@JsonSerializable()
class FirstPartyCitizen {
  String? identityNumber;
  String? fullName;
  String? mobile;
  String? homeTelephone;
  String? workTelephone;
  String? fax;
  String? email;
  String? id;

  FirstPartyCitizen(
      {this.identityNumber,
        this.fullName,
        this.mobile,
        this.homeTelephone,
        this.workTelephone,
        this.fax,
        this.email,
        this.id});
  factory FirstPartyCitizen.fromJson(Map<String, dynamic> json) =>
      _$FirstPartyCitizenFromJson(json);
  Map<String, dynamic> toJson() => _$FirstPartyCitizenToJson(this);
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
class Report {
  String? explanationRequestDate;
  String? explanationRequests;
  String? response;
  String? arbitratorCitizenName;
  String? responseOn;
  List<LitigationRequestArbitrationReportExplanationRequestFiles>?
  litigationRequestArbitrationReportExplanationRequestFiles;
  String? id;
  String? litigationRequestId;
  String? judgmentDate;
  String? facts;
  String? reasons;
  String? judgmentDecisionText;
  String? modificationRequest;
  String? judgmentDecisionDate;
  String? judgmentDecisionPlace;
  String? meetingLocationId;
  String? meetingLocationName;
  Report(
      {this.explanationRequestDate,
        this.explanationRequests,
        this.response,
        this.responseOn,
        this.litigationRequestId,
        this.judgmentDate,
        this.facts,
        this.reasons,
        this.arbitratorCitizenName,
        this.judgmentDecisionText,
        this.modificationRequest,
        this.judgmentDecisionDate,
        this.judgmentDecisionPlace,
        this.meetingLocationId,
        this.meetingLocationName,
        this.litigationRequestArbitrationReportExplanationRequestFiles,
        this.id});
  factory Report.fromJson(Map<String, dynamic> json) =>
      _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);

}
@JsonSerializable()
class LitigationRequestArbitrationReportExplanationRequestFiles {
  ContractFile? explanationRequestFile;
  String? id;

  LitigationRequestArbitrationReportExplanationRequestFiles(
      {this.explanationRequestFile, this.id});
  factory LitigationRequestArbitrationReportExplanationRequestFiles.fromJson(Map<String, dynamic> json) =>
      _$LitigationRequestArbitrationReportExplanationRequestFilesFromJson(json);
  Map<String, dynamic> toJson() => _$LitigationRequestArbitrationReportExplanationRequestFilesToJson(this);
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

