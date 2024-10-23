import 'package:json_annotation/json_annotation.dart';
part 'number_of_arbitrations.g.dart';
@JsonSerializable()
class NumberOfArbitrationsModel {
  int? arbitratorCount;
  String? id;

  NumberOfArbitrationsModel({this.arbitratorCount, this.id});
  factory NumberOfArbitrationsModel.fromJson(Map<String, dynamic> json) =>
      _$NumberOfArbitrationsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NumberOfArbitrationsModelToJson(this);
}
