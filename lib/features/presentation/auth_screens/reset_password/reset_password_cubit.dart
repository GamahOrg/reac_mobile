import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/function.dart';
import 'package:reac/features/domain/use_cases/auth/reset_password_usecase.dart';
import 'package:reac/features/presentation/auth_screens/reset_password/reset_password_state.dart';

import '../../../../app/constants.dart';
import '../../../../my_app.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswordUseCase)
      : super(IdleState(retryActionFunction: () {}));
  late ResetPasswordUseCase resetPasswordUseCase;

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  void execute({required String identityNumber}) async {
    emit(const LoadingState());
    if (!validate(identifyNumber: identityNumber)) {
      return;
    }
    resetPasswordUseCase.identityNumber = identityNumber;
    var response = await resetPasswordUseCase.execute();
    response.fold((error) {
      emit(ErrorStateReset(error.toString(),
          message: error.message.toString(), retryActionFunction: () {}));
    }, (data) {
      dPrint("true");
      emit(const SuccessStateReset("NULL", message: 'Data loaded successfully!'));
    });
  }
  bool validate({String? identifyNumber}) {
    if (identifyNumber!.isEmpty) {
      emit(const InvalidIdentity(message: "يرجى ادخال البيانات المطلوبة"));
      return false;
    }
    return true;
  }
  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return MyApp.tr.pleaseEnterTheRequiredData;
    }

    bool hasLetter = value.contains(RegExp(r'[A-Za-z]'));
    bool hasNumber = value.contains(RegExp(r'[0-9]'));

    if (value.length < 8 || !hasLetter || !hasNumber) {
      return MyApp.tr.thePasswordMustContainLettersAndNumbers;
    }

    return null;
  }
  String? validatePasswordAndConfirmation(String? value, TextEditingController newPasswordController) {
    if (value == null || value.isEmpty) {
      return MyApp.tr.pleaseEnterTheRequiredData;
    }

    bool hasLetter = value.contains(RegExp(r'[A-Za-z]'));
    bool hasNumber = value.contains(RegExp(r'[0-9]'));

    if (value.length < 8 || !hasLetter || !hasNumber) {
      return MyApp.tr.thePasswordMustContainLettersAndNumbers;
    }

    if (value != newPasswordController.text) {
      return MyApp.tr.pleaseMatchThePasswordWithTheConfirmationPassword;
    }

    return null;
  }



}
