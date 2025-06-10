import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/features/domain/models/auth/auth_response.dart';
import 'package:reac/features/domain/models/auth/check_status_response.dart';
import 'package:reac/features/domain/use_cases/auth/login_use_case.dart';
import 'package:reac/features/domain/use_cases/auth/verify_user_use_case.dart';
import 'package:reac/features/presentation/auth_screens/login/login_state.dart';
import 'package:reac/my_app.dart';

import '../../../../app/constants.dart';
import '../../../../app/core/data/response/base_response.dart';
import '../../../domain/use_cases/auth/check_status_use_case.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._useCase, this.verifyUserUseCase, this.checkStatusUseCase)
      : super(IdleState(
            retryActionFunction:
                () {})); // Set to IdleState or another suitable initial state

  final LoginUseCase _useCase;
  final VerifyUserUseCase verifyUserUseCase;
  final CheckStatusUseCase checkStatusUseCase;
  TransactionResponse transactionResponse = TransactionResponse();
  BaseResponse<CheckStatusReponse>? checkStatusReponse;
  static LoginCubit get(BuildContext context) => context.read<LoginCubit>();
  Future<void> destroy() async {
    emit(const IdleState());
  }

  Future<void> verifyUser(String nationalNumber) async {
    verifyUserUseCase.nationalId = nationalNumber;
    verifyUserUseCase.execute().then((value) => value.fold((failure) {
          emit(ErrorState(failure.message));
        }, (data) {
          if (data.isDone!) {
            transactionResponse = data.data!;
            print("Cubit${transactionResponse.data?.transId ?? ""}");
            emit(SuccessState("", message: MyApp.tr.success));
          } else {
            emit(ErrorState(data.message!));
          }
        }));
  }

  Future<void> checkStatusUser(String transactionId) async {
    const Duration delayBetweenCalls =
        Duration(seconds: 5); // Delay between API calls
    await Future.delayed(delayBetweenCalls);

    checkStatusUseCase.transactionId = transactionId;
    await checkStatusUseCase.execute().then((value) => value.fold((failure) {
      emit(ErrorState(failure.message));
        }, (data) async {
          if (data.data?.isValid == true) {
            checkStatusReponse = data;
            emit(SuccessState("", message: MyApp.tr.success));
            return;
          } else {
            await Future.delayed(delayBetweenCalls);
            checkStatusUser(transactionId);
          }
        }));
  }

  Future<void> login(
    String nationalNumber,
    String password,
  ) async {
    emit(const LoadingState());
    verifyUser(nationalNumber);

    /*if (!validate(nationalNumber, password)) {
      return;
    }
    if (identityType == IdentityType.citizen) {
      verifyUser(nationalNumber);
      return;
    }*/
    /*_useCase.useName = nationalNumber;
    _useCase.password = password;
    _useCase.execute().then((value) => value.fold((failure) {
          emit(ErrorState(failure.message));
        }, (data) {
          if (data.isDone!) {
            emit(SuccessState("", message: MyApp.tr.success));
          } else {
            emit(ErrorState(data.message!));
          }
        }));*/
  }

  bool validate(String nationalNumber, String password) {
    if (nationalNumber.isEmpty) {
      emit(InvalidIdentity(message: MyApp.tr.idNumberMandatory));
      return false;
    } else if (nationalNumber.length != Constants.identityLen) {
      emit(InvalidIdentity(message: MyApp.tr.idNumberMustBeDigits));
      return false;
    }
    return true;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return MyApp.tr.passwordMandatory;
    } else {
      if (!Constants.passwordRegex.hasMatch(value)) {
        return MyApp.tr.passwordMustContainLetterAndChar;
      } else {
        return null;
      }
    }
  }
}
