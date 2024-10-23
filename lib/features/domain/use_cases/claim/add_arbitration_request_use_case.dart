
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/core/data/mapper/base_response_mapper.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/features/domain/models/claim_model/arbitration_request_model.dart';
import 'package:reac/features/domain/models/claim_model/claim_details_model.dart';

import '../../../../app/core/data/network/error_handler.dart';
import '../../../../app/core/data/response/base_response.dart';
import '../../../../app/core/domain/usecase/base_usecase.dart';
import '../../../../app/no_params.dart';
import '../../models/claim_model/agreement_model.dart';
import '../../models/claim_model/cliam_model.dart';
import '../../models/claim_model/selection_arbitrator_body.dart';
import '../../repository/claim_repository.dart';
@injectable
class AddArbitrationRequestUseCase implements BaseUseCase<BaseResponse> {
  final ClaimRepository _repository;
  AddArbitrationRequestUseCase(this._repository);
  ArbitrationRequestModel? arbitrationRequestModel;

  @override
  Future<Either<Failure, BaseResponse>> execute() async {
    return await _repository.addArbitrationRequestApi(arbitrationRequestModel!);
  }
}


