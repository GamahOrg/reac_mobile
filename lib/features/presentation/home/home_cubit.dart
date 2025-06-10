import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/features/domain/models/claim_model/cliam_model.dart';
import 'package:reac/features/domain/use_cases/claim/get_claim_details_use_case.dart';

import '../../../app/app_enums.dart';
import '../../../app/function.dart';
import '../../../my_app.dart';
import '../../domain/use_cases/claim/get_claims_use_case.dart';
import '../manager/get_claim_states.dart';
import 'model/filter_model.dart';

@injectable
class HomeCubit extends Cubit<ClaimStates> {
  GetClaimsUseCase getClaimUseCase;
  GetClaimDetailsUseCase getClaimDetailsUseCase;
  ClaimResponse? claimResponse;
  int pageIndex = 1;
  int pageSize = 10;
  bool hasNextPage = true;
  List<FilterModel> litigationTypes = [];
  List<FilterModel> litigationStates = [];

  HomeCubit(this.getClaimUseCase, this.getClaimDetailsUseCase)
      : super(IdleState(retryActionFunction: () {})) {
    _buildLitigationTypes();
    _buildLitigationStatus();
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> execute({String? searchKey}) async {
    emit(const LoadingState());

    // Clear results if it's the first page
    if (pageIndex == 1) {
      claimResponse?.results?.clear();
    }

    getClaimUseCase.pageSize = pageSize;
    getClaimUseCase.pageIndex = pageIndex;
    getClaimUseCase.searchKey = searchKey ?? "";
    getClaimUseCase.types = getSelectedTypeClaim() ?? [];
    getClaimUseCase.statuses = getSelectedStatus() ?? [];

    var response = await getClaimUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      if (pageIndex == 1) {
        claimResponse = data.data; // Replace with fresh data
      } else {
        claimResponse?.results = [...?claimResponse?.results, ...?data.data?.results]; // Append
      }

      hasNextPage = (data.data?.results?.length ?? 0) >= pageSize;

      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }


  void _buildLitigationTypes() {
    litigationTypes = [];
    litigationTypes.add(FilterModel(
        id: LitigationRequestContractType.rent.value, name: MyApp.tr.rent));
    litigationTypes.add(FilterModel(
        id: LitigationRequestContractType.properties.value,
        name: MyApp.tr.properties));
    litigationTypes.add(FilterModel(
        id: LitigationRequestContractType.wafi.value, name: MyApp.tr.wafi));
    litigationTypes.add(FilterModel(
        id: LitigationRequestContractType.realEstateBrokerage.value,
        name: MyApp.tr.realEstateBrokerage));
    litigationTypes.add(FilterModel(
        id: LitigationRequestContractType.otherServices.value,
        name: MyApp.tr.otherServices));
  }

  void _buildLitigationStatus() {
    litigationStates = [];

    litigationStates = LitigationStatus.values.map((status) {
      return FilterModel(id: status.value, name: status.name);
    }).toList();
  }

  List<int> getSelectedStatus() {
    List<int> selectedIds = litigationStates
        .where((option) => option.selected == true)
        .map((option) => option.id as int)
        .toList();

    return selectedIds;
  }

  List<int> getSelectedTypeClaim() {
    List<int> selectedIds = litigationTypes
        .where((option) => option.selected == true)
        .map((option) => option.id as int)
        .toList();

    return selectedIds;
  }
}
