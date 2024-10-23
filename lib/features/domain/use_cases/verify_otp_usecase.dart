import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/core/data/network/error_handler.dart';
import 'package:reac/app/core/domain/model/base_model.dart';
import 'package:reac/app/function.dart';
import 'package:reac/features/domain/repository/repository.dart';

import '../../../app/core/data/response/base_response.dart';
import 'base_usecase.dart';

@injectable
class VerifyOtpUseCase implements BaseUseCase<VerifyOtpModel, BaseDM<String>> {
  final AuthRepository _repository;

  VerifyOtpUseCase(this._repository);

  @override
  Future<Either<Failure, BaseDM<String>>> execute(VerifyOtpModel params) async {
      return await _repository.verifyOtp(params.newMobileNumber, params.otp);
  }
}

class VerifyOtpModel {
  final String newMobileNumber;
  final String otp;

  VerifyOtpModel({required this.newMobileNumber, required this.otp});
}
