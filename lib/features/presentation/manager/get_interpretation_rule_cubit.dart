import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:open_file/open_file.dart';
import 'package:reac/features/domain/models/claim_model/cliam_model.dart';
import 'package:reac/features/domain/models/claim_model/upload_file_request.dart';
import 'package:reac/features/domain/models/claim_model/upload_file_response.dart';
import 'package:reac/features/domain/use_cases/claim/get_interpretation_list_use_case.dart';
import 'package:reac/features/domain/use_cases/claim/interpretation_ruling_use_case.dart';
import 'package:reac/features/domain/use_cases/claim/upload_file_use_case.dart';

import '../../domain/models/claim_model/arbitration_request_model.dart';
import '../../domain/models/claim_model/details_response_model.dart';
import '../../domain/use_cases/claim/add_arbitration_request_use_case.dart';
import '../../domain/use_cases/claim/get_litigation_request_for_report_explanation_ue_case.dart';
import 'get_claim_states.dart';

@injectable
class InterpretationRulingCubit extends Cubit<ClaimStates> {
  int pageIndex = 1;
  int pageSize = 10;
  bool hasNextPage = true;
  int maxLength = 500;
  final GlobalKey<FormState> formKey = GlobalKey();
  FilePickerResult? result;

  String? getFileExtension(String fileName) {
    return fileName.split('.').last;
  }

  Future<void> pickFiles() async {
    result = await FilePicker.platform.pickFiles(
      allowMultiple: false, // Only pick one file
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'xls', 'docx', 'png'],
    );
  }

  TextEditingController interpretationController = TextEditingController();
  List<String>? ids;
  GetInterpretationRuleUseCase getInterpretationRuleUseCase;

  UploadFileUseCase uploadFileUseCase;
  GetInterpretationListUseCase getInterpretationListUseCase;
  AddArbitrationRequestUseCase addArbitrationRequestUseCase;
  GetLitigationRequestForReportExplanationUseCase
      getLitigationRequestForReportExplanationUseCase;
  DetailsResponseModel? interpretationRulingModel;
  DetailsResponseModel? explanationDisplayModel;
  List<UploadFileResponse>? uploadFileResponse;
  ClaimResponse? interpretationList;

  InterpretationRulingCubit(
      this.getInterpretationRuleUseCase,
      this.uploadFileUseCase,
      this.addArbitrationRequestUseCase,
      this.getLitigationRequestForReportExplanationUseCase,
      this.getInterpretationListUseCase)
      : super(IdleState(retryActionFunction: () {}));

  static InterpretationRulingCubit get(context) => BlocProvider.of(context);

  Future<void> executeInterpretationRuling(
      {String? litigationRequestId}) async {
    emit(const LoadingState());
    getInterpretationRuleUseCase.requestId = litigationRequestId ?? "";
    var response = await getInterpretationRuleUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      interpretationRulingModel = data.data;
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }

  Future<void> uploadFile({UploadFileRequest? uploadFileRequest}) async {
    emit(const LoadingState());
    uploadFileUseCase.uploadFileRequest = uploadFileRequest;
    var response = await uploadFileUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      uploadFileResponse = data.data;
      emit(SuccessState(data, message: 'Data loaded successfully!'));
    });
  }

  Future<void> executeAddArbitrationRequest(
      {ArbitrationRequestModel? arbitrationRequestModel}) async {
    emit(const LoadingState());
    addArbitrationRequestUseCase.arbitrationRequestModel =
        arbitrationRequestModel;
    var response = await addArbitrationRequestUseCase.execute();
    response.fold((error) {
      emit(
          ErrorAddArbitrationRequest(error, message: error.message.toString()));
    }, (data) {
      emit(SuccessAddArbitrationRequest(data, data.isDone,
          message: data.message.toString()));
    });
  }

  Future<void> executeGetLitigationRequestForReportExplanation(
      {String? litigationRequestId}) async {
    emit(const LoadingState());
    getLitigationRequestForReportExplanationUseCase.litigationId =
        litigationRequestId ?? "";
    var response =
        await getLitigationRequestForReportExplanationUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      explanationDisplayModel = data.data;
      emit(SuccessGetExplanation(data, message: 'Data loaded successfully!'));
    });
  }

  Future<void> execute() async {
    emit(const LoadingState());
    getInterpretationListUseCase.pageSize = pageSize;
    getInterpretationListUseCase.pageIndex = pageIndex;
    var response = await getInterpretationListUseCase.execute();
    response.fold((error) {
      emit(ErrorState(error.toString(), message: error.message.toString()));
    }, (data) {
      if (pageIndex ==1) {
        interpretationList = data.data;
      } else {
        interpretationList?.results = [...interpretationList?.results ?? [], ...data.data?.results ?? []];
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
