import 'package:json_annotation/json_annotation.dart';
part 'cliam_model.g.dart';
@JsonSerializable()
class ClaimResponse {
  List<Results>? results;
  int? currentPage;
  int? pageCount;
  int? pageSize;
  int? totalCount;
  ClaimResponse(
      {this.results,
        this.currentPage,
        this.pageCount,
        this.pageSize,
        this.totalCount});
  factory ClaimResponse.fromJson(Map<String, dynamic> json) =>
      _$ClaimResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ClaimResponseToJson(this);
}
@JsonSerializable()
class Results {
  String? requestCode;
  String? createdOn;
  String? firstPartyName;
  String? secondPartyName;
  int? internalStatusId;
  int? externalStatusId;
  int? litigationRequestContractTypeId;
  String? litigationRequestContractType;
  String? id;
  String? requestDate;
  String? requestTypeName;
  String? status;
  int? arbitratorsCount;
  int? response;
  String? isDone;
  Results(
      {this.requestCode,
        this.response,
        this.status,
        this.isDone,
        this.arbitratorsCount,
        this.requestDate,
        this.requestTypeName,
        this.createdOn,
        this.firstPartyName,
        this.secondPartyName,
        this.internalStatusId,
        this.externalStatusId,
        this.litigationRequestContractTypeId,
        this.litigationRequestContractType,
        this.id});
  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}