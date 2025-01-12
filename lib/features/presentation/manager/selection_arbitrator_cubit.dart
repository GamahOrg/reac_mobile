import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/function.dart';
import 'package:reac/features/domain/use_cases/claim/add_arbitrations_use_case.dart';
import 'package:reac/features/domain/use_cases/claim/get_arbitrators_nomination_List_use_case.dart';
import '../../domain/models/claim_model/cliam_model.dart';
import '../../domain/models/claim_model/details_response_model.dart';
import '../../domain/models/claim_model/selection_arbitrator_body.dart';
import '../../domain/use_cases/claim/get_arbitrations_use_case.dart';
import 'get_claim_states.dart';

@injectable
class AppointmentMembersArbitrationPanelCubit extends Cubit<ClaimStates> {
  GetArbitratorUseCase getArbitratorUseCase;
  AddArbitratorUseCase addArbitratorUseCase;
  GetArbitratorsNominationListUseCase getArbitratorsNominationListUseCase;
  DetailsResponseModel? arbitratorsModelGet;
  ClaimResponse? arbitratorsNominationList;
  DetailsResponseModel? arbitratorsModelPost;
  var numberedList=[];
  void createNumberedList() {
    numberedList = List.generate(arbitratorsModelGet!.citizenArbitratorShortStatusDtos!.length, (index) {
      int number = index + 1;
      return number;
    });
  }
  int pageIndex = 1;
  int pageSize = 10;
  bool hasNextPage = true;

  AppointmentMembersArbitrationPanelCubit(this.getArbitratorUseCase,this.addArbitratorUseCase,this.getArbitratorsNominationListUseCase)
      : super(IdleState(retryActionFunction: () {}));

  static AppointmentMembersArbitrationPanelCubit get(context) => BlocProvider.of(context);

  Future<void> execute() async {
    emit(const LoadingState());
    getArbitratorsNominationListUseCase.pageSize = pageSize;
    getArbitratorsNominationListUseCase.pageIndex = pageIndex;
    var response = await getArbitratorsNominationListUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      if (pageIndex ==1) {
        arbitratorsNominationList = data.data;
      } else {
        arbitratorsNominationList?.results = [...arbitratorsNominationList?.results ?? [], ...data.data?.results ?? []];
      }
      if ((data.data?.results?.length ?? 0) < pageSize) {
        hasNextPage = false;
      } else {
        hasNextPage = true;
      }
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }
  Future<void> executeGetArbitrator({String? requestId}) async {
    emit(const LoadingState());
    getArbitratorUseCase.requestId = requestId ?? "";
    var response = await getArbitratorUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      arbitratorsModelGet = data.data;
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }
 Future<void> executeAddArbitrator({SelectionArbitratorRequest? selectionArbitratorRequest}) async {
    emit(const LoadingState());
    addArbitratorUseCase.selectionarbitratorRequest = selectionArbitratorRequest;
    var response = await addArbitratorUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      arbitratorsModelPost = data.data;
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }
}
