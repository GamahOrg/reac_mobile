import 'package:injectable/injectable.dart';
import 'package:reac/app/core/data/response/base_response.dart';
import 'package:reac/generated/l10n.dart';

import '../../../app/core/domain/model/base_model.dart';
import '../../domain/models/auth/login_response.dart';
import '../request/login_request.dart';
import 'auth_api_service.dart';


abstract class AuthRemoteDataSource {
  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest);
  Future<BaseDM<String>> resetPassword(String identityNumber);
  Future<BaseDM<String>> verifyOtp(String newMobileNumber, String otp);
}

@Injectable(as: AuthRemoteDataSource)
class RemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest: loginRequest);
  }
  @override
  Future<BaseDM<String>> resetPassword(String identityNumber) async {
    return await _appServiceClient.resetPassword(identityNumber: identityNumber);
  }

  @override
  Future<BaseDM<String>> verifyOtp(String newMobileNumber, String otp) async {
    return await _appServiceClient.verifyOtp(newMobileNumber: newMobileNumber, OTP: otp);
  }
}
