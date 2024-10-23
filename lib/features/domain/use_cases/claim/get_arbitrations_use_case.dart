import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../app/core/data/network/error_handler.dart';
import '../../../../app/core/data/response/base_response.dart';
import '../../../../app/core/domain/usecase/base_usecase.dart';
import '../../models/claim_model/details_response_model.dart';
import '../../repository/claim_repository.dart';


@injectable
class GetArbitratorUseCase implements BaseUseCase<BaseResponse<DetailsResponseModel>> {
  final ClaimRepository _repository;
  GetArbitratorUseCase(this._repository);
  String requestId="";

  @override
  Future<Either<Failure, BaseResponse<DetailsResponseModel>>> execute() async {
     return await _repository.getArbitratorsNominationApi(requestId);
  }
}


