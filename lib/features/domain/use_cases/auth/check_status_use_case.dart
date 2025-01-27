import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/core/data/response/base_response.dart';
import 'package:reac/features/data/request/verify_request.dart';
import 'package:reac/features/domain/models/auth/auth_response.dart';
import 'package:reac/features/domain/models/auth/check_status_response.dart';

import '../../../../app/core/data/network/error_handler.dart';
import '../../../../app/core/domain/usecase/base_usecase.dart';
import '../../repository/repository.dart';

@injectable
class CheckStatusUseCase
    implements BaseUseCase<BaseResponse<CheckStatusReponse>> {
  final AuthRepository _repository;

  CheckStatusUseCase(this._repository);

  @override
  Future<Either<Failure, BaseResponse<CheckStatusReponse>>> execute() async {
    return await _repository.checkStatus(transactionId);
  }

  String transactionId = "";
}
