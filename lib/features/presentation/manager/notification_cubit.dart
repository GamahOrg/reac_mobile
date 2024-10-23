import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/features/domain/models/claim_model/notification_model.dart';
import '../../domain/use_cases/claim/get_notification_use_case.dart';
import 'get_claim_states.dart';

@injectable
class NotificationCubit extends Cubit<ClaimStates> {
  GetNotificationUseCase getNotificationUseCase;
  NotificationModel? notificationModel;
  NotificationCubit(this.getNotificationUseCase)
      : super(IdleState(retryActionFunction: () {}));

  static NotificationCubit get(context) => BlocProvider.of(context);
  Future<void> execute() async {
    emit(const LoadingState());
    var response = await getNotificationUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      notificationModel = data.data;
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }
}
