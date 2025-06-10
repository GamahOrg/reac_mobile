import '../../../app/state_render/state_render.dart';

class ClaimStates extends AppState{
  const ClaimStates({super.message,super.retryActionFunction});
}
class IdleState extends ClaimStates {
  const IdleState({super.retryActionFunction});
}
class LoadingState extends ClaimStates {
  const LoadingState({super.message});
}
class LoadingMoreState extends ClaimStates {
  const LoadingMoreState({super.message});
}

class SuccessState<T> extends ClaimStates {
  final T data;
  const SuccessState(this.data, {super.message, super.retryActionFunction});
}
class SuccessStateAgreementAction<T> extends ClaimStates {
  final T data;
  const SuccessStateAgreementAction(this.data, {super.message, super.retryActionFunction});
}

class SuccessStateSendLitigationFeesRequestPaid<T> extends ClaimStates {
  final T data;
  const SuccessStateSendLitigationFeesRequestPaid(this.data, {super.message, super.retryActionFunction});
}

class SuccessNumberArbitrationsRequestState<T> extends ClaimStates {
  final T data;
  const SuccessNumberArbitrationsRequestState(this.data, {super.message, super.retryActionFunction});
}
class ErrorState extends ClaimStates {
  final String error;
  const ErrorState(this.error, {super.message, super.retryActionFunction});
}
class ArbitratorsUpdated<T> extends ClaimStates{
  final T data;
  const ArbitratorsUpdated(this.data, {super.message, super.retryActionFunction});
}
class SuccessAddArbitrationRequest<T> extends ClaimStates{
  final T data;
   bool? isDone;
   SuccessAddArbitrationRequest(this.data,this.isDone, {super.message, super.retryActionFunction});
}
class SuccessRequestReconcilition<T> extends ClaimStates{
  final T data;
   bool? isDone;
  SuccessRequestReconcilition(this.data, {super.message, super.retryActionFunction});
}
class SuccessGetExplanation<T> extends ClaimStates{
  final T data;
   bool? isDone;
  SuccessGetExplanation(this.data, {super.message, super.retryActionFunction});
}
class ErrorAddArbitrationRequest<T> extends ClaimStates{
  final T data;
   const ErrorAddArbitrationRequest(this.data,{super.message, super.retryActionFunction});
}
