import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/features/domain/models/claim_model/list%20_of_%20reconciliation%20_sessions_model.dart';

import '../../../../app/core/data/network/error_handler.dart';
import '../../../../app/core/data/response/base_response.dart';
import '../../../../app/core/domain/usecase/base_usecase.dart';
import '../../repository/claim_repository.dart';

@injectable
class GetArbitrationSessionLitigationRequestUseCase implements BaseUseCase<BaseResponse<ReconciliationSessionsModel>> {
  final ClaimRepository _repository;
  GetArbitrationSessionLitigationRequestUseCase(this._repository);

  @override
  Future<Either<Failure, BaseResponse<ReconciliationSessionsModel>>> execute() async {
    return await _repository.getArbitrationSessionLitigationRequestForAllSession(
        pageSize, pageIndex);
  }

  int pageSize = 10;
  int pageIndex = 1;

}

