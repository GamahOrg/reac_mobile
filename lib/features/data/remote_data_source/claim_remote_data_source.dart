import 'package:injectable/injectable.dart';
import 'package:reac/app/core/data/response/base_response.dart';
import 'package:reac/features/domain/models/claim_model/arbitration_request_model.dart';
import 'package:reac/features/domain/models/claim_model/claim_details_model.dart';
import 'package:reac/features/domain/models/claim_model/notification_model.dart';
import 'package:reac/features/domain/models/claim_model/reconciliation.dart';
import 'package:reac/features/domain/models/claim_model/upload_file_request.dart';
import 'package:reac/features/domain/models/claim_model/upload_file_response.dart';
import '../../domain/models/claim_model/agreement_action.dart';
import '../../domain/models/claim_model/agreement_model.dart';
import '../../domain/models/claim_model/claim_event_model.dart';
import '../../domain/models/claim_model/cliam_model.dart';
import '../../domain/models/claim_model/details_response_model.dart';
import '../../domain/models/claim_model/number_of_arbitrations.dart';
import '../../domain/models/claim_model/number_of_arbitrations_request_model.dart';
import '../../domain/models/claim_model/selection_arbitrator_body.dart';
import 'claim_api_service.dart';

abstract class ClaimRemoteDataSource {
  Future<BaseResponse<ClaimResponse>> getClaims(
      int pageSize, int pageIndex, String searchKey,List<int> statuses,List<int> types);
  Future<BaseResponse<ClaimDetailsModel>> getClaimsDetails(String litigationId);
  Future<BaseResponse<List<ClaimEventModel>>> getClaimsEvent(String requestId);
  Future<BaseResponse<AgreementModel>> getAgreementDetailsApi(String requestId);
  Future<BaseResponse<AgreementModel>> getAgreementDetailsActionApi(AgreementAction agreementAction);
  ///////////////////تحديد عدد المحكمين
  Future<BaseResponse<ClaimResponse>> getArbitratorsCountListApi( int pageSize, int pageIndex,);
  Future<BaseResponse<DetailsResponseModel>> getNumberOfArbitrationPanelApi(String litigationRequestId);
 Future<BaseResponse<List<NumberOfArbitrationsModel>>> getNumberOfArbitrationApi();
 Future<BaseResponse<DetailsResponseModel>> getNumberOfArbitrationRequestApi(NumberOfArbitractionsRequestModel numberOfArbitractionsRequestModel);
  ///////////////////تحديد عدد المحكمين
  ////////تعيين اعضاء هيئه التحكيم
  Future<BaseResponse<ClaimResponse>> getArbitratorsNominationListApi( int pageSize, int pageIndex,);
  Future<BaseResponse<DetailsResponseModel>> getArbitratorsNominationApi(String requestId);
  Future<BaseResponse<DetailsResponseModel>> addArbitratorsNominationApi(SelectionArbitratorRequest selectionarbitratorRequest);
  ////////تعيين اعضاء هيئه التحكيم

  Future<BaseResponse<Reconciliation>> getReconciliationApi(String requestId);
  Future<BaseResponse<Reconciliation>> postReconciliationApi(String requestId,int minutesOfMeetingApprovalStatus);
  Future<BaseResponse<DetailsResponseModel>> interpretationOfTheRulingApi(String litigationRequestId);
  Future<BaseResponse<List<UploadFileResponse>>> uploadFileRequestApi(UploadFileRequest uploadFileRequest);
  Future<BaseResponse> addArbitrationRequestApi(ArbitrationRequestModel arbitrationRequestModel);
  Future<BaseResponse<DetailsResponseModel>> getLitigationRequestForReportExplanationRequestByRequestId(String litigationRequestId);
  Future<BaseResponse<ClaimResponse>> reconciliationListApi(int pageSize, int pageIndex,);
  Future<BaseResponse<ClaimResponse>> getInterpretationListApi(int pageSize, int pageIndex,);
  Future<BaseResponse<ClaimResponse>> getAgreementListApi(int pageSize, int pageIndex,);
  Future<BaseResponse<NotificationModel>> getNotificationListApi();

}

@Injectable(as: ClaimRemoteDataSource)
class ClaimRemoteDataSourceImpl implements ClaimRemoteDataSource {
  ClaimRemoteDataSourceImpl(this.claimServiceClient);

  final ClaimServiceClient claimServiceClient;

  @override
  Future<BaseResponse<ClaimResponse>> getClaims(
      int pageSize, int pageIndex, String searchKey,List<int> statuses,List<int> types) async {
    return await claimServiceClient.getClaimsApi(
        pageIndex, pageSize, searchKey,statuses,types);
  }

  @override
  Future<BaseResponse<ClaimDetailsModel>> getClaimsDetails(String litigationId)async {
    return await claimServiceClient.getClaimsDetailsApi(litigationId);
  }

  @override
  Future<BaseResponse<List<ClaimEventModel>>> getClaimsEvent(String requestId)async {
    return await claimServiceClient.getClaimsEventApi(requestId);

  }

  @override
  Future<BaseResponse<AgreementModel>> getAgreementDetailsApi(String requestId) async{
    return await claimServiceClient.getAgreementApi(requestId);
  }

  @override
  Future<BaseResponse<AgreementModel>> getAgreementDetailsActionApi(AgreementAction agreementAction) async{
    return await claimServiceClient.getAgreementActionApi(agreementAction);

  }
/////////////////  ////////////////تحديد عدد المحكمين
  @override
  Future<BaseResponse<DetailsResponseModel>> getNumberOfArbitrationPanelApi(String litigationRequestId)async {
    return await claimServiceClient.getNumberOfArbitrationPanelApi(litigationRequestId);

  }

  @override
  Future<BaseResponse<List<NumberOfArbitrationsModel>>> getNumberOfArbitrationApi()async {
    return await claimServiceClient.getNumberOfArbitrationApi();

  }

  @override
  Future<BaseResponse<DetailsResponseModel>> getNumberOfArbitrationRequestApi(NumberOfArbitractionsRequestModel numberOfArbitractionsRequestModel) async{
    return await claimServiceClient.getNumberOfArbitrationRequestApi(numberOfArbitractionsRequestModel);

  }
  @override
  Future<BaseResponse<ClaimResponse>> getArbitratorsCountListApi(int pageSize, int pageIndex)async {
    return await claimServiceClient.getArbitratorsCountListApi(pageSize,pageIndex);

  }
//////////  ////////////////تحديد عدد المحكمين///////
  @override
  Future<BaseResponse<Reconciliation>> getReconciliationApi(String requestId) async{
    return await claimServiceClient.getReconciliationApi(requestId);
  }

  @override
  Future<BaseResponse<Reconciliation>> postReconciliationApi(String requestId, int minutesOfMeetingApprovalStatus)async {
    return await claimServiceClient.postReconciliationApi(requestId,minutesOfMeetingApprovalStatus);

  }

  @override
  Future<BaseResponse<DetailsResponseModel>> interpretationOfTheRulingApi(String litigationRequestId)async {
    return await claimServiceClient.interpretationOfTheRulingApi(litigationRequestId);

  }

  @override
  Future<BaseResponse<List<UploadFileResponse>>> uploadFileRequestApi(UploadFileRequest uploadFileRequest) async{
    return await claimServiceClient.uploadFileRequestApi(uploadFileRequest.Files);

  }

  @override
  Future<BaseResponse> addArbitrationRequestApi(ArbitrationRequestModel arbitrationRequestModel)async {
    return await claimServiceClient.addArbitrationRequestApi(arbitrationRequestModel);
  }

  @override
  Future<BaseResponse<DetailsResponseModel>> getLitigationRequestForReportExplanationRequestByRequestId(String litigationRequestId)async {
    return await claimServiceClient.getLitigationRequestForReportExplanationRequestByRequestId(litigationRequestId);
  }


/////////////////تعيين اعضاء هيئة التحكيم
  @override
  Future<BaseResponse<ClaimResponse>> getArbitratorsNominationListApi(int pageSize, int pageIndex)async {
    return await claimServiceClient.getArbitratorsNominationListApi(pageSize,pageIndex);

  }
  @override
  Future<BaseResponse<DetailsResponseModel>> getArbitratorsNominationApi(String requestId)async {
    return await claimServiceClient.getArbitratorListReplyApi(requestId);

  }

  @override
  Future<BaseResponse<DetailsResponseModel>> addArbitratorsNominationApi(SelectionArbitratorRequest selectionarbitratorRequest) async{
    return await claimServiceClient.addNumberOfArbitrationRequestApi(selectionarbitratorRequest);

  }
///////تعيين اعضاء هيئة التحكيم/////////
  @override
  Future<BaseResponse<ClaimResponse>> reconciliationListApi(int pageSize, int pageIndex) async{
    return await claimServiceClient.getReconciliationListApi(pageSize,pageIndex);

  }

  @override
  Future<BaseResponse<ClaimResponse>> getInterpretationListApi(int pageSize, int pageIndex)async {
    return await claimServiceClient.getInterpretationListApi(pageSize,pageIndex);

  }

  @override
  Future<BaseResponse<ClaimResponse>> getAgreementListApi(int pageSize, int pageIndex)async {
    return await claimServiceClient.getAgreementListApi(pageSize,pageIndex);

  }

  @override
  Future<BaseResponse<NotificationModel>> getNotificationListApi() async{
    return await claimServiceClient.getNotificationListApi();
  }

}
