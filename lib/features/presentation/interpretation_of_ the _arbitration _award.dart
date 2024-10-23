import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/app_enums.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/design/widget/success_dialog.dart';
import 'package:reac/features/presentation/claim_details/widgets/resuable_cube.dart';
import 'package:reac/features/presentation/manager/get_claim_states.dart';
import 'package:reac/features/presentation/widgets/custom_extention_tile.dart';
import 'package:reac/features/presentation/widgets/custom_row.dart';
import 'package:reac/features/presentation/widgets/done_container.dart';
import 'package:reac/my_app.dart';

import '../../app/app_assets.dart';
import '../../app/custom_bottom_sheet.dart';
import '../../app/default_button.dart';
import '../../app/di/di.dart';
import '../../app/helpers/date_time_helper.dart';
import '../../app/helpers/flash_toast_helper.dart';
import 'auth_screens/widgets.dart';
import 'claim_details/widgets/claim_status_widget.dart';
import 'explanationBottomSheet.dart';
import 'manager/get_interpretation_rule_cubit.dart';

class InterpretationOfTheArbitrationAwardArguments {
  String? litigationRequestId;
  int? status;
  String? typeStep;

  InterpretationOfTheArbitrationAwardArguments(
      {this.status, this.litigationRequestId, this.typeStep});
}

class InterpretationOfTheArbitrationAward extends StatefulWidget {
  InterpretationOfTheArbitrationAwardArguments? arguments;

  InterpretationOfTheArbitrationAward({super.key, this.arguments});

  static const String id = "InterpretationOfTheArbitrationAward";

  @override
  State<InterpretationOfTheArbitrationAward> createState() => _InterpretationOfTheArbitrationAwardState();
}

class _InterpretationOfTheArbitrationAwardState extends State<InterpretationOfTheArbitrationAward> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<InterpretationRulingCubit>()
        ..executeInterpretationRuling(
            litigationRequestId: widget.arguments?.litigationRequestId)
        ..executeGetLitigationRequestForReportExplanation(
            litigationRequestId: widget.arguments?.litigationRequestId),
      child: BlocConsumer<InterpretationRulingCubit, ClaimStates>(
        listener: (context, state) {
          if (state is SuccessAddArbitrationRequest) {
            SuccessDialog.show(context: context,firstText: MyApp
                .tr.yourExplanationRequestHasBeenSentSuccessfully);
          }
        },
        builder: (context, state) {
          final cubit = context.watch<InterpretationRulingCubit>();
          return Scaffold(
            bottomNavigationBar: (widget.arguments?.typeStep==StepsClaims.arbitrationAwards.text&& cubit.explanationDisplayModel?.allowAdd == true)
                ? Container(
                    color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: DefaultButton(
                              radius: 30,
                              firstGradientColor: Colors.white,
                              secondGradientColor: Colors.white,
                              title: MyApp
                                  .tr.requestForInterpretationOfTheArbitration,
                              fontSize: 11.sp,
                              height: 6.h,
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.selectedTextTab,
                              onTap: () {
                                CustomBottomSheet.show(context,
                                    child: ExplanationBottomSheet(
                                      interpretationRulingCubit: cubit,
                                      litigationRequestId:
                                          widget.arguments?.litigationRequestId,
                                    ),
                                    isClose: false);
                              },
                            ),
                          ),
                        ],
                      ),
                    ))
                : const SizedBox(),
            appBar: buildAppBar(
                context,
                widget.arguments?.typeStep ==
                        StepsClaims.requestsForInterpretationOfRulings.text
                    ? MyApp.tr.requestsForInterpretationOfRulings
                    : MyApp.tr.arbitrationAwards),
            body: state is LoadingState
                ? const Center(
                    child: RotatingLoader(),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                      child: Column(
                        children: [
                          ClaimStatusWidget(
                            status: LitigationStatus.fromValue(
                                widget.arguments?.status ?? 0),
                            isDetailsFromHome: false,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          (widget.arguments?.typeStep == StepsClaims.arbitrationAwards.text)
                              ? CustomExpansionTile(
                                  isLoading: true,
                                  isPaddingTitle: true,
                                  expandedIcon: AppAssets.icArrowDown,
                                  collapsedIcon: AppAssets.icArrowUp,
                                  initiallyExpanded: true,
                                  title: MyApp.tr.arbitrationMinutes,
                                  leading: Image(
                                    image: AssetImage(AppAssets.icClaimsInfo),
                                  ),
                                  children: [
                                      CustomRow(
                                        dm: CustomRowDM(
                                            startIcon: AppAssets.icHashtag,
                                            label: MyApp.tr.reasons,
                                            value: cubit
                                                    .interpretationRulingModel
                                                    ?.report
                                                    ?.reasons ??
                                                ""),
                                      ),
                                      CustomRow(
                                        dm: CustomRowDM(
                                            startIcon: AppAssets.icHashtag,
                                            label: MyApp.tr.facts,
                                            value: cubit
                                                    .interpretationRulingModel
                                                    ?.report
                                                    ?.facts ??
                                                ""),
                                      ),
                                      CustomRow(
                                        dm: CustomRowDM(
                                            startIcon: AppAssets.icHashtag,
                                            label: MyApp
                                                .tr.controlDecisionOperative,
                                            value: cubit
                                                    .interpretationRulingModel
                                                    ?.report
                                                    ?.judgmentDecisionText ??
                                                ""),
                                      ),
                                      CustomRow(
                                        dm: CustomRowDM(
                                            startIcon: AppAssets.icHashtag,
                                            label: MyApp.tr.modificationRequest,
                                            value: cubit
                                                    .interpretationRulingModel
                                                    ?.report
                                                    ?.modificationRequest ??
                                                ""),
                                      ),
                                      CustomRow(
                                        dm: CustomRowDM(
                                            startIcon: AppAssets.icHashtag,
                                            label: MyApp
                                                .tr.datePronouncementJudgment,
                                            value: DateTimeHelper
                                                .formatExplanationRequestDate(cubit
                                                        .interpretationRulingModel
                                                        ?.report
                                                        ?.judgmentDate ??
                                                    "")),
                                      ),
                                      CustomRow(
                                        dm: CustomRowDM(
                                            startIcon: AppAssets.icHashtag,
                                            label:
                                                MyApp.tr.placeIssuanceJudgment,
                                            value: cubit
                                                    .interpretationRulingModel
                                                    ?.report
                                                    ?.meetingLocationName ??
                                                ""),
                                      ),
                                    ])
                              : const SizedBox(),
                          (widget.arguments?.typeStep == StepsClaims.requestsForInterpretationOfRulings.text && widget.arguments?.status == LitigationStatus.WaitingForExplanation.value)
                              ? CustomExpansionTile(
                                  isLoading: true,
                                  isPaddingTitle: true,
                                  initiallyExpanded: true,
                                  expandedIcon: AppAssets.icArrowDown,
                                  collapsedIcon: AppAssets.icArrowUp,
                                  title: MyApp.tr
                                      .requestForInterpretationOfTheArbitration,
                                  leading: Image(
                                    image: AssetImage(AppAssets.icClaimsInfo),
                                  ),
                                  children: [
                                    CustomRow(
                                      dm: CustomRowDM(
                                        startIcon: AppAssets.icHashtag,
                                        label:
                                            MyApp.tr.requestsForInterpretation,
                                        value: cubit.explanationDisplayModel
                                                ?.report?.explanationRequests ??
                                            "",
                                      ),
                                    ),
                                    CustomRow(
                                      dm: CustomRowDM(
                                        startIcon: AppAssets.icHashtag,
                                        label: MyApp.tr.requestDate,
                                        value: DateTimeHelper
                                            .formatExplanationRequestDate(cubit
                                                    .explanationDisplayModel
                                                    ?.report
                                                    ?.explanationRequestDate ??
                                                ""),
                                      ),
                                    ),
                                    CustomRow(
                                      dm: CustomRowDM(
                                        startIcon: AppAssets.icHashtag,
                                        label: MyApp.tr.files,
                                        value: cubit
                                                .explanationDisplayModel
                                                ?.report
                                                ?.litigationRequestArbitrationReportExplanationRequestFiles
                                                ?.map((e) => e
                                                    .explanationRequestFile
                                                    ?.fileDescription)
                                                .join(", ") ??
                                            "",
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          (widget.arguments?.typeStep ==
                                      StepsClaims
                                          .requestsForInterpretationOfRulings
                                          .text &&
                                  widget.arguments?.status ==
                                      LitigationStatus
                                          .ExplanationResponsed.value)
                              ? CustomExpansionTile(
                                  isLoading: true,
                                  expandedIcon: AppAssets.icArrowDown,
                                  collapsedIcon: AppAssets.icArrowUp,
                                  isPaddingTitle: true,
                                  initiallyExpanded: true,
                                  title: MyApp.tr
                                      .requestForInterpretationOfTheArbitration,
                                  leading: Image(
                                    image: AssetImage(AppAssets.icClaimsInfo),
                                  ),
                                  children: [
                                      CustomRow(
                                        dm: CustomRowDM(
                                            startIcon: AppAssets.icHashtag,
                                            label: MyApp
                                                .tr.requestsForInterpretation,
                                            value: cubit
                                                    .explanationDisplayModel
                                                    ?.report
                                                    ?.explanationRequests ??
                                                ""),
                                      ),
                                      CustomRow(
                                        dm: CustomRowDM(
                                            startIcon: AppAssets.icHashtag,
                                            label: MyApp.tr.requestDate,
                                            value: DateTimeHelper
                                                .formatExplanationRequestDate(cubit
                                                        .explanationDisplayModel
                                                        ?.report
                                                        ?.explanationRequestDate ??
                                                    "")),
                                      ),
                                      CustomRow(
                                        dm: CustomRowDM(
                                            startIcon: AppAssets.icHashtag,
                                            label: MyApp.tr.response,
                                            value: cubit.explanationDisplayModel
                                                    ?.report?.response ??
                                                ""),
                                      ),
                                      CustomRow(
                                        dm: CustomRowDM(
                                            startIcon: AppAssets.icHashtag,
                                            label: MyApp.tr.replyDate,
                                            value: DateTimeHelper
                                                .formatExplanationRequestDate(cubit
                                                        .explanationDisplayModel
                                                        ?.report
                                                        ?.responseOn ??
                                                    "")),
                                      ),
                                    ])
                              : SizedBox(),
                          SizedBox(
                            height: 3.h,
                          ),
                          widget.arguments?.typeStep == StepsClaims.arbitrationAwards.text
                              ? Column(
                                  children: [
                                    CustomExpansionTile(
                                        isLoading: true,
                                        isPaddingTitle: true,
                                        expandedIcon: AppAssets.icArrowDown,
                                        collapsedIcon: AppAssets.icArrowUp,
                                        title: MyApp.tr.claimantData,
                                        leading: Image(
                                          image: AssetImage(
                                              AppAssets.icClaimsInfo),
                                        ),
                                        children: [
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.fullName ??
                                                      "",
                                                  label: MyApp.tr.plaintiff)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.fax ??
                                                      "",
                                                  label: MyApp.tr.fax)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.homeTelephone ??
                                                      "",
                                                  label: MyApp.tr.homeTele)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.workTelephone ??
                                                      "",
                                                  label: MyApp.tr.workTele)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.identityNumber ??
                                                      "",
                                                  label: MyApp.tr.idNumber)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCapacity ??
                                                      "",
                                                  label: MyApp
                                                      .tr.plaintiffStatus)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.mobile ??
                                                      "",
                                                  label:
                                                      MyApp.tr.mobileNumber)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.email ??
                                                      "",
                                                  label: MyApp.tr.email)),
                                        ]),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    CustomExpansionTile(
                                        isLoading: true,
                                        isPaddingTitle: true,
                                        initiallyExpanded: false,
                                        title: MyApp.tr.defendantData,
                                        leading: Image(
                                          image: AssetImage(
                                              AppAssets.icClaimsInfo),
                                        ),
                                        expandedIcon: AppAssets.icArrowDown,
                                        collapsedIcon: AppAssets.icArrowUp,
                                        children: [
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.fullName ??
                                                      "",
                                                  label: MyApp.tr.fullName)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCapacity ??
                                                      "",
                                                  label: MyApp.tr
                                                      .characteristicsOfTheDefendant)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.fax ??
                                                      "",
                                                  label: MyApp.tr.fax)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.homeTelephone ??
                                                      "",
                                                  label: MyApp.tr.homeTele)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.workTelephone ??
                                                      "",
                                                  label: MyApp.tr.workTele)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.mobile ??
                                                      "",
                                                  label:
                                                      MyApp.tr.mobileNumber)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.email ??
                                                      "",
                                                  label: MyApp.tr.email)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.identityNumber ??
                                                      "",
                                                  label: MyApp.tr.idNumber)),
                                        ]),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    CustomExpansionTile(
                                        isLoading: true,
                                        isPaddingTitle: true,
                                        initiallyExpanded: false,
                                        title: MyApp.tr.claimData,
                                        leading: Image(
                                          image: AssetImage(
                                              AppAssets.icClaimsInfo),
                                        ),
                                        expandedIcon: AppAssets.icArrowDown,
                                        collapsedIcon: AppAssets.icArrowUp,
                                        children: [
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.requestCode ??
                                                      "",
                                                  label: MyApp.tr.caseCode)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.cityName ??
                                                      "",
                                                  label: MyApp.tr.theCity)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.areaName ??
                                                      "",
                                                  label: MyApp.tr.area)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contractAddress ??
                                                      "",
                                                  label: MyApp.tr.caseTitle)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.litigationRequestContractType
                                                          ?.typeName ??
                                                      "",
                                                  label: MyApp.tr.claimType)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .interpretationRulingModel
                                                          ?.litigationRequestShortDto
                                                          ?.litigationRequestCategory
                                                          ?.categoryName ??
                                                      "",
                                                  label: MyApp.tr.requestType)),
                                        ]),
                                  ],
                                )
                              : SizedBox(),
                          widget.arguments?.typeStep ==
                                  StepsClaims
                                      .requestsForInterpretationOfRulings.text
                              ? Column(
                                  children: [
                                    CustomExpansionTile(
                                        isLoading: true,
                                        isPaddingTitle: true,
                                        expandedIcon: AppAssets.icArrowDown,
                                        collapsedIcon: AppAssets.icArrowUp,
                                        title: MyApp.tr.claimantData,
                                        leading: Image(
                                          image: AssetImage(
                                              AppAssets.icClaimsInfo),
                                        ),
                                        children: [
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.fullName ??
                                                      "",
                                                  label: MyApp.tr.plaintiff)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.fax ??
                                                      "",
                                                  label: MyApp.tr.fax)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.homeTelephone ??
                                                      "",
                                                  label: MyApp.tr.homeTele)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.workTelephone ??
                                                      "",
                                                  label: MyApp.tr.workTele)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.identityNumber ??
                                                      "",
                                                  label: MyApp.tr.idNumber)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCapacity ??
                                                      "",
                                                  label: MyApp
                                                      .tr.plaintiffStatus)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.mobile ??
                                                      "",
                                                  label:
                                                      MyApp.tr.mobileNumber)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.firstPartyCitizen
                                                          ?.email ??
                                                      "",
                                                  label: MyApp.tr.email)),
                                        ]),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    CustomExpansionTile(
                                        isLoading: true,
                                        isPaddingTitle: true,
                                        initiallyExpanded: false,
                                        title: MyApp.tr.defendantData,
                                        leading: Image(
                                          image: AssetImage(
                                              AppAssets.icClaimsInfo),
                                        ),
                                        expandedIcon: AppAssets.icArrowDown,
                                        collapsedIcon: AppAssets.icArrowUp,
                                        children: [
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.fullName ??
                                                      "",
                                                  label: MyApp.tr.fullName)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCapacity ??
                                                      "",
                                                  label: MyApp.tr
                                                      .characteristicsOfTheDefendant)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.fax ??
                                                      "",
                                                  label: MyApp.tr.fax)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.homeTelephone ??
                                                      "",
                                                  label: MyApp.tr.homeTele)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.workTelephone ??
                                                      "",
                                                  label: MyApp.tr.workTele)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.mobile ??
                                                      "",
                                                  label:
                                                      MyApp.tr.mobileNumber)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.email ??
                                                      "",
                                                  label: MyApp.tr.email)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCitizen
                                                          ?.identityNumber ??
                                                      "",
                                                  label: MyApp.tr.idNumber)),
                                        ]),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    CustomExpansionTile(
                                        isLoading: true,
                                        isPaddingTitle: true,
                                        initiallyExpanded: false,
                                        title: MyApp.tr.claimData,
                                        leading: Image(
                                          image: AssetImage(
                                              AppAssets.icClaimsInfo),
                                        ),
                                        expandedIcon: AppAssets.icArrowDown,
                                        collapsedIcon: AppAssets.icArrowUp,
                                        children: [
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.requestCode ??
                                                      "",
                                                  label: MyApp.tr.caseCode)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.cityName ??
                                                      "",
                                                  label: MyApp.tr.theCity)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.areaName ??
                                                      "",
                                                  label: MyApp.tr.area)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contractAddress ??
                                                      "",
                                                  label: MyApp.tr.caseTitle)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.litigationRequestContractType
                                                          ?.typeName ??
                                                      "",
                                                  label: MyApp.tr.claimType)),
                                          CustomRow(
                                              dm: CustomRowDM(
                                                  value: cubit
                                                          .explanationDisplayModel
                                                          ?.litigationRequestShortDto
                                                          ?.litigationRequestCategory
                                                          ?.categoryName ??
                                                      "",
                                                  label: MyApp.tr.requestType)),
                                        ]),
                                  ],
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
