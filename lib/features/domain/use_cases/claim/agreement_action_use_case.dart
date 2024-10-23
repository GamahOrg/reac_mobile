

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/core/data/mapper/base_response_mapper.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/features/domain/models/claim_model/agreement_action.dart';
import 'package:reac/features/domain/models/claim_model/claim_details_model.dart';

import '../../../../app/core/data/network/error_handler.dart';
import '../../../../app/core/data/response/base_response.dart';
import '../../../../app/core/domain/usecase/base_usecase.dart';
import '../../../../app/no_params.dart';
import '../../models/claim_model/agreement_model.dart';
import '../../models/claim_model/cliam_model.dart';
import '../../repository/claim_repository.dart';


@injectable
class AgreementActionUseCase implements BaseUseCase<BaseResponse<AgreementModel>> {
  final ClaimRepository _repository;
  AgreementActionUseCase(this._repository);
  AgreementAction? agreementAction;

  @override
  Future<Either<Failure, BaseResponse<AgreementModel>>> execute() async {
    return await _repository.getAgreementDetailsActionApi(agreementAction!);
  }
}


