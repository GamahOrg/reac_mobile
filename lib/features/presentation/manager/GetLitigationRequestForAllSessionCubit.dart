import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/features/domain/models/claim_model/agreement_action.dart';
import 'package:reac/features/domain/models/claim_model/agreement_model.dart';
import 'package:reac/features/domain/models/claim_model/cliam_model.dart';
import 'package:reac/features/domain/models/claim_model/list%20_of_%20reconciliation%20_sessions_model.dart';
import 'package:reac/features/domain/use_cases/claim/agreement_action_use_case.dart';
import 'package:reac/features/domain/use_cases/claim/agreement_use_case.dart';
import 'package:reac/features/domain/use_cases/claim/getLitigationRequestForAllSessionUseCase.dart';
import 'package:reac/features/domain/use_cases/claim/get_agreement_list_use_case.dart';
import 'package:reac/my_app.dart';
import 'get_claim_states.dart';

@injectable
class GetLitigationRequestForAllSessionCubit extends Cubit<ClaimStates> {
  int pageIndex = 1;
  int pageSize = 10;
  bool hasNextPage = true;
  GetLitigationRequestUseCase getLitigationRequestUseCase;
  ReconciliationSessionsModel? reconciliationSessionsModel;

  GetLitigationRequestForAllSessionCubit(this.getLitigationRequestUseCase)
      : super(IdleState(retryActionFunction: () {}));

  static GetLitigationRequestForAllSessionCubit get(context) => BlocProvider.of(context);

  Future<void> executeDetailsAgreement({String? requestId}) async {
    emit(const LoadingState());
    //getLitigationRequestUseCase.requestId = requestId ?? "";
    var response = await getLitigationRequestUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      reconciliationSessionsModel = data.data;
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }
  Future<void> execute() async {
    emit(const LoadingState());
    getLitigationRequestUseCase.pageSize = pageSize;
    getLitigationRequestUseCase.pageIndex = pageIndex;
    var response = await getLitigationRequestUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      if (pageIndex ==1) {
        reconciliationSessionsModel = data.data;
      } else {
        reconciliationSessionsModel?.results = [...reconciliationSessionsModel?.results ?? [], ...data.data?.results ?? []];
      }
      if ((data.data?.results?.length ?? 0) < pageSize) {
        hasNextPage = false;
      } else {
        hasNextPage = true;
      }
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }
}
