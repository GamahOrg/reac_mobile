import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:reac/app/core/data/response/base_response.dart';
import 'package:reac/features/data/remote_data_source/claim_remote_data_source.dart';
import 'package:reac/features/domain/models/claim_model/agreement_action.dart';
import 'package:reac/features/domain/models/claim_model/agreement_model.dart';
import 'package:reac/features/domain/models/claim_model/arbitration_request_model.dart';
import 'package:reac/features/domain/models/claim_model/claim_details_model.dart';
import 'package:reac/features/domain/models/claim_model/claim_event_model.dart';
import 'package:reac/features/domain/models/claim_model/details_response_model.dart';
import 'package:reac/features/domain/models/claim_model/list%20_of_%20reconciliation%20_sessions_model.dart';
import 'package:reac/features/domain/models/claim_model/notification_model.dart';
import 'package:reac/features/domain/models/claim_model/number_of_arbitrations.dart';
import 'package:reac/features/domain/models/claim_model/number_of_arbitrations_request_model.dart';
import 'package:reac/features/domain/models/claim_model/reconciliation.dart';
import 'package:reac/features/domain/models/claim_model/selection_arbitrator_body.dart';
import 'package:reac/features/domain/models/claim_model/upload_file_request.dart';
import 'package:reac/features/domain/models/claim_model/upload_file_response.dart';
import '../../../app/app_prefs.dart';
import '../../../app/core/data/network/error_handler.dart';
import '../../../app/core/data/network/safe_api.dart';
import '../../domain/models/claim_model/cliam_model.dart';
import '../../domain/repository/claim_repository.dart';

@Injectable(as: ClaimRepository)
class ClaimRepositoryImpl implements ClaimRepository {
  final ClaimRemoteDataSource _remoteDataSource;
  final AppPreferences appPreferences;
  final SafeApi safeApi;

  ClaimRepositoryImpl(
    this._remoteDataSource,
    this.appPreferences,
    this.safeApi,
  );

  @override
  Future<Either<Failure, BaseResponse<ClaimResponse>>> getClaims(
      int pageSize,
      int pageIndex,
      String searchKey,
      List<int> statuses,
      List<int> types) async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getClaims(
            pageSize, pageIndex, searchKey, statuses, types));
  }

  @override
  Future<Either<Failure, BaseResponse<ClaimDetailsModel>>> getClaimDetails(
      String litigationId) async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getClaimsDetails(litigationId));
  }

  @override
  Future<Either<Failure, BaseResponse<List<ClaimEventModel>>>> getClaimEvents(
      String requestId) async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getClaimsEvent(requestId));
  }

  @override
  Future<Either<Failure, BaseResponse<AgreementModel>>> getAgreementDetailsApi(
      String requestId) async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getAgreementDetailsApi(requestId));
  }

  @override
  Future<Either<Failure, BaseResponse<AgreementModel>>>
      getAgreementDetailsActionApi(AgreementAction agreementAction) async {
    return await safeApi.call(
        apiCall:
            _remoteDataSource.getAgreementDetailsActionApi(agreementAction));
  }
  ///////////////////تحديد عدد المحكمين

  @override
  Future<Either<Failure, BaseResponse<ClaimResponse>>>
  getArbitratorsCountListApi(int pageSize, int pageIndex) async {
    return await safeApi.call(
        apiCall:
        _remoteDataSource.getArbitratorsCountListApi(pageSize, pageIndex));
  }

  @override
  Future<Either<Failure, BaseResponse<DetailsResponseModel>>>
      getNumberOfArbitrationPanelApi(String litigationRequestId) async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getNumberOfArbitrationPanelApi(litigationRequestId));
  }

  @override
  Future<Either<Failure, BaseResponse<List<NumberOfArbitrationsModel>>>>
      getNumberOfArbitrationApi() async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getNumberOfArbitrationApi());
  }

  @override
  Future<Either<Failure, BaseResponse<DetailsResponseModel>>>
      getNumberOfArbitrationRequestApi(
          NumberOfArbitractionsRequestModel
              numberOfArbitractionsRequestModel) async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getNumberOfArbitrationRequestApi(
            numberOfArbitractionsRequestModel));
  }
  ///////////////////تحديد عدد المحكمين
  //////////////تعيين اعضاء هىئه التحكيم
  //
  @override
  Future<Either<Failure, BaseResponse<ClaimResponse>>>
  getArbitratorsNominationListApi(int pageSize, int pageIndex) async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getArbitratorsNominationListApi(
            pageSize, pageIndex));
  }

  @override
  Future<Either<Failure, BaseResponse<DetailsResponseModel>>>
      getArbitratorsNominationApi(String requestId) async {
    return await safeApi.call(
        apiCall:
            _remoteDataSource.getArbitratorsNominationApi(requestId));
  }

  @override
  Future<Either<Failure, BaseResponse<DetailsResponseModel>>>
      addArbitratorsNominationApi(
          SelectionArbitratorRequest selectionarbitratorRequest) async {
    return await safeApi.call(
        apiCall: _remoteDataSource
            .addArbitratorsNominationApi(selectionarbitratorRequest));
  }
//////////////تعيين اعضاء هىئه التحكيم
  @override
  Future<Either<Failure, BaseResponse<Reconciliation>>> getReconciliationApi(
      String requestId) async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getReconciliationApi(requestId));
  }

  @override
  Future<Either<Failure, BaseResponse<Reconciliation>>> postReconciliationApi(
      String requestId, int minutesOfMeetingApprovalStatus) async {
    return await safeApi.call(
        apiCall: _remoteDataSource.postReconciliationApi(
            requestId, minutesOfMeetingApprovalStatus));
  }

  @override
  Future<Either<Failure, BaseResponse<DetailsResponseModel>>>
      interpretationOfTheRulingApi(String litigationRequestId) async {
    return await safeApi.call(
        apiCall: _remoteDataSource
            .interpretationOfTheRulingApi(litigationRequestId));
  }

  @override
  Future<Either<Failure, BaseResponse<List<UploadFileResponse>>>>
      uploadFileRequestApi(UploadFileRequest uploadFileRequest) async {
    return await safeApi.call(
        apiCall: _remoteDataSource.uploadFileRequestApi(uploadFileRequest));
  }

  @override
  Future<Either<Failure, BaseResponse>> addArbitrationRequestApi(
      ArbitrationRequestModel arbitrationRequestModel) async {
    return await safeApi.call(
        apiCall: _remoteDataSource
            .addArbitrationRequestApi(arbitrationRequestModel));
  }

  @override
  Future<Either<Failure, BaseResponse<DetailsResponseModel>>>
      getLitigationRequestForReportExplanationRequestByRequestId(
          String litigationRequestId) async {
    return await safeApi.call(
        apiCall: _remoteDataSource
            .getLitigationRequestForReportExplanationRequestByRequestId(
                litigationRequestId));
  }





  @override
  Future<Either<Failure, BaseResponse<ClaimResponse>>> getReconciliationListApi(
      int pageSize, int pageIndex) async {
    return await safeApi.call(
        apiCall: _remoteDataSource.reconciliationListApi(pageSize, pageIndex));
  }

  @override
  Future<Either<Failure, BaseResponse<ClaimResponse>>> getInterpretationListApi(int pageSize, int pageIndex)async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getInterpretationListApi(pageSize, pageIndex));
  }

  @override
  Future<Either<Failure, BaseResponse<ClaimResponse>>> getAgreementListApi(int pageSize, int pageIndex)async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getAgreementListApi(pageSize, pageIndex));
  }

  @override
  Future<Either<Failure, BaseResponse<NotificationModel>>> getNotificationApi()async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getNotificationListApi());
  }

  @override
  Future<Either<Failure, BaseResponse<ReconciliationSessionsModel>>> getLitigationRequestForAllSessionApi(int pageSize, int pageIndex)async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getLitigationRequestForAllSessionApi(pageSize, pageIndex));
  }

  @override
  Future<Either<Failure, BaseResponse<ReconciliationSessionsModel>>> getArbitrationSessionLitigationRequestForAllSession(int pageSize, int pageIndex)async {
    return await safeApi.call(
        apiCall: _remoteDataSource.getArbitrationSessionLitigationRequestForAllSession(pageSize, pageIndex));
  }

  @override
  Future<Either<Failure, BaseResponse>> sendLitigationFeesRequestPaid(String litigationId)async {
    return await safeApi.call(
        apiCall: _remoteDataSource.sendLitigationFeesRequestPaid(litigationId));
  }
}
