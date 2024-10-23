
class ApiUrls {

  static const baseURL = "http://192.168.194.171";
  static const baseAuthURLWithPort = "$baseURL:222";
  static const baseURLWithMainPortal = "$baseURL:5000";
  //********************auth****************************
  static const login = "$baseAuthURLWithPort/api/Account/Login";
  static const resetPassword = "";
  static const verifyOtp = "";
 // ********ClaimsList***********//
  static const claims = "$baseURLWithMainPortal/api/mobile/LitigationRequest/List";
  // ********ClaimDataDetails***********//
  static const claimDetails = "$baseURLWithMainPortal/api/mobile/LitigationRequest/GetLitigationById";
  // ********ClaimDetailsEvents***********//
  static const claimEvents = "$baseURLWithMainPortal/api/mobile/LitigationRequest/GetLitigationRequestEvents";
  // ********ClaimAgreement***********//
  static const getCitizenLitigationRequestForAgreementRequestReply="$baseURLWithMainPortal/api/mobile/LitigationRequest/GetCitizenLitigationRequestForAgreementRequestReply";
  static const getCitizenLitigationRequestForAgreementRequestReplyByRequestId = "$baseURLWithMainPortal/api/mobile/LitigationRequest/GetCitizenLitigationRequestForAgreementRequestReplyByRequestId";
  static const addCitizenLitigationRequestForAgreementRequestReply = "$baseURLWithMainPortal/api/mobile/LitigationRequest/AddCitizenLitigationRequestForAgreementRequestReply";
  //***** Appointment of members of the arbitration panel******
  static const getCitizenLitigationRequestForArbitratorsNominationListReply = "$baseURLWithMainPortal/api/mobile/Arbitration/GetCitizenLitigationRequestForArbitratorsNominationListReply";
  static const getCitizenLitigationRequestForArbitratorsNominationListReplyByRequestId = "$baseURLWithMainPortal/api/mobile/Arbitration/GetCitizenLitigationRequestForArbitratorsNominationListReplyByRequestId";
  static const addCitizenLitigationRequestForReportArbitratorsNominationListReply = "$baseURLWithMainPortal/api/mobile/Arbitration/AddCitizenLitigationRequestForReportArbitratorsNominationListReply";

 //************ArbitratorsCount************
  static const getCitizenLitigationRequestForArbitratorsCountReply = "$baseURLWithMainPortal/api/mobile/Arbitration/GetCitizenLitigationRequestForArbitratorsCountReply";
  static const getLitigationRequestForAddArbitratorsCountByRequestId = "$baseURLWithMainPortal/api/mobile/Arbitration/GetLitigationRequestForAddArbitratorsCountByRequestId";
  static const getNumberOfArbitrationPanel = "$baseURLWithMainPortal/api/mobile/SysArbitratorCount/Get";
  static const addArbitratorsCount = "$baseURLWithMainPortal/api/mobile/Arbitration/AddArbitratorsCount";



  // ********Reconciliation api***********//
  static const getCitizenLitigationRequestForReportReply = "$baseURLWithMainPortal/api/Reconciliation/GetCitizenLitigationRequestForReportReply";
  static const getCitizenLitigationRequestForReportReplyByRequestId = "$baseURLWithMainPortal/api/Reconciliation/GetCitizenLitigationRequestForReportReplyByRequestId";
  static const addCitizenLitigationRequestForReportReply = "$baseURLWithMainPortal/api/Reconciliation/AddCitizenLitigationRequestForReportReply";
  // ********interpretation api***********//
  static const getLitigationRequestForReportByRequestId = "$baseURLWithMainPortal/api/mobile/Arbitration/GetLitigationRequestForReportByRequestId";
  static const getLitigationRequestForReportExplanationRequest = "$baseURLWithMainPortal/api/mobile/Arbitration/GetLitigationRequestForReportExplanationRequest";
  static const uploadFile = "$baseURLWithMainPortal/api/mobile/SysFileManager/Upload";
  static const addArbitrationReportExplanationRequest = "$baseURLWithMainPortal/api/mobile/Arbitration/AddArbitrationReportExplanationRequest";
  static const getLitigationRequestForReportExplanationRequestByRequestId = "$baseURLWithMainPortal/api/mobile/Arbitration/GetLitigationRequestForReportExplanationRequestByRequestId";
// ********Notification api***********//
  static const getNotification = "$baseURL:3333/api/Notification/GetNotificationListForPortal";

}

