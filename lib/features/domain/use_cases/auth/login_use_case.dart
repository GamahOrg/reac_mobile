import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/core/data/response/base_response.dart';

import '../../../../app/core/data/network/error_handler.dart';
import '../../../../app/core/domain/model/base_model.dart';
import '../../../../app/core/domain/usecase/base_usecase.dart';
import '../../../data/request/login_request.dart';
import '../../models/auth/login_response.dart';
import '../../repository/repository.dart';

@injectable
class LoginUseCase
    implements BaseUseCase<BaseResponse<LoginResponse>> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, BaseResponse<LoginResponse>>> execute() async {
    return await _repository
        .login(LoginRequest(userName: useName, password: password));
  }

  String useName = "";
  String password = "";
}
