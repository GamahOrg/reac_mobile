import 'dart:io';
import 'package:dio/dio.dart';
import 'package:reac/features/domain/models/claim_model/details_response_model.dart';
import 'package:reac/features/domain/models/claim_model/reconciliation.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../app/api_urls.dart';
import '../../../app/core/data/response/base_response.dart';
import '../../domain/models/claim_model/agreement_action.dart';
import '../../domain/models/claim_model/agreement_model.dart';
import '../../domain/models/claim_model/arbitration_request_model.dart';
import '../../domain/models/claim_model/claim_details_model.dart';
import '../../domain/models/claim_model/claim_event_model.dart';
import '../../domain/models/claim_model/cliam_model.dart';
import '../../domain/models/claim_model/notification_model.dart';
import '../../domain/models/claim_model/number_of_arbitrations.dart';
import '../../domain/models/claim_model/number_of_arbitrations_request_model.dart';
import '../../domain/models/claim_model/selection_arbitrator_body.dart';
import '../../domain/models/claim_model/upload_file_response.dart';

part 'claim_api_service.g.dart';

@RestApi()
abstract class ClaimServiceClient {
  factory ClaimServiceClient(Dio dio, {String baseUrl}) = _ClaimServiceClient;

  @GET(ApiUrls.claims)
  Future<BaseResponse<ClaimResponse>> getClaimsApi(
    @Query("PageIndex") int? PageIndex,
    @Query("pageSize") int? pageSize,
    @Query("searchKey") String? searchKey,
    @Query("statuses") List<int>? statuses,
    @Query("types") List<int>? types,
  );

  @GET(ApiUrls.claimDetails)
  Future<BaseResponse<ClaimDetailsModel>> getClaimsDetailsApi(
    @Query("litigationId") String? litigationId,
  );

  @GET(ApiUrls.claimEvents)
  Future<BaseResponse<List<ClaimEventModel>>> getClaimsEventApi(
    @Query("requestId") String? requestId,
  );

  @GET(ApiUrls.getCitizenLitigationRequestForAgreementRequestReplyByRequestId)
  Future<BaseResponse<AgreementModel>> getAgreementApi(
    @Query("requestId") String? requestId,
  );

  @POST(ApiUrls.addCitizenLitigationRequestForAgreementRequestReply)
  Future<BaseResponse<AgreementModel>> getAgreementActionApi(
      @Body() AgreementAction agreementAction);

  @GET(ApiUrls.getCitizenLitigationRequestForReportReplyByRequestId)
  Future<BaseResponse<Reconciliation>> getReconciliationApi(
    @Query("requestId") String? requestId,
  );

  @POST(ApiUrls.addCitizenLitigationRequestForReportReply)
  Future<BaseResponse<Reconciliation>> postReconciliationApi(
    @Query("requestId") String? requestId,
    @Query("minutesOfMeetingApprovalStatus")
    int? minutesOfMeetingApprovalStatus,
  );

  @GET(ApiUrls.getLitigationRequestForReportByRequestId)
  Future<BaseResponse<DetailsResponseModel>> interpretationOfTheRulingApi(
    @Query("litigationRequestId") String? litigationRequestId,
  );

  @POST(ApiUrls.uploadFile)
  @MultiPart()
  Future<BaseResponse<List<UploadFileResponse>>> uploadFileRequestApi(
      @Part(name: 'files') List<File> files);

  @POST(ApiUrls.addArbitrationReportExplanationRequest)
  Future<BaseResponse> addArbitrationRequestApi(
      @Body() ArbitrationRequestModel arbitrationRequestModel);

  @GET(ApiUrls.getLitigationRequestForReportExplanationRequestByRequestId)
  Future<BaseResponse<DetailsResponseModel>>
      getLitigationRequestForReportExplanationRequestByRequestId(
    @Query("litigationRequestId") String? litigationRequestId,
  );

  ////////////////////////////////تحديد عدد المحكمين
  @GET(ApiUrls.getCitizenLitigationRequestForArbitratorsCountReply)
  Future<BaseResponse<ClaimResponse>> getArbitratorsCountListApi(
    @Query("pageSize") int? pageSize,
    @Query("pageIndex") int? PageIndex,
  );

  @GET(ApiUrls.getLitigationRequestForAddArbitratorsCountByRequestId)
  Future<BaseResponse<DetailsResponseModel>> getNumberOfArbitrationPanelApi(
    @Query("requestId") String? requestId,
  );

  @GET(ApiUrls.getNumberOfArbitrationPanel)
  Future<BaseResponse<List<NumberOfArbitrationsModel>>>
      getNumberOfArbitrationApi();

  @POST(ApiUrls.addArbitratorsCount)
  Future<BaseResponse<DetailsResponseModel>> getNumberOfArbitrationRequestApi(
      @Body()
      NumberOfArbitractionsRequestModel numberOfArbitractionsRequestModel);

  ////////////////تحديد عدد المحكمين

  /////////////////////////////////////تعيين اعضاء هيئة التحكيم///////////////
  @GET(ApiUrls.getCitizenLitigationRequestForArbitratorsNominationListReply)
  Future<BaseResponse<ClaimResponse>> getArbitratorsNominationListApi(
    @Query("pageSize") int? pageSize,
    @Query("pageIndex") int? PageIndex,
  );

  @GET(ApiUrls
      .getCitizenLitigationRequestForArbitratorsNominationListReplyByRequestId)
  Future<BaseResponse<DetailsResponseModel>> getArbitratorListReplyApi(
    @Query("litigationRequestId") String? requestId,
  );

  @POST(ApiUrls
      .addCitizenLitigationRequestForReportArbitratorsNominationListReply)
  Future<BaseResponse<DetailsResponseModel>> addNumberOfArbitrationRequestApi(
      @Body() SelectionArbitratorRequest selectionarbitratorRequest);

  ///////////////////////////////////////تعيين اعضاء هيئة التحكيم///////////////

  @GET(ApiUrls.getCitizenLitigationRequestForReportReply)
  Future<BaseResponse<ClaimResponse>> getReconciliationListApi(
    @Query("pageSize") int? pageSize,
    @Query("pageIndex") int? PageIndex,
  );

  @GET(ApiUrls.getLitigationRequestForReportExplanationRequest)
  Future<BaseResponse<ClaimResponse>> getInterpretationListApi(
    @Query("pageSize") int? pageSize,
    @Query("pageIndex") int? PageIndex,
  );

  @GET(ApiUrls.getCitizenLitigationRequestForAgreementRequestReply)
  Future<BaseResponse<ClaimResponse>> getAgreementListApi(
    @Query("pageSize") int? pageSize,
    @Query("pageIndex") int? PageIndex,
  );

  @GET(ApiUrls.getNotification)
  Future<BaseResponse<NotificationModel>> getNotificationListApi();
}
