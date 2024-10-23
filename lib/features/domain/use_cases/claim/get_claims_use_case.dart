import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/core/data/network/error_handler.dart';
import '../../../../app/core/data/response/base_response.dart';
import '../../../../app/core/domain/usecase/base_usecase.dart';
import '../../models/claim_model/cliam_model.dart';
import '../../repository/claim_repository.dart';

@injectable
class GetClaimsUseCase implements BaseUseCase<BaseResponse<ClaimResponse>> {
  final ClaimRepository _repository;
  GetClaimsUseCase(this._repository);

  @override
  Future<Either<Failure, BaseResponse<ClaimResponse>>> execute() async {
    return await _repository.getClaims(
        pageSize, pageIndex, searchKey, statuses, types);
  }

  int pageSize = 20;
  int pageIndex = 1;
  String searchKey = "";
  List<int> types = [];
  List<int> statuses = [];
}
