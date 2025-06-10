import 'package:dartz/dartz.dart';
import 'package:reac/app/core/data/response/base_response.dart';
import 'package:reac/features/data/request/verify_request.dart';
import 'package:reac/features/domain/models/auth/auth_response.dart';
import 'package:reac/features/domain/models/auth/check_status_response.dart';

import '../../../app/core/data/network/error_handler.dart';
import '../../../app/core/domain/model/base_model.dart';
import '../../data/request/login_request.dart';
import '../models/auth/login_response.dart';

abstract class AuthRepository{
  const AuthRepository();
  Future<Either<Failure, BaseResponse<LoginResponse>>> login(LoginRequest loginRequest);
  Future<Either<Failure, BaseResponse<TransactionResponse>>> verifyUser(VerifyRequest request);

  Future<Either<Failure, BaseDM<String>>> resetPassword(String identityNumber);
  Future<Either<Failure, BaseDM<String>>> verifyOtp(String newMobileNumber,String otp);
  Future<Either<Failure, BaseResponse<CheckStatusReponse>>> checkStatus(String transactionId);
}
