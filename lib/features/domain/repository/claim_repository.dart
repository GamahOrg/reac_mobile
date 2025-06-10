import 'package:dartz/dartz.dart';
import 'package:reac/app/core/data/response/base_response.dart';
import 'package:reac/features/domain/models/claim_model/agreement_action.dart';
import 'package:reac/features/domain/models/claim_model/claim_details_model.dart';
import 'package:reac/features/domain/models/claim_model/details_response_model.dart';
import 'package:reac/features/domain/models/claim_model/list%20_of_%20reconciliation%20_sessions_model.dart';
import 'package:reac/features/domain/models/claim_model/notification_model.dart';
import 'package:reac/features/domain/models/claim_model/number_of_arbitrations.dart';
import 'package:reac/features/domain/models/claim_model/reconciliation.dart';
import 'package:reac/features/domain/models/claim_model/upload_file_request.dart';
import 'package:reac/features/domain/models/claim_model/upload_file_response.dart';
import '../../../app/core/data/network/error_handler.dart';
import '../models/claim_model/agreement_model.dart';
import '../models/claim_model/arbitration_request_model.dart';
import '../models/claim_model/claim_event_model.dart';
import '../models/claim_model/cliam_model.dart';
import '../models/claim_model/number_of_arbitrations_request_model.dart';
import '../models/claim_model/selection_arbitrator_body.dart';

abstract class ClaimRepository{
  const ClaimRepository();
  Future<Either<Failure, BaseResponse<ClaimResponse>>> getClaims(int pageSize,int pageIndex,String search, List<int> statuses,List<int> types);
  Future<Either<Failure, BaseResponse<ClaimDetailsModel>>> getClaimDetails(String litigationId);
  Future<Either<Failure, BaseResponse<List<ClaimEventModel>>>> getClaimEvents(String requestId);
  Future<Either<Failure, BaseResponse<AgreementModel>>> getAgreementDetailsApi(String requestId);
  Future<Either<Failure, BaseResponse<AgreementModel>>> getAgreementDetailsActionApi(AgreementAction agreementAction);
  /////////////////عدد المحكمين///////
 Future<Either<Failure, BaseResponse<DetailsResponseModel>>> getNumberOfArbitrationPanelApi(String litigationRequestId);
  Future<Either<Failure, BaseResponse<List<NumberOfArbitrationsModel>>>> getNumberOfArbitrationApi();
  Future<Either<Failure, BaseResponse<ClaimResponse>>> getArbitratorsCountListApi( int pageSize, int pageIndex,);
  Future<Either<Failure, BaseResponse<DetailsResponseModel>>> getNumberOfArbitrationRequestApi(NumberOfArbitractionsRequestModel numberOfArbitractionsRequestModel);
  /////////////////عدد المحكمين///////
  /////////////تعيين اعضاء هىئه التحكيم
  Future<Either<Failure, BaseResponse<ClaimResponse>>> getArbitratorsNominationListApi( int pageSize, int pageIndex,);
  Future<Either<Failure, BaseResponse<DetailsResponseModel>>> getArbitratorsNominationApi(String requestId);
  Future<Either<Failure, BaseResponse<DetailsResponseModel>>> addArbitratorsNominationApi(SelectionArbitratorRequest selectionarbitratorRequest);
  /////////////تعيين اعضاء هىئه التحكيم
  Future<Either<Failure, BaseResponse<Reconciliation>>> getReconciliationApi(String requestId);
  Future<Either<Failure, BaseResponse<Reconciliation>>> postReconciliationApi(String requestId,int minutesOfMeetingApprovalStatus);
  Future<Either<Failure, BaseResponse<DetailsResponseModel>>> interpretationOfTheRulingApi(String litigationRequestId);
  Future<Either<Failure, BaseResponse<List<UploadFileResponse>>>> uploadFileRequestApi(UploadFileRequest uploadFileRequest);
  Future<Either<Failure, BaseResponse>> addArbitrationRequestApi(ArbitrationRequestModel arbitrationRequestModel);
  Future<Either<Failure, BaseResponse<DetailsResponseModel>>> getLitigationRequestForReportExplanationRequestByRequestId(String litigationRequestId);
  Future<Either<Failure, BaseResponse<ClaimResponse>>> getReconciliationListApi( int pageSize, int pageIndex,);
  Future<Either<Failure, BaseResponse<ClaimResponse>>> getInterpretationListApi( int pageSize, int pageIndex,);
  Future<Either<Failure, BaseResponse<ClaimResponse>>> getAgreementListApi( int pageSize, int pageIndex,);
  Future<Either<Failure, BaseResponse<NotificationModel>>> getNotificationApi();
  Future<Either<Failure, BaseResponse<ReconciliationSessionsModel>>> getLitigationRequestForAllSessionApi(int pageSize, int pageIndex);
  Future<Either<Failure, BaseResponse<ReconciliationSessionsModel>>> getArbitrationSessionLitigationRequestForAllSession(int pageSize, int pageIndex);
  Future<Either<Failure, BaseResponse>> sendLitigationFeesRequestPaid(String litigationId);

}





