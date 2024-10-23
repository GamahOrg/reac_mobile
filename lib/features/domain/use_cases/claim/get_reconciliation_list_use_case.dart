import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../app/core/data/network/error_handler.dart';
import '../../../../app/core/data/response/base_response.dart';
import '../../../../app/core/domain/usecase/base_usecase.dart';
import '../../models/claim_model/cliam_model.dart';
import '../../repository/claim_repository.dart';

@injectable
class GetReconciliationListUseCase implements BaseUseCase<BaseResponse<ClaimResponse>> {
  final ClaimRepository _repository;
  GetReconciliationListUseCase(this._repository);

  @override
  Future<Either<Failure, BaseResponse<ClaimResponse>>> execute() async {
    return await _repository.getReconciliationListApi(
        pageSize, pageIndex);
  }

  int pageSize = 10;
  int pageIndex = 1;

}
