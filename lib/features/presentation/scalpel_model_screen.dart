import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/helpers/flash_toast_helper.dart';
import 'package:reac/app_cubit.dart';
import 'package:reac/features/domain/models/claim_model/agreement_action.dart';
import 'package:reac/features/presentation/claim_details/widgets/resuable_cube.dart';
import 'package:reac/features/presentation/manager/get_claim_states.dart';
import 'package:reac/features/presentation/widgets/custom_extention_tile.dart';
import 'package:reac/features/presentation/widgets/custom_row.dart';
import 'package:reac/my_app.dart';

import '../../app/app_assets.dart';
import '../../app/app_enums.dart';
import '../../app/default_button.dart';
import '../../design/widget/success_dialog.dart';
import 'auth_screens/widgets.dart';
import 'claim_details/widgets/claim_status_widget.dart';
import 'manager/agreement_cubit.dart';

class ScalpelModelScreenArguments {
  String? requestId;
  int? status;

  ScalpelModelScreenArguments({this.requestId, this.status});
}

class ScalpelModelScreen extends StatefulWidget {
  ScalpelModelScreen({super.key, this.scalpelModelScreenArguments});

  static const String id = "ScalpelModelScreen";
  ScalpelModelScreenArguments? scalpelModelScreenArguments;

  @override
  State<ScalpelModelScreen> createState() => _ScalpelModelScreenState();
}

class _ScalpelModelScreenState extends State<ScalpelModelScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AgreementCubit>()
        ..executeDetailsAgreement(
            requestId: widget.scalpelModelScreenArguments?.requestId),
      child: BlocConsumer<AgreementCubit, ClaimStates>(
        listener: (context, state) {
          if (state is SuccessStateAgreementAction) {
            // FlashToastHelper.showSuccessToast(
            //     context: context, content: state.message.toString());
            SuccessDialog.show(context: context,firstText: state.message.toString());
            setState(() {});
          }
        },
        builder: (context, state) {
          final cubit = context.watch<AgreementCubit>();
          return Scaffold(
              bottomNavigationBar: cubit.agreementModel?.allowAdd == true
                  ? Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.h, horizontal: 4.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: DefaultButton(
                                radius: 30,
                                firstGradientColor: Colors.white,
                                secondGradientColor: Colors.white,
                                title: MyApp.tr.requestRejected,
                                fontSize: 11.sp,
                                height: 6.h,
                                fontWeight: FontWeight.w700,
                                textColor: const Color(0xff002F56),
                                onTap: () {
                                  cubit.executeDetailsAgreementAction(
                                      agreementAction: AgreementAction(
                                          requestId: widget
                                              .scalpelModelScreenArguments
                                              ?.requestId,
                                          agreementRequestStatus: 2));
                                },
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Expanded(
                              child: DefaultButton(
                                radius: 30,
                                firstGradientColor: const Color(0xff002F56),
                                secondGradientColor: const Color(0xff002F56),
                                title: MyApp.tr.acceptTheRequest,
                                fontSize: 11.sp,
                                height: 6.h,
                                fontWeight: FontWeight.w700,
                                textColor: Colors.white,
                                onTap: () {
                                  cubit.executeDetailsAgreementAction(
                                      agreementAction: AgreementAction(
                                          requestId: widget
                                              .scalpelModelScreenArguments
                                              ?.requestId,
                                          agreementRequestStatus: 1));
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
              appBar: buildAppBar(context, MyApp.tr.participationForm),
              body: state is LoadingState
                  ? const Center(child: RotatingLoader())
                  : SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 4.w),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClaimStatusWidget(
                                  status: LitigationStatus.fromValue(widget
                                          .scalpelModelScreenArguments
                                          ?.status ??
                                      0),
                                  isDetailsFromHome: false,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                CustomExpansionTile(
                                    isLoading: true,
                                    isPaddingTitle: true,
                                    expandedIcon: AppAssets.icArrowDown,
                                    collapsedIcon: AppAssets.icArrowUp,
                                    title: MyApp.tr.claimantData,
                                    leading: Image(
                                      image: AssetImage(AppAssets.icClaimsInfo),
                                    ),
                                    children: [
                                      CustomRow(
                                          dm: CustomRowDM(
                                              value: cubit
                                                      .agreementModel
                                                      ?.litigationRequestShortDto
                                                      ?.applicantCitizen
                                                      ?.fax ??
                                                  "",
                                              label: MyApp.tr.fax)),
                                      CustomRow(
                                          dm: CustomRowDM(
                                              value: cubit
                                                      .agreementModel
                                                      ?.litigationRequestShortDto
                                                      ?.contract
                                                      ?.firstPartyCitizen
                                                      ?.identityNumber ??
                                                  "",
                                              label: MyApp.tr.idNumber)),
                                      CustomRow(
                                          dm: CustomRowDM(
                                              value: cubit
                                                      .agreementModel
                                                      ?.litigationRequestShortDto
                                                      ?.contract
                                                      ?.firstPartyCitizen
                                                      ?.fullName ??
                                                  "",
                                              label: MyApp.tr.fullName)),
                                      CustomRow(
                                          dm: CustomRowDM(
                                              value: cubit
                                                      .agreementModel
                                                      ?.litigationRequestShortDto
                                                      ?.contract
                                                      ?.firstPartyCapacity ??
                                                  "",
                                              label: MyApp.tr.plaintiffStatus)),
                                      CustomRow(
                                          dm: CustomRowDM(
                                              value: cubit
                                                      .agreementModel
                                                      ?.litigationRequestShortDto
                                                      ?.contract
                                                      ?.firstPartyCitizen
                                                      ?.mobile ??
                                                  "",
                                              label: MyApp.tr.mobileNumber)),
                                      CustomRow(
                                          dm: CustomRowDM(
                                              value: cubit
                                                      .agreementModel
                                                      ?.litigationRequestShortDto
                                                      ?.applicantCitizen
                                                      ?.workTelephone ??
                                                  "",
                                              label: MyApp.tr.workTele)),
                                      CustomRow(
                                          dm: CustomRowDM(
                                              value: cubit
                                                      .agreementModel
                                                      ?.litigationRequestShortDto
                                                      ?.applicantCitizen
                                                      ?.homeTelephone ??
                                                  "",
                                              label: MyApp.tr.homeTele)),
                                      CustomRow(
                                          dm: CustomRowDM(
                                              value: cubit
                                                      .agreementModel
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
                                    image: AssetImage(AppAssets.icClaimsInfo),
                                  ),
                                  expandedIcon: AppAssets.icArrowDown,
                                  collapsedIcon: AppAssets.icArrowUp,
                                  children: [
                                    cubit
                                                .agreementModel
                                                ?.litigationRequestShortDto
                                                ?.contract
                                                ?.litigationRequestContractType
                                                ?.typeName ==
                                            "وافى"
                                        ? Column(
                                            children: [
                                              CustomRow(
                                                  dm: CustomRowDM(
                                                      value: cubit
                                                              .agreementModel
                                                              ?.litigationRequestShortDto
                                                              ?.contract
                                                              ?.secondPartyFacility
                                                              ?.code ??
                                                          "",
                                                      label: MyApp
                                                          .tr.facilityCode)),
                                              CustomRow(
                                                  dm: CustomRowDM(
                                                      value: AppCubit
                                                                  .get(context)
                                                              .isArSelected
                                                          ? cubit
                                                                  .agreementModel
                                                                  ?.litigationRequestShortDto
                                                                  ?.contract
                                                                  ?.secondPartyFacility
                                                                  ?.arabicFacilityName ??
                                                              ""
                                                          : cubit
                                                                  .agreementModel
                                                                  ?.litigationRequestShortDto
                                                                  ?.contract
                                                                  ?.secondPartyFacility
                                                                  ?.englishFacilityName ??
                                                              "",
                                                      label: MyApp
                                                          .tr.facilityName)),
                                              CustomRow(
                                                  dm: CustomRowDM(
                                                      value: cubit
                                                              .agreementModel
                                                              ?.litigationRequestShortDto
                                                              ?.contract
                                                              ?.secondPartyFacility
                                                              ?.commercialRegisterNumber ??
                                                          "",
                                                      label: MyApp.tr
                                                          .commercialRegisterOfTheEstablishment)),
                                              CustomRow(
                                                  dm: CustomRowDM(
                                                      value: cubit
                                                              .agreementModel
                                                              ?.litigationRequestShortDto
                                                              ?.contract
                                                              ?.secondPartyFacility
                                                              ?.facility700Number ??
                                                          "",
                                                      label: MyApp.tr
                                                          .unifiedFacilityNumber)),
                                              CustomRow(
                                                dm: CustomRowDM(
                                                  value: cubit
                                                          .agreementModel
                                                          ?.litigationRequestShortDto
                                                          ?.contract
                                                          ?.secondPartyCapacity ??
                                                      "",
                                                  label: MyApp
                                                      .tr.theDefendantStatus,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              CustomRow(
                                                  dm: CustomRowDM(
                                                      value: cubit
                                                              .agreementModel
                                                              ?.litigationRequestShortDto
                                                              ?.applicantCitizen
                                                              ?.fax ??
                                                          "",
                                                      label: MyApp.tr.fax)),
                                              CustomRow(
                                                  dm: CustomRowDM(
                                                      value: cubit
                                                              .agreementModel
                                                              ?.litigationRequestShortDto
                                                              ?.contract
                                                              ?.secondPartyCitizen
                                                              ?.identityNumber ??
                                                          "",
                                                      label:
                                                          MyApp.tr.idNumber)),
                                              CustomRow(
                                                  dm: CustomRowDM(
                                                      value: cubit
                                                              .agreementModel
                                                              ?.litigationRequestShortDto
                                                              ?.contract
                                                              ?.secondPartyCitizen
                                                              ?.fullName ??
                                                          "",
                                                      label:
                                                          MyApp.tr.fullName)),
                                              CustomRow(
                                                  dm: CustomRowDM(
                                                      value: cubit
                                                              .agreementModel
                                                              ?.litigationRequestShortDto
                                                              ?.contract
                                                              ?.secondPartyCapacity ??
                                                          "",
                                                      label: MyApp
                                                          .tr.plaintiffStatus)),
                                              CustomRow(
                                                  dm: CustomRowDM(
                                                      value: cubit
                                                              .agreementModel
                                                              ?.litigationRequestShortDto
                                                              ?.contract
                                                              ?.secondPartyCitizen
                                                              ?.mobile ??
                                                          "",
                                                      label: MyApp
                                                          .tr.mobileNumber)),
                                              CustomRow(
                                                  dm: CustomRowDM(
                                                      value: cubit
                                                              .agreementModel
                                                              ?.litigationRequestShortDto
                                                              ?.contract
                                                              ?.secondPartyCitizen
                                                              ?.workTelephone ??
                                                          "",
                                                      label:
                                                          MyApp.tr.workTele)),
                                              CustomRow(
                                                  dm: CustomRowDM(
                                                      value: cubit
                                                              .agreementModel
                                                              ?.litigationRequestShortDto
                                                              ?.contract
                                                              ?.secondPartyCitizen
                                                              ?.homeTelephone ??
                                                          "",
                                                      label:
                                                          MyApp.tr.homeTele)),
                                              CustomRow(
                                                  dm: CustomRowDM(
                                                      value: cubit
                                                              .agreementModel
                                                              ?.litigationRequestShortDto
                                                              ?.contract
                                                              ?.secondPartyCitizen
                                                              ?.email ??
                                                          "",
                                                      label: MyApp.tr.email)),
                                            ],
                                          )
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                CustomExpansionTile(
                                  isLoading: true,
                                  isPaddingTitle: true,
                                  initiallyExpanded: false,
                                  title: MyApp.tr.claimData,
                                  leading: Image(
                                    image: AssetImage(AppAssets.icClaimsInfo),
                                  ),
                                  expandedIcon: AppAssets.icArrowDown,
                                  collapsedIcon: AppAssets.icArrowUp,
                                  children: [
                                    CustomRow(
                                        dm: CustomRowDM(
                                            value: cubit
                                                    .agreementModel
                                                    ?.litigationRequestShortDto
                                                    ?.requestCode ??
                                                "",
                                            label: MyApp.tr.caseCode)),
                                    CustomRow(
                                        dm: CustomRowDM(
                                            value: cubit
                                                    .agreementModel
                                                    ?.litigationRequestShortDto
                                                    ?.cityName ??
                                                "",
                                            label: MyApp.tr.theCity)),
                                    CustomRow(
                                        dm: CustomRowDM(
                                            value: cubit
                                                    .agreementModel
                                                    ?.litigationRequestShortDto
                                                    ?.areaName ??
                                                "",
                                            label: MyApp.tr.area)),
                                    CustomRow(
                                        dm: CustomRowDM(
                                            value: cubit
                                                    .agreementModel
                                                    ?.litigationRequestShortDto
                                                    ?.contractAddress ??
                                                "",
                                            label: MyApp.tr.caseTitle)),
                                    CustomRow(
                                        dm: CustomRowDM(
                                            value: cubit
                                                    .agreementModel
                                                    ?.litigationRequestShortDto
                                                    ?.litigationRequestCategory
                                                    ?.categoryName ??
                                                "",
                                            label: MyApp.tr.requestType)),
                                    CustomRow(
                                        dm: CustomRowDM(
                                            value: cubit
                                                    .agreementModel
                                                    ?.litigationRequestShortDto
                                                    ?.contract
                                                    ?.litigationRequestContractType
                                                    ?.typeName ??
                                                "",
                                            label: MyApp.tr.claimType)),
                                  ],
                                ),
                              ])),
                    ));
        },
      ),
    );
  }
}
