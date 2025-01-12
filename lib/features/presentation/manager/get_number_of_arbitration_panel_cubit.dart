import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/function.dart';
import 'package:reac/features/domain/models/claim_model/details_response_model.dart';
import 'package:reac/features/domain/models/claim_model/number_of_arbitrations.dart';
import 'package:reac/features/domain/models/claim_model/number_of_arbitrations_request_model.dart';
import 'package:reac/features/domain/use_cases/claim/get_arbitrators_count_List_use_case.dart';
import 'package:reac/features/domain/use_cases/claim/get_number_of_arbitration_panel_use_case.dart';
import '../../domain/models/claim_model/cliam_model.dart';
import '../../domain/use_cases/claim/get_number_of_arbitrations_use_case.dart';
import '../../domain/use_cases/claim/number_of_arbitrations_request_use_case.dart';
import 'get_claim_states.dart';
@injectable
class NumberOfArbitrationPanelCubit extends Cubit<ClaimStates> {
  int pageIndex = 1;
  int pageSize = 10;
  bool hasNextPage = true;
  GetNumberOfArbitrationPanelUseCase getNumberOfArbitrationPanelUseCase;
  GetArbitratorsCountListUseCase   getArbitratorsCountListUseCase;
  GetNumberOfArbitrationUseCase    getNumberOfArbitrationUseCase;
  NumberOfArbitrationRequestUseCase numberOfArbitrationRequestUseCase;
  DetailsResponseModel? numberOfArbitrationPanelModel;
  DetailsResponseModel? numberOfArbitrationPanelModelResponse;
  List<NumberOfArbitrationsModel>? numberOfArbitrationsModel;
  ClaimResponse? arbitratorsCountReplyModel;
  NumberOfArbitrationPanelCubit(this.getArbitratorsCountListUseCase,this.getNumberOfArbitrationPanelUseCase,this.getNumberOfArbitrationUseCase,this.numberOfArbitrationRequestUseCase)
      : super(IdleState(retryActionFunction: () {}));

  static NumberOfArbitrationPanelCubit get(context) => BlocProvider.of(context);

  Future<void> executeNumberOfArbitrationPanel({String? requestId}) async {
    emit(const LoadingState());
    getNumberOfArbitrationPanelUseCase.litigationRequestId = requestId ?? "";
    var response = await getNumberOfArbitrationPanelUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      numberOfArbitrationPanelModel = data.data;
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }
  Future<void> executeNumberOfArbitration() async {
    emit(const LoadingState());
    var response = await getNumberOfArbitrationUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      numberOfArbitrationsModel = data.data;
      numberOfArbitrationsModel?.map((e)=>e.arbitratorCount).toList();
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }
  Future<void> executeNumberOfArbitrationRequest({NumberOfArbitractionsRequestModel? numberOfArbitractionsRequestModel}) async {
    if (isClosed) return;
    emit(const LoadingState());

    numberOfArbitrationRequestUseCase.numberOfArbitractionsRequestModel = numberOfArbitractionsRequestModel;

    var response = await numberOfArbitrationRequestUseCase.execute();

    if (isClosed) return;

    response.fold((error) {
      if (!isClosed) {
        emit(ErrorState(error.toString(), message: error.message.toString()));
      }
    }, (data) {
      numberOfArbitrationPanelModelResponse = data.data;
      if (!isClosed) {
        emit(SuccessState(data, message: data.message));
      }
    });
  }
  Future<void> execute() async {
    emit(const LoadingState());
    getArbitratorsCountListUseCase.pageSize = pageSize;
    getArbitratorsCountListUseCase.pageIndex = pageIndex;
    var response = await getArbitratorsCountListUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      if (pageIndex ==1) {
        arbitratorsCountReplyModel = data.data;
      } else {
        arbitratorsCountReplyModel?.results = [...arbitratorsCountReplyModel?.results ?? [], ...data.data?.results ?? []];
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
