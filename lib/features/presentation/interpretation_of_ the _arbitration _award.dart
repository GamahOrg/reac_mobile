import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/app_enums.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/app/helpers/flash_toast_helper.dart';
import 'package:reac/design/widget/success_dialog.dart';
import 'package:reac/features/domain/models/claim_model/details_response_model.dart';
import 'package:reac/features/presentation/claim_details/widgets/resuable_cube.dart';
import 'package:reac/features/presentation/manager/get_claim_states.dart';
import 'package:reac/features/presentation/widgets/custom_extention_tile.dart';
import 'package:reac/features/presentation/widgets/custom_row.dart';
import 'package:reac/my_app.dart';
import '../../app/app_assets.dart';
import '../../app/custom_bottom_sheet.dart';
import '../../app/default_button.dart';
import '../../app/di/di.dart';
import '../../app/helpers/date_time_helper.dart';
import 'auth_screens/widgets.dart';
import 'claim_details/widgets/claim_status_widget.dart';
import 'explanationBottomSheet.dart';
import 'manager/get_interpretation_rule_cubit.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

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
  State<InterpretationOfTheArbitrationAward> createState() =>
      _InterpretationOfTheArbitrationAwardState();
}

class _InterpretationOfTheArbitrationAwardState
    extends State<InterpretationOfTheArbitrationAward> {
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
          if (state is SuccessAddArbitrationRequest && state.isDone == true) {
            SuccessDialog.show(
                context: context,
                firstText:
                    MyApp.tr.yourExplanationRequestHasBeenSentSuccessfully);
          } else if (state is SuccessAddArbitrationRequest &&
              state.isDone == false) {

          }
        },
        builder: (context, state) {
          final cubit = context.watch<InterpretationRulingCubit>();
          return Scaffold(
            bottomNavigationBar: (widget.arguments?.typeStep ==
                        StepsClaims.arbitrationAwards.text &&
                    cubit.explanationDisplayModel?.allowAdd == true)
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
                          (widget.arguments?.typeStep ==
                                  StepsClaims.arbitrationAwards.text)
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DefaultButton(
                              radius: 30,
                              firstGradientColor: const Color(0xff03598D),
                              secondGradientColor: const Color(0xff002F56),
                              title: "تحميل حكم التحكيم",
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              textColor: Colors.white,
                              onTap: () async {
                                if (cubit.interpretationRulingModel != null) {
                                  await _generateAndOpenPdf(context, cubit.interpretationRulingModel!);
                                } else {
                                  FlashToastHelper.showErrorToast(
                                      context: context, content: "MyApp.tr.noDataAvailableForPdf");
                                }
                              },
                            ),
                          ),
                          (widget.arguments?.typeStep ==
                                      StepsClaims
                                          .requestsForInterpretationOfRulings
                                          .text &&
                                  widget.arguments?.status ==
                                      LitigationStatus
                                          .WaitingForExplanation.value)
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
                          SizedBox(
                            height: 3.h,
                          ),
                          widget.arguments?.typeStep ==
                                  StepsClaims.arbitrationAwards.text
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
                              : const SizedBox(),
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

  Future<void> _generateAndOpenPdf(
      BuildContext context, DetailsResponseModel data) async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Generate the PDF
      final pdf = await generateReconciliationReport(data);

      // Save the PDF to a temporary file
      final output = await getTemporaryDirectory();
      final file = File("${output.path}/reconciliation_report.pdf");
      await file.writeAsBytes(await pdf.save());

      // Close the loading dialog
      Navigator.of(context).pop();

      // Open the PDF
      await Printing.layoutPdf(
        onLayout: (_) => file.readAsBytes(),
      );
    } catch (e) {
      dPrint('"${"MyApp.tr.failedToGeneratePdf"}": ${e.toString()}');
      // Navigator.of(context).pop();
      FlashToastHelper.showErrorToast(
          context: context,
          content: '"${"MyApp.tr.failedToGeneratePdf"}": ${e.toString()}');
    }
  }

  Future<pw.Document> generateReconciliationReport(
      DetailsResponseModel data) async {
    final pdf = pw.Document();
    final arabicFont = await PdfGoogleFonts.tajawalRegular();

    // Date formatters
    final dateFormat = DateFormat('dd - MM - yyyy', 'ar');
    final timeFormat = DateFormat('HH', 'ar');

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        textDirection: pw.TextDirection.rtl, // Important for Arabic text
        build: (pw.Context context) => [
          // Logo - you'll need to add your logo to assets
          // pw.Image(logoImage, width: 200),
          pw.Column(
              children: [
                pw.Text('نموذج حكم التحكيم',
                    style: pw.TextStyle(
                        font: arabicFont,
                        color: PdfColor.fromHex('#005257'),
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 20),
                pw.Container(
                  padding: const pw.EdgeInsets.all(8),
                  color: PdfColor.fromHex('#005257'),
                  alignment: pw.Alignment.centerRight,
                  child: pw.Text(
                    '${data.litigationRequestShortDto?.requestCode ?? ''}حكم التحكيم في الدعوى المقيدة بالمركز السعودي للتحكيم العقاري رقم:',
                    style: pw.TextStyle(
                      font: arabicFont,
                      color: PdfColors.white,
                      fontSize: 14,
                    ),
                    textDirection: pw.TextDirection.rtl,
                  ),
                ),

                // First table - Judgment details
                pw.Table(
                  border: pw.TableBorder.all(),
                  columnWidths: {
                    0: pw.FlexColumnWidth(3),
                    1: pw.FlexColumnWidth(1),
                  },
                  children: [
                    _buildTableRow(
                      arabicFont: arabicFont,
                      label: 'مكان انعقاد الجلسة:',
                      value: data.report?.judgmentDecisionPlace ?? '',
                    ),
                    _buildTableRow(
                      arabicFont: arabicFont,
                      label: 'تاريخ منطوق الحكم:',
                      value: data.report?.judgmentDate != null
                          ? dateFormat.format(DateTime.parse(data.report!.judgmentDate!))
                          : '',
                    ),
                    pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('المحكم العقاري/ ${data.litigationRequestShortDto?.arbitratorCitizen?.fullName ?? ''}',
                                  style: pw.TextStyle(font: arabicFont)),
                              pw.Text('رقم الجوال/ ${data.litigationRequestShortDto?.arbitratorCitizen?.mobile  ?? ''}',
                                  style: pw.TextStyle(font: arabicFont)),
                              pw.Text('المدينة/ ',
                                  style: pw.TextStyle(font: arabicFont)),
                              pw.Text('رقم عضوية المحكم في المركز السعودي للتحكيم العقاري/ ${data.litigationRequestShortDto?.arbitratorCitizen?.identityNumber ?? ''}',
                                  style: pw.TextStyle(font: arabicFont)),
                            ],
                          ),
                        ),
                        pw.Container(
                          color: PdfColor.fromHex('#f2f2f2'),
                          padding: const pw.EdgeInsets.all(8),
                          child: pw.Text('هيئة التحكيم يمثلها:',
                              style: pw.TextStyle(font: arabicFont)),
                        ),
                      ],
                    ),
                    _buildTableRow(
                      arabicFont: arabicFont,
                      label: 'اتفاق التحكيم (مشارطة التحكيم)',
                      value: 'اتفق الأطراف على تسوية هذا النزاع رقم (${data.litigationRequestShortDto?.requestCode ?? ''}) عن طريق التحكيم لدى المركز السعودي للتحكيم العقاري وفق نظامه وقواعده الاجرائية',
                    ),
                    _buildTableRow(
                      arabicFont: arabicFont,
                      label: 'نوع النزاع:',
                      value: data.litigationRequestShortDto?.isFinancialLitigation == true ? 'مالي' : '',
                    ),
                    _buildTableRow(
                      arabicFont: arabicFont,
                      label: 'اتعاب هيئة التحكيم:',
                      value: 'مبلغ )${data.litigationRequestShortDto?.litigationRequestAmount?.fees ?? '0'}( ريال',
                    ),
                  ],
                ),

                pw.SizedBox(height: 20),

                // Parties title
                pw.Text('أطراف التحكيم',
                    style: pw.TextStyle(
                        font: arabicFont,
                        color: PdfColor.fromHex('#04a488'),
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),

                // Parties table
                pw.Table(
                  border: pw.TableBorder.all(),
                  columnWidths: {
                    0: pw.FlexColumnWidth(1.5), // الاسم
                    1: pw.FlexColumnWidth(1), // نوع الهوية
                    2: pw.FlexColumnWidth(1), // رقم الهوية
                    3: pw.FlexColumnWidth(1), // الصفة
                    4: pw.FlexColumnWidth(1), // العنوان
                    5: pw.FlexColumnWidth(1), // رقم الهاتف
                    6: pw.FlexColumnWidth(1.5), // البريد الالكتروني
                  },
                  children: [
                    // Header row
                    pw.TableRow(
                      decoration: pw.BoxDecoration(color: PdfColor.fromHex('#005257')),
                      children: [
                        _buildHeaderCell(arabicFont, 'رقم البريد الالكتروني'),
                        _buildHeaderCell(arabicFont, 'رقم الهاتف'),
                        _buildHeaderCell(arabicFont, 'العنوان'),
                        _buildHeaderCell(arabicFont, 'الصفة'),
                        _buildHeaderCell(arabicFont, 'رقم الهوية'),
                        _buildHeaderCell(arabicFont, 'نوع الهوية'),
                        _buildHeaderCell(arabicFont, 'الاسم'),
                      ],
                    ),
                    // First party row
                    pw.TableRow(
                      children: [
                        _buildPartyCell(arabicFont, data.litigationRequestShortDto?.contract?.firstPartyCitizen?.email ?? ''),
                        _buildPartyCell(arabicFont, data.litigationRequestShortDto?.contract?.firstPartyCitizen?.mobile ?? ''),
                        _buildPartyCell(arabicFont, ''),
                        _buildPartyCell(arabicFont, 'المحتكم', isCenter: true),
                        _buildPartyCell(arabicFont, data.litigationRequestShortDto?.contract?.firstPartyCitizen?.identityNumber ?? ''),
                        _buildPartyCell(arabicFont, ''),
                        _buildPartyCell(arabicFont, 'السيد/ ${data.litigationRequestShortDto?.contract?.firstPartyCitizen?.fullName ?? ''}'),
                      ],
                    ),
                    // Second party row
                    pw.TableRow(
                      children: [
                        _buildPartyCell(arabicFont, data.litigationRequestShortDto?.contract?.secondPartyCitizen?.email ?? ''),
                        _buildPartyCell(arabicFont, data.litigationRequestShortDto?.contract?.secondPartyCitizen?.mobile ?? ''),
                        _buildPartyCell(arabicFont, ''),
                        _buildPartyCell(arabicFont, 'المحتكم ضده', isCenter: true),
                        _buildPartyCell(arabicFont, data.litigationRequestShortDto?.contract?.secondPartyCitizen?.identityNumber ?? ''),
                        _buildPartyCell(arabicFont, ''),
                        _buildPartyCell(arabicFont, 'السيد/ ${data.litigationRequestShortDto?.contract?.secondPartyCitizen?.fullName ?? ''}'),
                      ],
                    ),
                  ],
                ),

                pw.SizedBox(height: 20),

                // Introduction text
                pw.Paragraph(
                  text: '''
الحمد لله رب العالمين، والصلاة والسلام على نبينا محمد وآله وصحبه، وبعد:
بناء على نظام التحكيم الصادر بالمرسوم الملكي الكريم رقم م/34 وتاريخ 24/5/1433هـ ولائحته التنفيذية الموافق عليها بقرار رئيس مجلس الوزراء رقم 541 وتاريخ 26/8/1438هـ نظرت هذه القضية.
الساعة (${data.report?.judgmentDate != null ? timeFormat.format(DateTime.parse(data.report!.judgmentDate!)) : ''}) صباحا عقدت جلسة استماع أولى في القضية رقم (${data.litigationRequestShortDto?.requestCode ?? ''}) في يوم (${data.report?.judgmentDate != null ? dateFormat.format(DateTime.parse(data.report!.judgmentDate!)) : ''}) المشكلة من هيئة تحكيم وبناءً على ترشيح الطرفين تم اختيار المحكم/ ${data.litigationRequestShortDto?.arbitratorCitizen?.fullName ?? ''} هوية رقم ${data.litigationRequestShortDto?.arbitratorCitizen?.identityNumber ?? ''}، سعودي الجنسية، وعنوانه جوال: ${data.litigationRequestShortDto?.arbitratorCitizen?.mobile?? ''} بريد الكتروني: ${data.litigationRequestShortDto?.arbitratorCitizen?.email ?? ''} والمنعقدة بمدينة () بالمركز السعودي للتحكيم العقاري عبر () عن بعد.
          ''',
                  style: pw.TextStyle(font: arabicFont),
                ),

                pw.SizedBox(height: 233),

                // Facts section
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('الوقائع:',
                        style: pw.TextStyle(
                            font: arabicFont,
                            color: PdfColor.fromHex('#005257'),
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 10),
                    pw.Paragraph(
                      text: data.report?.facts ?? '',
                      style: pw.TextStyle(font: arabicFont),
                    ),
                  ],
                ),

                pw.SizedBox(height: 20),

                // Reasons section
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('الأسباب:',
                        style: pw.TextStyle(
                            font: arabicFont,
                            color: PdfColor.fromHex('#005257'),
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 10),
                    pw.Paragraph(
                      text: data.report?.reasons ?? '',
                      style: pw.TextStyle(font: arabicFont),
                    ),
                  ],
                ),

                pw.SizedBox(height: 20),

                // Judgment section
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('الحكم:',
                        style: pw.TextStyle(
                            font: arabicFont,
                            color: PdfColor.fromHex('#005257'),
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 10),
                    pw.Paragraph(
                      text: data.report?.judgmentDecisionText ?? '',
                      style: pw.TextStyle(font: arabicFont),
                    ),
                  ],
                ),

                pw.SizedBox(height: 20),

                // Judge name section
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('معد الحكم:',
                        style: pw.TextStyle(
                            font: arabicFont,
                            color: PdfColor.fromHex('#005257'),
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 10),
                    pw.Paragraph(
                      text: data.report?.arbitratorCitizenName?? '',
                      style: pw.TextStyle(font: arabicFont),
                    ),
                  ],
                ),

                pw.SizedBox(height: 20),

                // Final text
                pw.Paragraph(
                  text: 'حررت هذه الوثيقة من 4 نسخ اسلتم أطراف النزاع وهيئة التحكيم والنسخة الرابعة تودع لدى المركز السعودي للتحكيم العقاري.',
                  style: pw.TextStyle(font: arabicFont),
                ),

                pw.SizedBox(height: 20),

                // Signature section
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('هيئة التحكيم:',
                        style: pw.TextStyle(
                            font: arabicFont,
                            color: PdfColor.fromHex('#005257'),
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('المحكم العقاري/ ${data.litigationRequestShortDto?.arbitratorCitizen?.fullName ?? ''}',
                            style: pw.TextStyle(
                                font: arabicFont,
                                color: PdfColor.fromHex('#04a488'),
                                fontSize: 14)),
                        pw.Text('التوقيع/ ${data.litigationRequestShortDto?.arbitratorCitizen?.fullName ?? ''}',
                            style: pw.TextStyle(
                                font: arabicFont,
                                color: PdfColor.fromHex('#04a488'),
                                fontSize: 14)),
                      ],
                    ),
                    // If you have signature image, you can add it here
                    // pw.Image(signatureImage, width: 100, height: 50),
                  ],
                ),
              ]
          ),

          // Add more sections as needed...
        ],
      ),
    );

    return pdf;
  }

  pw.TableRow _buildTableRow({
    required pw.Font arabicFont,
    required String label,
    required String value,
  }) {
    return pw.TableRow(
      children: [
        pw.Container(
          color: PdfColor.fromHex('#f2f2f2'),
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(value,
              style: pw.TextStyle(font: arabicFont)),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(label,
              style: pw.TextStyle(font: arabicFont)),
        ),
      ],
    );
  }

  pw.Container _buildHeaderCell(pw.Font arabicFont, String text) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(text,
          style: pw.TextStyle(
              font: arabicFont,
              color: PdfColors.white),
          textAlign: pw.TextAlign.center),
    );
  }

  pw.Container _buildPartyCell(pw.Font arabicFont, String text, {bool isCenter = false}) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(text,
          style: pw.TextStyle(font: arabicFont),
          textAlign: isCenter ? pw.TextAlign.center : pw.TextAlign.start),
    );
  }
}
