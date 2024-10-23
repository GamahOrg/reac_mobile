import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/features/domain/use_cases/auth/login_use_case.dart';
import 'package:reac/features/presentation/auth_screens/login/login_state.dart';
import 'package:reac/my_app.dart';

import '../../../../app/app_enums.dart';
import '../../../../app/constants.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._useCase)
      : super(IdleState(
            retryActionFunction:
                () {})); // Set to IdleState or another suitable initial state

  final LoginUseCase _useCase;

  static LoginCubit get(BuildContext context) => context.read<LoginCubit>();
  Future<void> destroy() async {
    emit(const IdleState());
  }

  Future<void> login(String nationalNumber, String password,
      IdentityType? identityType) async {
    emit(const LoadingState());
    if (!validate(nationalNumber, password, identityType)) {
      return;
    }
    _useCase.useName = nationalNumber;
    _useCase.password = password;
    _useCase.execute().then((value) => value.fold((failure) {
          emit(ErrorState(failure.message));
        }, (data) {
          if (data.isDone!) {
            emit(SuccessState("", message: MyApp.tr.success));
          } else {
            emit(ErrorState(data.message!));
          }
        }));
  }

  bool validate(
      String nationalNumber, String password, IdentityType? identityType) {
    if (identityType == null) {
      emit(InvalidType(message: MyApp.tr.pleaseSelectIdType));
      return false;
    } else if (nationalNumber.isEmpty) {
      emit(InvalidIdentity(message: MyApp.tr.idNumberMandatory));
      return false;
    } else if (nationalNumber.length != Constants.identityLen) {
      emit(InvalidIdentity(message: MyApp.tr.idNumberMustBeDigits));
      return false;
    } else if (identityType == IdentityType.gulf) {
      //disable password validation until nafaz work
      /*var message = validatePassword(password);
      if (message != null) {
        emit(PasswordError(message: message));
        return false;
      }*/
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
