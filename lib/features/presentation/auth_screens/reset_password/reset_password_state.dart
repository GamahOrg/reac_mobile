
import 'package:reac/app/state_render/state_render.dart';

class ResetPasswordState extends AppState{
  const ResetPasswordState({super.message,super.retryActionFunction});
}
class LoadingState extends ResetPasswordState {
  const LoadingState();
}

class IdleState extends ResetPasswordState {
  const IdleState({required Null Function() retryActionFunction});
}

class SuccessStateReset<T> extends ResetPasswordState {
  final T data;
  const SuccessStateReset(this.data, {super.message, super.retryActionFunction});
}

class ErrorStateReset extends ResetPasswordState {
  final String error;
  const ErrorStateReset(this.error, {super.message, super.retryActionFunction});
}
class InvalidIdentity extends ResetPasswordState{
  const InvalidIdentity({required super.message});
}