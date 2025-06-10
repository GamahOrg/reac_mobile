import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/app_enums.dart';
import 'package:reac/app/core/data/response/base_response.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/design/widget/language_direction.dart';
import 'package:reac/design/widget/success_dialog.dart';
import 'package:reac/features/presentation/claim_details/claimm_data_widget.dart';
import 'package:reac/features/presentation/claim_details/widgets/claim_data_widget.dart';
import 'package:reac/features/presentation/claim_details/widgets/claim_events_widget.dart';
import 'package:reac/features/presentation/claim_details/widgets/claim_main_button.dart';
import 'package:reac/features/presentation/claim_details/widgets/claim_status_widget.dart';
import 'package:reac/features/presentation/claim_details/widgets/claim_tabs.dart';
import 'package:reac/features/presentation/claim_details/widgets/number_arbitration_bottom_sheet.dart';
import 'package:reac/features/presentation/claim_details/widgets/resuable_cube.dart';
import 'package:reac/features/presentation/claim_details/widgets/select_arbitration_bottom_sheet.dart';
import 'package:reac/features/presentation/home/claims_screen.dart';
import 'package:reac/features/presentation/widgets/rating/rating_bottom_sheet.dart';
import '../../../app/app_assets.dart';
import '../../../app/function.dart';
import '../../../my_app.dart';
import '../../domain/models/claim_model/details_response_model.dart';
import '../manager/claim_details_cubit.dart';
import '../manager/get_claim_states.dart';
import '../manager/get_number_of_arbitration_panel_cubit.dart';
import '../manager/selection_arbitrator_cubit.dart';
import '../scalpel_model_screen.dart';
import '../widgets/custom_card.dart';

class ClaimDetailsArgements {
  int? status;
  int? param = 0;
  String? litigationId;
  bool isDetailsFromHome;
  StepsClaims? typeStep;

  ClaimDetailsArgements(
      {this.status,
      this.litigationId,
      this.typeStep,
      required this.isDetailsFromHome,
    }) {}
}

class ClaimDetails extends StatefulWidget {
  static const String id = "ClaimDetails";
  ClaimDetailsArgements? claimDetailsArgements;

  ClaimDetails({super.key, this.claimDetailsArgements});

  @override
  State<ClaimDetails> createState() => _ClaimDetailsState();
}

class _ClaimDetailsState extends State<ClaimDetails> {
  bool isFirstTabSelected = true;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
            getIt<ClaimDetailsCubit>()
              ..executeDataClaim(
                  litigationId: widget.claimDetailsArgements!.litigationId)
              ..executeEventClaim(
                  requestId: widget.claimDetailsArgements!.litigationId),
          ),
          BlocProvider(
              create: (context) =>
              getIt<NumberOfArbitrationPanelCubit>()
                ..executeNumberOfArbitrationPanel(
                    requestId: widget.claimDetailsArgements!.litigationId)),
          BlocProvider(
              create: (context) =>
              getIt<AppointmentMembersArbitrationPanelCubit>()
                ..executeGetArbitrator(
                    requestId: widget.claimDetailsArgements!.litigationId)),
        ],
        child: BlocConsumer<ClaimDetailsCubit, ClaimStates>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = context.watch<ClaimDetailsCubit>();
              return BlocConsumer<NumberOfArbitrationPanelCubit, ClaimStates>(
                  listener: (context, state) {
                    if(state is SuccessStateSendLitigationFeesRequestPaid){
                      SuccessDialog.show(context: context,firstText: state.message.toString());
                      Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, ClaimsScreen.id, arguments: "login");

                    }
                  },
                  builder: (context, state) {
                    final numberOfArbitrationPanelCubit = context.watch<NumberOfArbitrationPanelCubit>();
                    return BlocConsumer<AppointmentMembersArbitrationPanelCubit, ClaimStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          final appointmentMembersArbitrationPanelCubit = context.watch<AppointmentMembersArbitrationPanelCubit>();
                          dPrint(widget.claimDetailsArgements!.typeStep.toString());
                          dPrint("widget.claimDetailsArgements!.typeStep.toString()");
                        //   if(widget.claimDetailsArgements?.isDetailsFromHome==true){
                        // cubit.executeDataClaim(
                        //         litigationId: widget.claimDetailsArgements!.litigationId);
                        //  cubit.executeEventClaim(
                        //           requestId: widget.claimDetailsArgements!.litigationId);
                        //   }
                        //   if(widget.claimDetailsArgements?.isDetailsFromHome==false&&widget.claimDetailsArgements?.typeStep?.text==StepsClaims.determineTheNumberOfArbitrators){
                        //     numberOfArbitrationPanelCubit.executeNumberOfArbitrationPanel(
                        //         requestId: widget.claimDetailsArgements!.litigationId);
                        //   }
                        //   if(widget.claimDetailsArgements?.isDetailsFromHome==false&&widget.claimDetailsArgements?.typeStep?.text==StepsClaims.appointmentOfMembersOfTheArbitrationPanel.text){
                        //     appointmentMembersArbitrationPanelCubit.executeGetArbitrator(
                        //         requestId: widget.claimDetailsArgements!.litigationId);
                        //   }
                          var model;
                          if (widget.claimDetailsArgements?.typeStep?.text == StepsClaims.appointmentOfMembersOfTheArbitrationPanel.text) {
                            model = appointmentMembersArbitrationPanelCubit.arbitratorsModelGet;
                          } else if(widget.claimDetailsArgements?.typeStep?.text == StepsClaims.determineTheNumberOfArbitrators.text) {
                            model = numberOfArbitrationPanelCubit.numberOfArbitrationPanelModel;
                          }
                          return Scaffold(
                            bottomNavigationBar: () {
                              final isFromHome = widget.claimDetailsArgements?.isDetailsFromHome;
                              final typeStepText = widget.claimDetailsArgements?.typeStep?.text;
                              final status = widget.claimDetailsArgements?.status;

                              final isDetermineStep = typeStepText == StepsClaims.determineTheNumberOfArbitrators.text;
                              final isAppointmentStep = typeStepText == StepsClaims.appointmentOfMembersOfTheArbitrationPanel.text;

                              final allowAddNumber = numberOfArbitrationPanelCubit.numberOfArbitrationPanelModel?.allowAdd;
                              final allowAddAppointment = appointmentMembersArbitrationPanelCubit.arbitratorsModelGet?.allowAdd;

                              print('isDetailsFromHome: $isFromHome');
                              print('typeStepText: $typeStepText');
                              print('status: $status');
                              print('allowAddNumber: $allowAddNumber');
                              print('allowAddAppointment: $allowAddAppointment');
                              print(LitigationStatus.CollectionOfLitigationFeesRequestIsBeingSent.value.toString());

                              // First condition block
                              if (isFromHome == false &&
                                  allowAddNumber == false &&
                                  isDetermineStep) {
                                print('Condition 1 matched: isDetailsFromHome == false, allowAddNumber == false, isDetermineStep == true');
                                return const SizedBox();
                              }

                              // Second condition block
                              if (isFromHome == false &&
                                  allowAddAppointment == false &&
                                  isAppointmentStep) {
                                print('Condition 2 matched: isDetailsFromHome == false, allowAddAppointment == false, isAppointmentStep == true');
                                return const SizedBox();
                              }

                              // Third condition block
                              if (isFromHome == true &&
                                  status == LitigationStatus.CollectionOfLitigationFeesRequestIsBeingSent.value) {
                                print('Condition 3 matched: isDetailsFromHome == true, status == CollectionOfArbitrationFeesRequestIsBeingSent');
                                return _mainButton(model, numberOfArbitrationPanelCubit);
                              }

                              // Fourth condition block
                              if (model != null) {
                                print('Condition 4 matched: model != null');
                                return _mainButton(model, null);
                              }

                              print('No conditions matched, returning null');
                              return null;
                            }(),
                            body: SingleChildScrollView(
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Column(
                                    children: [
                                      _buildHeader(
                                        context,
                                        widget.claimDetailsArgements!
                                            .isDetailsFromHome ==
                                            true
                                            ? (MyApp.tr.caseDetails):
                                        getStepsClaimsText(widget.claimDetailsArgements!.typeStep ?? StepsClaims.home)
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 5.w),
                                        child: Column(
                                          children: [
                                            if (widget.claimDetailsArgements
                                                ?.status ==
                                                ClaimStatus.underPayment)
                                              _buildFeesAlertView(),
                                            ClaimStatusWidget(
                                              status: LitigationStatus
                                                  .fromValue(
                                                  widget.claimDetailsArgements
                                                      ?.status ?? 0),
                                              isDetailsFromHome: widget
                                                  .claimDetailsArgements!
                                                  .isDetailsFromHome,),
                                            isFirstTabSelected
                                                ? state is LoadingState
                                                ? SizedBox(
                                              height: MediaQuery
                                                  .of(
                                                  context)
                                                  .size
                                                  .height * 0.7,
                                              child: const Center(
                                                  child:
                                                  RotatingLoader()),
                                            )
                                                : widget.claimDetailsArgements
                                                ?.isDetailsFromHome ==
                                                true
                                                ? ClaimDataWidget(
                                              claimDetailsModel:
                                              cubit.claimDetailsResponse,
                                            )
                                                : ClaimDataShortWidget(
                                              typeStep: widget
                                                  .claimDetailsArgements!
                                                  .typeStep,
                                              generalModel: () {
                                                if (widget
                                                    .claimDetailsArgements!
                                                    .typeStep ==
                                                   StepsClaims.determineTheNumberOfArbitrators) {
                                                  return numberOfArbitrationPanelCubit
                                                      .numberOfArbitrationPanelModel;
                                                } else {
                                                  return appointmentMembersArbitrationPanelCubit
                                                      .arbitratorsModelGet;
                                                }
                                              }(),
                                            )
                                                : state is LoadingState
                                                ? SizedBox(
                                                    height: MediaQuery.of(context).size.height * 0.7,child: Center(child: RotatingLoader()))
                                                : ClaimEventsWidget(
                                                claimEventModels:
                                                cubit.claimEventModel),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  widget.claimDetailsArgements!
                                      .isDetailsFromHome
                                      ? ClaimTabs(
                                    // status: widget.claimDetailsArgements!.status,
                                      firstTab: () {
                                        setState(() {
                                          isFirstTabSelected = true;
                                        });
                                      }, secondTab: () {
                                    setState(() {
                                      isFirstTabSelected = false;
                                    });
                                  })
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          );
                        });
                  });
            }));
  }

  Widget _mainButton(DetailsResponseModel? detailsResponseModel, NumberOfArbitrationPanelCubit? cubit) {
    return Builder(
      builder: (context) {
        return ClaimMainButton(
          typeStep: widget.claimDetailsArgements?.typeStep,
          cubit: detailsResponseModel,
          status: widget.claimDetailsArgements?.status,
          callBack: () async {
            if (widget.claimDetailsArgements?.typeStep?.text == StepsClaims.determineTheNumberOfArbitrators.text) {
              NumberArbitrationBottomSheet.show(context, widget.claimDetailsArgements?.litigationId??"");
            } else if (widget.claimDetailsArgements?.typeStep?.text == StepsClaims.appointmentOfMembersOfTheArbitrationPanel.text) {
              appointmentOfMembersOfTheArbitrationBottomSheet.show(context, widget.claimDetailsArgements?.litigationId??"");
            }
            else if (widget.claimDetailsArgements?.status == 26) {
              await cubit!.sendLitigationFeesRequestPaid(id: widget.claimDetailsArgements?.litigationId??"");
              ///ApiCall
              //appointmentOfMembersOfTheArbitrationBottomSheet.show(context, widget.claimDetailsArgements?.litigationId??"");
            }
          },
        );
      }
    );
  }

  Widget _buildFeesAlertView() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                blurRadius: 0.5,
                spreadRadius: 1,
                offset: Offset(0, 1),
                color: AppColors.appThirdWhite)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(AppAssets.icError)),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MyApp
                          .tr.theAdministrativeFeesForTheLawsuitHaveNotBeenPaid,
                      style: TextStyle(
                        color: AppColors.appLightRed,
                        fontSize: 11.0.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 0.3.h,
                    ),
                    Text(
                      MyApp.tr
                          .pleasePayTheAdministrativeFeesForTheClaimToBeSentToTheAuditStage,
                      style: TextStyle(
                          color: AppColors.TextBlack,
                          fontSize: 9.0.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _showRating() {
  //   RatingBottomSheet.show(context, (int value) {});
  // }

//
// Container _charterpartyModelCard(context) {
//   return Container(
//     margin: const EdgeInsets.only(top: 10),
//     child: CustomCard(
//         title: MyApp.tr.participationForm,
//         description:
//         MyApp.tr.pleaseRespondToThePartyRequestSubmittedByTheCaseExaminer,
//         buttonText: MyApp.tr.viewModel,
//         onButtonTap: () {
//           Navigator.pushNamed(context, ScalpelModelScreen.id,
//               arguments: widget.claimDetailsArgements?.litigationId);
//         }),
//   );
// }
//
// Container _interpretationRulingModelCard(context) {
//   return Container(
//     margin: const EdgeInsets.only(top: 10),
//     child: CustomCard(
//         title: MyApp.tr.arbitrationAward,
//         description: MyApp.tr.aJudgmentHasBeenRenderedInTheCase,
//         buttonText: MyApp.tr.showTheVerdict,
//         onButtonTap: () {
//           Navigator.pushNamed(
//               context, InterpretationOfTheArbitrationAward.id,
//               arguments: widget.claimDetailsArgements?.litigationId);
//         }),
//   );
// }
// }

  Container _buildHeader(BuildContext context, String title) {
    return Container(
      padding:widget.claimDetailsArgements?.isDetailsFromHome==true? EdgeInsets.only(bottom: 3.h, left: 5.5.w, right: 5.5.w):EdgeInsets.only(bottom: 2.h, left: 5.5.w, right: 5.5.w),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.selectedTextTab,
            AppColors.appSecondblue,
          ],
        ),
      ),
      height: 12.5.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: LanguageDirection(
              child: SvgPicture.asset(
                AppAssets.icBack,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
widget.claimDetailsArgements?.isDetailsFromHome==true?const Spacer():SizedBox(width: 6.w,),
          Flexible(
            flex:3,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color: const Color(0xffFFFFFF),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }


  // void _showSuccessDialog(BuildContext context) {
  //   SuccessDialog.show(
  //       context: context,
  //       dismissCallBack: () {
  //         print("Hello");
  //       });
  // }
}