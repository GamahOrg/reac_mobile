import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse {
  String? accessToken;
  String?  refreshToken;
  bool? isLawyer;
  bool? isReformer;
  bool? isArbitrator;
  bool? isDraftAccount;
  bool? isAdmin;
  int? departmentType;
  LoginResponse({this.accessToken,this.refreshToken,this.isLawyer,this.isReformer,this.isArbitrator,this.isDraftAccount,this.isAdmin,this.departmentType});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);


  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}