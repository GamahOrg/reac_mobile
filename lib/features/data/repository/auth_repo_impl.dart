import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/constants.dart';
import 'package:reac/app/core/data/response/base_response.dart';
import 'package:reac/app/di/module/dio_module.dart';
import 'package:reac/features/data/request/verify_request.dart';
import 'package:reac/features/domain/models/auth/auth_response.dart';

import '../../../app/app_prefs.dart';
import '../../../app/core/data/network/error_handler.dart';
import '../../../app/core/data/network/safe_api.dart';
import '../../../app/core/domain/model/base_model.dart';
import '../../../app/di/di.dart';
import '../../../app/function.dart';
import '../../domain/models/auth/login_response.dart';
import '../../domain/repository/repository.dart';
import '../remote_data_source/auth_remote_data_soruce.dart';
import '../request/login_request.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AppPreferences appPreferences;
  final SafeApi safeApi;

  AuthRepositoryImpl(
    this._remoteDataSource,
    this.appPreferences,
    this.safeApi,
  );

  LoginResponse? loginResponse;
  @override
  Future<Either<Failure, BaseResponse<LoginResponse>>> login(
      LoginRequest loginRequest) async {
    return safeApi
        .call(apiCall: _remoteDataSource.login(loginRequest))
        .then((value) {
      value.fold((l) {}, (r) {
        dPrint("Token${r.data?.accessToken}");
        appPreferences.putData(
            Constants.appPreferencesToken, r.data?.accessToken);
        getIt<Dio>().updateHeader();
      });
      return value;
    });
  }

  @override
  Future<Either<Failure, BaseDM<String>>> verifyOtp(
      String newMobileNumber, String otp) async {
    return await Right(BaseDM(data: "SuccessVerifyOtp"));
    // return safeApi.call(apiCall: _remoteDataSource.verifyOtp(newMobileNumber,otp));
  }

  @override
  Future<Either<Failure, BaseDM<String>>> resetPassword(
      String identityNumber) async {
    // return safeApi.call(apiCall: _remoteDataSource.resetPassword(identityNumber));

    return await Right(BaseDM(data: "SuccessResetPassword"));
  }

  @override
  Future<Either<Failure, BaseResponse<TransactionResponse>>> verifyUser(
      VerifyRequest request) {
    return safeApi.call(apiCall: _remoteDataSource.verifyUser(request));
  }
}
