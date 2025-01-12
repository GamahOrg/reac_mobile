import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/features/domain/models/claim_model/agreement_action.dart';
import 'package:reac/features/domain/models/claim_model/agreement_model.dart';
import 'package:reac/features/domain/models/claim_model/cliam_model.dart';
import 'package:reac/features/domain/use_cases/claim/agreement_action_use_case.dart';
import 'package:reac/features/domain/use_cases/claim/agreement_use_case.dart';
import 'package:reac/features/domain/use_cases/claim/get_agreement_list_use_case.dart';
import 'package:reac/my_app.dart';
import 'get_claim_states.dart';

@injectable
class AgreementCubit extends Cubit<ClaimStates> {
  int pageIndex = 1;
  int pageSize = 10;
  bool hasNextPage = true;
  AgreementDetailsUseCase getAgreementUseCase;
  AgreementActionUseCase agreementActionUseCase;
  AgreementListUseCase getAgreementListUseCase;
  AgreementModel? agreementModel;
  AgreementModel? agreementModelAction;
  ClaimResponse? agreementList;
  AgreementCubit(this.getAgreementUseCase,this.agreementActionUseCase,this.getAgreementListUseCase)
      : super(IdleState(retryActionFunction: () {}));

  static AgreementCubit get(context) => BlocProvider.of(context);

  Future<void> executeDetailsAgreement({String? requestId}) async {
    emit(const LoadingState());
    getAgreementUseCase.requestId = requestId ?? "";
    var response = await getAgreementUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      agreementModel = data.data;
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }
  Future<void> executeDetailsAgreementAction({AgreementAction? agreementAction}) async {
    emit(const LoadingState());
    agreementActionUseCase.agreementAction = agreementAction;
    var response = await agreementActionUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      agreementModelAction = data.data;
      emit(SuccessStateAgreementAction(
        data,
        message: agreementActionUseCase.agreementAction?.agreementRequestStatus == 1
            ? MyApp.tr.theArbitrationAgreementRequestHasBeenSuccessfullyAccepted
            : MyApp.tr.theRequestForArbitrationAgreementWasRejected,
      ));
    });
  }
  Future<void> execute() async {
    emit(const LoadingState());
    getAgreementListUseCase.pageSize = pageSize;
    getAgreementListUseCase.pageIndex = pageIndex;
    var response = await getAgreementListUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      if (pageIndex ==1) {
        agreementList = data.data;
      } else {
        agreementList?.results = [...agreementList?.results ?? [], ...data.data?.results ?? []];
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
