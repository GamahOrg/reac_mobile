import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'verify_request.g.dart';

@JsonSerializable()
class VerifyRequest {
  String? nationalId;
  bool isRegister=false;

  VerifyRequest({this.nationalId});

  factory VerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyRequestToJson(this);
}
