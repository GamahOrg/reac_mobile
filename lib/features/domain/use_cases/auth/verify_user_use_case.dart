import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/core/data/response/base_response.dart';
import 'package:reac/features/data/request/verify_request.dart';
import 'package:reac/features/domain/models/auth/auth_response.dart';

import '../../../../app/core/data/network/error_handler.dart';
import '../../../../app/core/domain/usecase/base_usecase.dart';
import '../../repository/repository.dart';

@injectable
class VerifyUserUseCase
    implements BaseUseCase<BaseResponse<TransactionResponse>> {
  final AuthRepository _repository;

  VerifyUserUseCase(this._repository);

  @override
  Future<Either<Failure, BaseResponse<TransactionResponse>>> execute() async {
    return await _repository.verifyUser(VerifyRequest(nationalId: nationalId));
  }

  String nationalId = "";
}
