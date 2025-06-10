import 'package:json_annotation/json_annotation.dart';
part 'list _of_ reconciliation _sessions_model.g.dart';
@JsonSerializable()
class ReconciliationSessionsModel {
  List<Results>? results;
  int? currentPage;
  int? pageCount;
  int? pageSize;
  int? totalCount;

  ReconciliationSessionsModel(
      {this.results,
        this.currentPage,
        this.pageCount,
        this.pageSize,
        this.totalCount});
  factory ReconciliationSessionsModel.fromJson(Map<String, dynamic> json) =>
      _$ReconciliationSessionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReconciliationSessionsModelToJson(this);
}
@JsonSerializable()

class Results {
  String? requestCode;
  String? requestDate;
  String? firstPartyName;
  String? secondPartyName;
  String? requestTypeName;
  String? sessionDatetime;
  String? url;
  String? id;

  Results(
      {this.requestCode,
        this.requestDate,
        this.firstPartyName,
        this.secondPartyName,
        this.requestTypeName,
        this.sessionDatetime,
        this.url,
        this.id});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
