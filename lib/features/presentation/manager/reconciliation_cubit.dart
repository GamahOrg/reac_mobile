import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/function.dart';
import 'package:reac/features/domain/models/claim_model/agreement_action.dart';
import 'package:reac/features/domain/models/claim_model/agreement_model.dart';
import 'package:reac/features/domain/models/claim_model/cliam_model.dart';
import 'package:reac/features/domain/models/claim_model/reconciliation.dart';
import 'package:reac/features/domain/use_cases/claim/agreement_action_use_case.dart';
import 'package:reac/features/domain/use_cases/claim/agreement_use_case.dart';
import 'package:reac/features/domain/use_cases/claim/get_reconciliation_use_case.dart';
import 'package:reac/features/domain/use_cases/claim/post_reconciliation_use_case.dart';
import 'package:reac/my_app.dart';
import '../../domain/use_cases/claim/get_reconciliation_list_use_case.dart';
import 'get_claim_states.dart';

@injectable
class ReconcilitionCubit extends Cubit<ClaimStates> {
  TextEditingController reasonRefuseController = TextEditingController();
  int maxLength = 250;
  GetReconciliationUseCase getReconciliationUseCase ;
  PostReconciliationUseCase postReconciliationUseCase;
  GetReconciliationListUseCase getReconciliationListUseCase;
 Reconciliation? reconciliation;
 ClaimResponse? reconciliationList;
 Reconciliation? reconciliationPost;
  int pageIndex = 1;
  int pageSize = 10;
  bool hasNextPage = true;
  ReconcilitionCubit(this.getReconciliationUseCase,this.postReconciliationUseCase,this.getReconciliationListUseCase)
      : super(IdleState(retryActionFunction: () {}));

  static ReconcilitionCubit get(context) => BlocProvider.of(context);
  Future<void> execute() async {
    emit(const LoadingState());
    getReconciliationListUseCase.pageSize = pageSize;
    getReconciliationListUseCase.pageIndex = pageIndex;
    var response = await getReconciliationListUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      reconciliationList = data.data;
      if ((data.data?.results?.length ?? 0) < pageSize) {
        hasNextPage = false;
      } else {
        hasNextPage = true;
      }
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }
  Future<void> executeGetReconciliation({String? requestId}) async {
    emit(const LoadingState());
    getReconciliationUseCase.requestId = requestId ?? "";
    var response = await getReconciliationUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      reconciliation = data.data;
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }
  Future<void> executePostReconciliation({String? requestId,int? minutesOfMeetingApprovalStatus}) async {
    emit(const LoadingState());
    postReconciliationUseCase.requestId = requestId ?? "";
    postReconciliationUseCase.minutesOfMeetingApprovalStatus=minutesOfMeetingApprovalStatus??0;
    var response = await postReconciliationUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      reconciliationPost = data.data;
      emit(SuccessRequestReconcilition(data, message: minutesOfMeetingApprovalStatus==1?MyApp.tr.acceptanceOfTheReconciliationReport:MyApp.tr.rejectionOfTheReconciliationReport));
    });
  }
}
