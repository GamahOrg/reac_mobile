
class ApiUrls {
  static const baseURL = "https://dev-reac-api.rega.gov.sa";
  //static const baseURL = "https://staging-reac-api.rega.gov.sa";
  //static const baseURLAsgaTech = "http://192.168.194.183";
  //static const baseAuthURLWithPort = "$baseURLAsgaTech:222";
  //static const baseURLWithMainPortal = "$baseURLAsgaTech:3333";
  //********************auth****************************
  static const login = "$baseURL/api/Account/Login";
  static const verifyUser = "$baseURL/api/Account/VerifyUser";
  static const checkStatus = "$baseURL/api/Account/CheckStatus";
  static const resetPassword = "";
  static const verifyOtp = "";
 // ********ClaimsList***********//
  static const claims = "$baseURL/api/LitigationRequest/Mobile/List";
  // ********ClaimDataDetails***********//
  static const claimDetails = "$baseURL/api/LitigationRequest/Mobile/GetLitigationById";
  // ********ClaimDetailsEvents***********//
  static const claimEvents = "$baseURL/api/LitigationRequest/Mobile/GetLitigationRequestEvents";
  // ********ClaimAgreement***********//
  static const getCitizenLitigationRequestForAgreementRequestReply="$baseURL/api/LitigationRequest/Mobile/GetCitizenLitigationRequestForAgreementRequestReply";
  static const getCitizenLitigationRequestForAgreementRequestReplyByRequestId = "$baseURL/api/LitigationRequest/Mobile/GetCitizenLitigationRequestForAgreementRequestReplyByRequestId";
  static const addCitizenLitigationRequestForAgreementRequestReply = "$baseURL/api/LitigationRequest/Mobile/AddCitizenLitigationRequestForAgreementRequestReply";
  //***** Appointment of members of the arbitration panel******
  static const getCitizenLitigationRequestForArbitratorsNominationListReply = "$baseURL/api/Arbitration/Mobile/GetCitizenLitigationRequestForArbitratorsNominationListReply";
  static const getCitizenLitigationRequestForArbitratorsNominationListReplyByRequestId = "$baseURL/api/Arbitration/Mobile/GetCitizenLitigationRequestForArbitratorsNominationListReplyByRequestId";
  static const addCitizenLitigationRequestForReportArbitratorsNominationListReply = "$baseURL/api/Arbitration/Mobile/AddCitizenLitigationRequestForReportArbitratorsNominationListReply";
 //************ArbitratorsCount************
  static const getCitizenLitigationRequestForArbitratorsCountReply = "$baseURL/api/Arbitration/Mobile/GetCitizenLitigationRequestForArbitratorsCountReply";
  static const getLitigationRequestForAddArbitratorsCountByRequestId = "$baseURL/api/Arbitration/Mobile/GetLitigationRequestForAddArbitratorsCountByRequestId";
  static const getNumberOfArbitrationPanel = "$baseURL/api/SysArbitratorCount/Get";
  static const addArbitratorsCount = "$baseURL/api/Arbitration/Mobile/AddArbitratorsCount";
  static const getArbitrationSessionLitigationRequestForAllSession = "$baseURL/api/ArbitrationSession/GetLitigationRequestForAllSession";

  // ********Reconciliation api***********//
  static const getCitizenLitigationRequestForReportReply = "$baseURL/api/Reconciliation/Mobile/GetCitizenLitigationRequestForReportReply";
  static const getCitizenLitigationRequestForReportReplyByRequestId = "$baseURL/api/Reconciliation/Mobile/GetCitizenLitigationRequestForReportReplyByRequestId";
  static const addCitizenLitigationRequestForReportReply = "$baseURL/api/Reconciliation/Mobile/AddCitizenLitigationRequestForReportReply";
  static const getLitigationRequestForAllSession = "$baseURL/api/Reconciliation/GetLitigationRequestForAllSession";
  // ********interpretation api***********//
  static const getLitigationRequestForReportByRequestId = "$baseURL/api/Arbitration/Mobile/GetLitigationRequestForReportByRequestId";
  static const getLitigationRequestForReportExplanationRequest = "$baseURL/api/Arbitration/Mobile/GetLitigationRequestForReportExplanationRequest";
  static const uploadFile = "$baseURL/api/SysFileManager/Upload";
  static const addArbitrationReportExplanationRequest = "$baseURL/api/Arbitration/Mobile/AddArbitrationReportExplanationRequest";
  static const getLitigationRequestForReportExplanationRequestByRequestId = "$baseURL/api/Arbitration/Mobile/GetLitigationRequestForReportExplanationRequestByRequestId";
  static const sendLitigationFeesRequestPaid = "$baseURL/api/LitigationRequest/SendLitigationFeesRequestPaid";
// ********Notification api***********//
  static const getNotification = "$baseURL/api/Notification/GetNotificationListForPortal";
}
//http://192.168.194.171
//https://staging-reac-api.rega.gov.sa