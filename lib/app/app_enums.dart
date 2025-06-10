import 'package:reac/my_app.dart';

enum SaveAsTypeEnum { png, pdf }

enum IdentityType { citizen, gulf }

extension IdentityTypeExtension on IdentityType {
  int get value {
    switch (this) {
      case IdentityType.citizen:
        return 1;
      default:
        return 2;
    }
  }
}
enum StepsClaims {
  home('Home'),
  appointmentOfMembersOfTheArbitrationPanel('appointmentOfMembersOfTheArbitrationPanel'),
  determineTheNumberOfArbitrators('determineTheNumberOfArbitrators'),
  requestsForInterpretationOfRulings('requestsForInterpretationOfRulings'),
  arbitrationAwards("arbitrationAwards"),
  collectionOfLitigationFeesRequestIsBeingSent("CollectionOfLitigationFeesRequestIsBeingSent");

  final String text;

  const StepsClaims(this.text);
}
String getStepsClaimsText(StepsClaims step) {
  switch (step) {
    case StepsClaims.home:
      return MyApp.tr.home;
    case StepsClaims.appointmentOfMembersOfTheArbitrationPanel:
      return MyApp.tr.appointmentOfMembersOfTheArbitrationPanel;
    case StepsClaims.determineTheNumberOfArbitrators:
      return MyApp.tr.determineTheNumberOfArbitrators;
    case StepsClaims.requestsForInterpretationOfRulings:
      return MyApp.tr.requestsForInterpretationOfRulings;
    case StepsClaims.arbitrationAwards:
      return MyApp.tr.arbitrationAwards;
    case StepsClaims.collectionOfLitigationFeesRequestIsBeingSent:
      return "تم ارسال طلب تحصيل رسوم الدعوة";
    default:
      return 'Unknown';
  }
}

enum ClaimStatus {
  underPayment,
  charterparty,
  audit,
  waitingAuthority,
  waitingGuideSelection,
  reconciliation,
}

extension ClaimStatusExtension on ClaimStatus {
  int get value {
    switch (this) {
      case ClaimStatus.underPayment:
        return 1;
      case ClaimStatus.charterparty:
        return 2;
      case ClaimStatus.audit:
        return 3;
      case ClaimStatus.waitingAuthority:
        return 4;
      case ClaimStatus.waitingGuideSelection:
        return 5;
      case ClaimStatus.reconciliation:
        return 6;
      default:
        return 0;
    }
  }
}

ClaimStatus getName(value) {
  switch (value) {
    case 1:
      return ClaimStatus.underPayment;
    case 2:
      return ClaimStatus.charterparty;
    case 3:
      return ClaimStatus.audit;
    case 4:
      return ClaimStatus.waitingAuthority;
    case 5:
      return ClaimStatus.waitingGuideSelection;
    case 6:
      return ClaimStatus.reconciliation;
    default:
      return ClaimStatus.reconciliation;
  }
}

enum LitigationRequestContractType {
  rent,
  properties,
  wafi,
  realEstateBrokerage,
  otherServices,
}

extension LitigationTypeExtension on LitigationRequestContractType {
  int get value {
    switch (this) {
      case LitigationRequestContractType.rent:
        return 82;
      case LitigationRequestContractType.properties:
        return 79;
      case LitigationRequestContractType.wafi:
        return 87;
      case LitigationRequestContractType.realEstateBrokerage:
        return 66;
      default:
        return 78;
    }
  }
}

enum LitigationStatus {
  ///<summary>جديدة</summary>
  New(1),
  Received(2),

///<summary>تم تحديد ميعاد جلسة</summary>
  AsessionTimeHasBeenSet(3),

  ///<summary>تم إعادة تحديد ميعاد جلسة</summary>
  AsessionTimeHasBeenReset(4),

  ///<summary>تم كتابة محضر الجلسة</summary>
  TheMinutesOfTheMeetingWereWritten(6),

  ///<summary>تنازل عن الحق</summary>
  WaiverOfRight(7),

  ///<summary>تنازل عن الدعوى</summary>
  WaiverOfTheLitigation(8),

  ///<summary>عدم الصُلح</summary>
  ReconciliationWasNotMade(9),
  ///<summary>حفظ وإغلاق</summary>
  SaveAndClose(10),
  ///<summary> حفظ كمسودة</summary>
  SaveAsDraft(11),
  ///<summary>مرفوضة</summary>
  Rejected(12),
  ///<summary>معاده للتعديل</summary>
  SentBackForEdit(13),
  ///<summary>تم التعديل</summary>
  Edited(14),
  ///<summary>قيد المشارطة</summary>
  AgreementRequestHasBeenSent(15),

  ///<summary>تم الصلح</summary>
  ReconciliationWasMade(18),

  ///<summary>عدم الصُلح والانتقال للتحكيم</summary>
  ReconciliationWasNotMadeAndMoveToArbitration(19),

  ///<summary>تم التحكيم</summary>
  JudgmentDecisionIssued(20),

  ///<summary>بإنتظار التفسير</summary>
  WaitingForExplanation(21),

  ///<summary>تم الرد</summary>
  ExplanationResponsed(22),

  ///<summary>رفض طلب المشارطة</summary>
  AgreementRequestHasBeenRejected(23),

  ///<summary>ملغاة</summary>
  Cancelled(24),
  ///<summary>الصلح بواسطة منصة تراضى </summary>
  ReconciliationOnTradyPlatform(25),

  ///<summary>تم إرسال طلب تحصيل رسوم الدعوة</summary>
  CollectionOfLitigationFeesRequestIsBeingSent(26),
  ///<summary>تم تحصيل رسوم الدعوة</summary>
  LitigationFeesHaveBeenCollected (27),
  ///<summary>تم إرسال طلب تحصيل رسوم الصلح</summary>
  CollectionOfReconciliationFeesRequestIsBeingSent(28),
  ///<summary>تم تحصيل رسوم الصلح</summary>
  ReconciliationFeesHaveBeenCollected( 29),
  ///<summary>تم إرسال طلب تحصيل رسوم التحكيم</summary>
  CollectionOfArbitrationFeesRequestIsBeingSent(30),
  ///<summary>تم تحصيل رسوم التحكيم</summary>
  ArbitrationFeesHaveBeenCollected(31),
  ///<summary>تم قبول الدعوى وجارى إرسال طلب تحصيل رسوم الصلح</summary>
  LitigationApprovedCollectionOfReconciliationFeesRequestIsBeingSend (32),
  ///<summary>قيد دفع رسوم التحكيم</summary>
  PendingPayment(33);
  final int value;
  const LitigationStatus(this.value);
  factory LitigationStatus.fromValue(int value) {
    return values.firstWhere((e) => e.value == value);
  }
}


extension LitigationStatusNameExtension on LitigationStatus {
  String get name {
    switch (this) {
      case LitigationStatus.New:
        return MyApp.tr.new_;
      case LitigationStatus.Received:
        return MyApp.tr.received;
      case LitigationStatus.AgreementRequestHasBeenSent:
        return MyApp.tr.underTheCharter ;
      case LitigationStatus.AsessionTimeHasBeenSet:
        return MyApp.tr.sessionTimeHasBeenSet;
      case LitigationStatus.Edited:
        return MyApp.tr.edited;
      case LitigationStatus.SentBackForEdit:
        return MyApp.tr.backForEdit;
      case LitigationStatus.Rejected:
        return MyApp.tr.rejected;
      case LitigationStatus.AsessionTimeHasBeenReset:
        return MyApp.tr.sessionTimeHasBeenReset;
      case LitigationStatus.TheMinutesOfTheMeetingWereWritten:
        return MyApp.tr.theMinutesOfTheMeetingWereWritten;
      case LitigationStatus.WaiverOfRight:
        return MyApp.tr.waiverOfRight;
      case LitigationStatus.WaiverOfTheLitigation:
        return MyApp.tr.waiverOfTheLitigation;
      case LitigationStatus.ReconciliationWasNotMade:
        return MyApp.tr.reconciliationWasNotMade;
      case LitigationStatus.SaveAndClose:
        return MyApp.tr.saveAndClose;
      case LitigationStatus.SaveAsDraft:
        return MyApp.tr.saveAsDraft;
      case LitigationStatus.ReconciliationWasMade:
        return MyApp.tr.reconciliationWasMade;
      case LitigationStatus.ReconciliationWasNotMadeAndMoveToArbitration:
        return MyApp.tr.reconciliationWasNotMadeAndMoveToArbitration;
      case LitigationStatus.JudgmentDecisionIssued:
        return MyApp.tr.judgmentDecisionIssued;
      case LitigationStatus.WaitingForExplanation:
        return MyApp.tr.waitingForExplanation;
      case LitigationStatus.ExplanationResponsed:
        return MyApp.tr.explanationResponsed;
      case LitigationStatus.AgreementRequestHasBeenRejected:
        return MyApp.tr.agreementRequestHasBeenRejected;
      case LitigationStatus.Cancelled:
        return MyApp.tr.cancelled;
      case LitigationStatus.ReconciliationOnTradyPlatform:
        return MyApp.tr.reconciliationThroughTheTaradhaPlatform;
      case LitigationStatus.CollectionOfLitigationFeesRequestIsBeingSent:
        return MyApp.tr.collectionOfLitigationFeesRequestIsBeingSent;
      case LitigationStatus.LitigationFeesHaveBeenCollected:
        return MyApp.tr.litigationFeesHaveBeenCollected;
      case LitigationStatus.CollectionOfReconciliationFeesRequestIsBeingSent:
        return MyApp.tr.collectionOfReconciliationFeesRequestIsBeingSent;
      case LitigationStatus.ReconciliationFeesHaveBeenCollected:
        return MyApp.tr.reconciliationFeesHaveBeenCollected;
      case LitigationStatus.CollectionOfArbitrationFeesRequestIsBeingSent:
        return MyApp.tr.collectionOfArbitrationFeesRequestIsBeingSent;
      case LitigationStatus.ArbitrationFeesHaveBeenCollected:
        return MyApp.tr.arbitrationFeesHaveBeenCollected;
      case LitigationStatus.LitigationApprovedCollectionOfReconciliationFeesRequestIsBeingSend:
        return MyApp.tr.litigationApprovedCollectionOfReconciliationFeesRequestIsBeingSend;
      case LitigationStatus.PendingPayment:
        return MyApp.tr.pendingPayment;
    }
  }
}
