import 'package:flutter/material.dart';
import 'package:reac/app/extensions.dart';

import '../../../../app/app_assets.dart';
import '../../../../app/app_enums.dart';
import '../../widgets/custom_container.dart';
import 'litigation_status_helper.dart';

class ClaimStatusWidget extends StatelessWidget {
  final LitigationStatus status;
  bool isDetailsFromHome = false;

  ClaimStatusWidget(
      {super.key, required this.status, required this.isDetailsFromHome});

  @override
  Widget build(BuildContext context) {
    Color statusColor = LitigationStatusHelper.getStatusColorById(status.value);
    Color textColor = LitigationStatusHelper.getTextColorById(status.value);
    if (status.value == LitigationStatus.Received.value ||
        status.value==LitigationStatus.AgreementRequestHasBeenRejected.value||
        status.value == LitigationStatus.ExplanationResponsed.value ||
        status.value == LitigationStatus.WaitingForExplanation.value ||
        status.value == LitigationStatus.SentBackForEdit.value ||
        status.value==LitigationStatus.Edited.value||
        status.value == LitigationStatus.AgreementRequestHasBeenSent.value ||
        status.value == LitigationStatus.TheMinutesOfTheMeetingWereWritten.value ||
        status.value == LitigationStatus.JudgmentDecisionIssued.value ||
        status.value == LitigationStatus.SaveAsDraft.value ||
        status.value == LitigationStatus.ReconciliationWasNotMade.value ||
        status.value == LitigationStatus.AsessionTimeHasBeenSet.value ||
        status.value == LitigationStatus.Rejected.value ||
        status.value == LitigationStatus.New.value ||
        status.value == LitigationStatus.ReconciliationWasMade.value ||
        status.value == LitigationStatus.WaiverOfTheLitigation.value ||
        status.value == LitigationStatus.WaiverOfRight.value) {
      return Container(
        margin: EdgeInsets.only(top: isDetailsFromHome == true ? 5.h : 1.h),
        child: CustomContainer(
          text: status.name,
          color: statusColor,
          icon: AppAssets.icClock,
          iconColor: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 11.sp,
          textColor: textColor,
          vertical: 1.5.h,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
