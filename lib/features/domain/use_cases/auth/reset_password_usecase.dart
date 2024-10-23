import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/core/data/network/error_handler.dart';
import 'package:reac/app/core/domain/model/base_model.dart';
import 'package:reac/features/domain/repository/repository.dart';

import '../../../../app/core/domain/usecase/base_usecase.dart';


@injectable
class ResetPasswordUseCase implements BaseUseCase<BaseDM<String>> {
  late final AuthRepository _repository;
  ResetPasswordUseCase(this._repository);
  @override
  Future<Either<Failure, BaseDM<String>>> execute() async{
    return await _repository.resetPassword(identityNumber);
  }
  String identityNumber = "";
}

