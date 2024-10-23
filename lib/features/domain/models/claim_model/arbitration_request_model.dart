
import 'package:freezed_annotation/freezed_annotation.dart';

part 'arbitration_request_model.freezed.dart';
part 'arbitration_request_model.g.dart';

@freezed
class ArbitrationRequestModel with _$ArbitrationRequestModel {

  factory ArbitrationRequestModel(
      {
        String? litigationRequestId,
        String? explanationRequests,
        List<String>? litigationRequestArbitrationReportExplanationRequestFiles,
      }
      ) = _ArbitrationRequestModel;

  factory ArbitrationRequestModel.fromJson(Map<String, dynamic> json) => _$ArbitrationRequestModelFromJson(json);
}