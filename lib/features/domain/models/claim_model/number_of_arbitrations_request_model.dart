import 'package:freezed_annotation/freezed_annotation.dart';
part 'number_of_arbitrations_request_model.freezed.dart';
part 'number_of_arbitrations_request_model.g.dart';

@freezed
class NumberOfArbitractionsRequestModel with _$NumberOfArbitractionsRequestModel {

  factory NumberOfArbitractionsRequestModel(
      {
        String? requestId,
        int? arbitratorCount,
      }
      ) = _NumberOfArbitractionsRequestModel;

  factory NumberOfArbitractionsRequestModel.fromJson(Map<String, dynamic> json) => _$NumberOfArbitractionsRequestModelFromJson(json);
}


