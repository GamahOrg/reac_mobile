import 'package:dartz/dartz.dart';
import 'package:reac/app/core/data/response/base_response.dart';

import '../../../app/core/data/network/error_handler.dart';
import '../../../app/core/domain/model/base_model.dart';
import '../../data/request/login_request.dart';
import '../models/auth/login_response.dart';

abstract class AuthRepository{
  const AuthRepository();
  Future<Either<Failure, BaseResponse<LoginResponse>>> login(LoginRequest loginRequest);
  Future<Either<Failure, BaseDM<String>>> resetPassword(String identityNumber);
  Future<Either<Failure, BaseDM<String>>> verifyOtp(String newMobileNumber,String otp);
}
