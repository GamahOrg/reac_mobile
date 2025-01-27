import 'package:json_annotation/json_annotation.dart';
part 'check_status_response.g.dart';

@JsonSerializable()

class CheckStatusReponse {
  String? transactionId;
  String? token;
  String? refreshToken;
  bool? isValid;


  CheckStatusReponse(
      {this.transactionId,
        this.token,
        this.refreshToken,
        this.isValid,
       });
  factory CheckStatusReponse.fromJson(Map<String, dynamic> json) =>
      _$CheckStatusReponseFromJson(json);


  Map<String, dynamic> toJson() => _$CheckStatusReponseToJson(this);
}
