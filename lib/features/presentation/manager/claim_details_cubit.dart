import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/function.dart';
import 'package:reac/features/domain/models/claim_model/claim_details_model.dart';
import 'package:reac/features/domain/use_cases/claim/get_claim_details_use_case.dart';

import '../../domain/models/claim_model/claim_event_model.dart';
import '../../domain/use_cases/claim/get_claim_event_use_case.dart';
import 'get_claim_states.dart';

@injectable
class ClaimDetailsCubit extends Cubit<ClaimStates> {
  GetClaimDetailsUseCase getClaimDetailsUseCase;
  GetClaimEventsUseCase getClaimEventsUseCase;
  List<ClaimEventModel>? claimEventModel;
  ClaimDetailsModel? claimDetailsResponse;

  ClaimDetailsCubit(this.getClaimDetailsUseCase, this.getClaimEventsUseCase)
      : super(IdleState(retryActionFunction: () {}));

  static ClaimDetailsCubit get(context) => BlocProvider.of(context);

  Future<void> executeDataClaim({String? litigationId}) async {
    emit(const LoadingState());
    getClaimDetailsUseCase.litigationId = litigationId ?? "";
    var response = await getClaimDetailsUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      claimDetailsResponse = data.data;
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }

  Future<void> executeEventClaim({String? requestId}) async {
    emit(const LoadingState());
    getClaimEventsUseCase.requestId = requestId ?? "";
    var response = await getClaimEventsUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      claimEventModel = data.data;
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }
}
