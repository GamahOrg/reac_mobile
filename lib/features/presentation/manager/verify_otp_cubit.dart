import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/function.dart';
import 'package:reac/features/domain/use_cases/verify_otp_usecase.dart';
import 'package:reac/features/presentation/manager/verify_otp_state.dart';
import 'package:reac/my_app.dart';


@injectable
class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpUseCase verifyOtpUseCase;

  VerifyOtpCubit(this.verifyOtpUseCase)
      : super(IdleState(retryActionFunction: () {}));

  static VerifyOtpCubit get(context) => BlocProvider.of(context);
  int attempt=0;
  void execute(VerifyOtpModel verifyOtpModel) async {
    attempt++;
    dPrint(attempt.toString());
    emit(LoadingState(message: 'Loading...', retryActionFunction: () {}));
    if (!validate(pinputError: verifyOtpModel.otp)) {
      return;
    }
    var response = await verifyOtpUseCase.execute(verifyOtpModel);
    response.fold((error) {
      emit(ErrorState(error.toString(),
          message:"لرقم السري المؤقت المدخل غير صحيح", retryActionFunction: () {}));
    }, (data) {
      emit(SuccessState("null",
          message: 'Data loaded successfully!', retryActionFunction: () {}));
    });
  }
  bool validate({String? pinputError}) {
    if (pinputError == null || pinputError.isEmpty) {
      emit( otpError(message:MyApp.tr.pleaseEnterOtp));
      return  false;
    } else if (pinputError.length != 4) {
      emit( otpError(message:MyApp.tr.otpMust4Digits));
      return  false;
    }
    return true;
  }
}
