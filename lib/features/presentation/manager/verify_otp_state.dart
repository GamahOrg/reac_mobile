
import 'package:reac/app/state_render/state_render.dart';

class VerifyOtpState extends AppState{
  const VerifyOtpState({super.message,super.retryActionFunction});
}
class LoadingState extends VerifyOtpState {
  const LoadingState({required String message, required Null Function() retryActionFunction});
}

class IdleState extends VerifyOtpState {
  const IdleState({required Null Function() retryActionFunction});
}

class SuccessState<T> extends VerifyOtpState {
  final T data;
  const SuccessState(this.data, {super.message, super.retryActionFunction});
}

class ErrorState extends VerifyOtpState {
  final String error;
  const ErrorState(this.error, {super.message, super.retryActionFunction});
}
class InvalidIdentity extends VerifyOtpState{
  const InvalidIdentity({required super.message});
}
class otpError extends VerifyOtpState{
  const otpError({required super.message});}