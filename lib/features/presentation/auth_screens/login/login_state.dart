
import 'package:reac/app/state_render/state_render.dart';

class LoginState extends AppState{
  const LoginState({super.message,super.retryActionFunction});
}
class LoadingState extends LoginState {
  const LoadingState({super.message, super.retryActionFunction});
}

class IdleState extends LoginState {
  const IdleState({super.retryActionFunction});
}

class SuccessState<T> extends LoginState {
  final T data;
  const SuccessState(this.data, {super.message, super.retryActionFunction});
}

class ErrorState extends LoginState {
  final String error;
  const ErrorState(this.error, {super.message, super.retryActionFunction});
}
class InvalidIdentity extends LoginState{
  const InvalidIdentity({required super.message});
}
class InvalidType extends LoginState{
  const InvalidType({required super.message});
}
class PasswordError extends LoginState{
  const PasswordError({required super.message});
}

