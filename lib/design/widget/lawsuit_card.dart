import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reac/app/app_assets.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/helpers/date_time_helper.dart';
import 'package:reac/app_cubit.dart';
import 'package:reac/features/domain/models/claim_model/cliam_model.dart';
import 'package:reac/features/presentation/interpretation_of_%20the%20_arbitration%20_award.dart';
import 'package:reac/features/presentation/minutes_of_settlement.dart';
import 'package:reac/features/presentation/scalpel_model_screen.dart';
import 'package:reac/my_app.dart';

import '../../features/presentation/claim_details/claim_details.dart';
import '../../features/presentation/claim_details/widgets/litigation_status_helper.dart';

class LawsuitCard extends StatelessWidget {
  Results? results;
  bool? isDetailsFromHome;
  Function()? onTap;
  static const String id = "LawsuitCard";

  LawsuitCard({super.key, this.results, this.isDetailsFromHome,this.onTap});

  @override
  Widget build(BuildContext context) {
    Color statusColorById = LitigationStatusHelper.getStatusColorById(
        results?.externalStatusId ?? int.parse(results?.status ?? ""));
    Color textColorById = LitigationStatusHelper.getTextColorById(
        results?.externalStatusId ?? int.parse(results?.status ?? ""));
    String statusTitle = LitigationStatusHelper.getRequestStatusTitleById(
        results?.externalStatusId ?? int.parse(results?.status ?? ""));
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(
                      bottom: 10, left: 8, top: 10, right: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xffE7E7E7),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  height: 35,
                  width: 34,
                  child: Center(child: SvgPicture.asset(AppAssets.icNote)),
                ),
                Text(
                  results?.litigationRequestContractType ?? "",
                  style: TextStyle(
                      color: const Color(0xff3F3E43),
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp),
                ),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.only(bottom: 15, top: 10),
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 4, left: 8, right: 8),
                    decoration: BoxDecoration(
                      color: statusColorById,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AppAssets.icClock,
                          color: textColorById,
                        ),
                        SizedBox(width: 1.w),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            statusTitle,
                            style: TextStyle(
                                color: textColorById,
                                fontSize: AppCubit.get(context).isArSelected
                                    ? 11.sp
                                    : 9.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    )),
              ],
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.dividerColor.withOpacity(0.5),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10, right: 5),
                  child: Text(
                    MyApp.tr.cliamNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      color: AppColors.textTitleLightGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    results?.requestCode ?? "",
                    style: TextStyle(
                        color: const Color(0xff3F3E43),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(AppAssets.icCalendar),
                Padding(
                  padding: const EdgeInsets.only(right: 5, top: 5, left: 5),
                  child: Text(
                    DateTimeHelper.formatStringToNewFormat(
                        results?.createdOn ?? ""),
                    style: TextStyle(
                        color: AppColors.textTitleLightGrey,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
                  child: Text(
                    MyApp.tr.against,
                    style: TextStyle(
                        color: AppColors.textTitleLightGrey,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    results?.secondPartyName ?? "",
                    style: TextStyle(
                      color: const Color(0xff3F3E43),
                      fontSize: 9.sp,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
