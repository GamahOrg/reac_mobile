import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/design/widget/language_direction.dart';
import 'package:reac/features/presentation/claim_details/widgets/resuable_cube.dart';
import 'package:reac/features/presentation/manager/get_claim_states.dart';
import 'package:reac/features/presentation/manager/reconciliation_cubit.dart';
import 'package:reac/features/presentation/widgets/custom_extention_tile.dart';
import 'package:reac/features/presentation/widgets/custom_row.dart';
import 'package:reac/features/presentation/widgets/custom_row_column.dart';
import 'package:reac/features/presentation/widgets/done_container.dart';

import '../../app/app_assets.dart';
import '../../app/app_enums.dart';
import '../../app/custom_bottom_sheet.dart';
import '../../app/default_button.dart';
import '../../app/helpers/flash_toast_helper.dart';
import '../../design/widget/success_dialog.dart';
import '../../my_app.dart';
import 'auth_screens/widgets.dart';
import 'claim_details/widgets/claim_status_widget.dart';
class MinutesOfSettlementArguments {
  String? requestId;
  int? status;
  MinutesOfSettlementArguments({this.status,this.requestId});
}
class MinutesOfSettlement extends StatefulWidget {
  static const String id = "MinutesOfSettlement";
   MinutesOfSettlement({super.key,this.minutesOfSettlementArguments});
   MinutesOfSettlementArguments? minutesOfSettlementArguments;

  @override
  State<MinutesOfSettlement> createState() => _MinutesOfSettlementState();
}

class _MinutesOfSettlementState extends State<MinutesOfSettlement> {
  TextEditingController reasonRefuseController = TextEditingController();

   int maxLength = 250;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>getIt<ReconcilitionCubit>()..executeGetReconciliation(requestId:widget.minutesOfSettlementArguments?.requestId ),
      child: BlocConsumer<ReconcilitionCubit,ClaimStates>(
        listener: (context,state){
          if(state is SuccessRequestReconcilition){
            SuccessDialog.show(context: context,firstText: state.message.toString());
         //   FlashToastHelper.showSuccessToast(context: context, content: state.message.toString());
          }
        },
        builder: (context,state){
          final cubit =  context.watch<ReconcilitionCubit>();
          return  Scaffold(
        bottomNavigationBar:cubit.reconciliation?.allowAdd==true? Container(
              padding:  EdgeInsets.symmetric(vertical: 3.h,horizontal: 4.w),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                      radius: 30,
                      firstGradientColor: Colors.white,
                      secondGradientColor: Colors.white,
                      title: MyApp.tr.rejectTheSettlementReport,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      textColor: const Color(0xff002F56),
                      onTap: () {
                        // Navigator.pop(context);
                        // CustomBottomSheet.show(context, child: StatefulBuilder(
                        //   builder: (BuildContext context,
                        //       void Function(void Function()) setState) {
                        //     int currentLength =
                        //         reasonRefuseController.text.length;
                        //     return Padding(
                        //       padding: EdgeInsets.only(
                        //           bottom:
                        //           MediaQuery.of(context).viewInsets.bottom),
                        //       child: SingleChildScrollView(
                        //         child: Padding(
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: 6.w, vertical: 2.h),
                        //           child: Column(
                        //             mainAxisSize: MainAxisSize.min,
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             children: [
                        //               Text(
                        //                 MyApp.tr
                        //                     .respondingToTheRequestForArbitration,
                        //                 style: TextStyle(
                        //                     fontSize: 11.sp,
                        //                     fontWeight: FontWeight.w700,
                        //                     color: const Color(0xff222325)),
                        //               ),
                        //               SizedBox(
                        //                 height: 2.h,
                        //               ),
                        //               Text(
                        //                 MyApp.tr.reasonForRejection,
                        //                 style: TextStyle(
                        //                     fontSize: 11.sp,
                        //                     fontWeight: FontWeight.w400,
                        //                     color: const Color(0xff222325)),
                        //               ),
                        //               SizedBox(
                        //                 height: 1.h,
                        //               ),
                        //               Container(
                        //                 decoration: BoxDecoration(
                        //                     borderRadius: BorderRadius.circular(10),
                        //                     border: Border.all(
                        //                         width: 1,
                        //                         color: const Color(0xffE6E7EC))),
                        //                 child: Padding(
                        //                   padding: EdgeInsets.symmetric(
                        //                       horizontal: 5.w, vertical: 1.h),
                        //                   child: Column(
                        //                     mainAxisSize: MainAxisSize.min,
                        //                     mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                     children: [
                        //                       TextFormField(
                        //                         decoration: InputDecoration(
                        //                             hintText: MyApp.tr
                        //                                 .writeTheReasonForRejection,
                        //                             hintStyle: TextStyle(
                        //                                 fontSize: 11.sp,
                        //                                 fontWeight: FontWeight.w400,
                        //                                 color: const Color(
                        //                                     0xffA5AEB1)),
                        //                             border: InputBorder.none),
                        //                         cursorColor: AppColors.selectedTextTab,
                        //                         controller: reasonRefuseController,
                        //                         onChanged: (value) {
                        //                           setState(() {
                        //                             currentLength =
                        //                                 reasonRefuseController
                        //                                     .text.length;
                        //                             if (currentLength > maxLength) {
                        //                               reasonRefuseController.text =
                        //                                   reasonRefuseController
                        //                                       .text
                        //                                       .substring(
                        //                                       0, maxLength);
                        //                               reasonRefuseController
                        //                                   .selection =
                        //                                   TextSelection
                        //                                       .fromPosition(
                        //                                     TextPosition(
                        //                                         offset: maxLength),
                        //                                   );
                        //                             }
                        //                           });
                        //                         },
                        //                         keyboardType: TextInputType.text,
                        //                         maxLines: null,
                        //                         minLines: 5,
                        //                       ),
                        //                       Align(
                        //                         alignment:
                        //                         AlignmentDirectional.bottomEnd,
                        //                         child: Text(
                        //                           "$maxLength / $currentLength",
                        //                           style: const TextStyle(
                        //                               fontWeight: FontWeight.w400,
                        //                               fontSize: 12,
                        //                               color: Color(0xff61686B)),
                        //                         ),
                        //                       )
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 height: 8.h,
                        //               ),
                        //               Row(
                        //                 children: [
                        //                   Expanded(
                        //                     flex: 1,
                        //                     child: DefaultButton(
                        //                       radius: 30,
                        //                       firstGradientColor: Colors.white,
                        //                       secondGradientColor: Colors.white,
                        //                       title: MyApp.tr.cancellation,
                        //                       fontSize: 11.sp,
                        //                       fontWeight: FontWeight.w700,
                        //                       textColor: const Color(0xff002F56),
                        //                       onTap: () {
                        //                         Navigator.pop(context);
                        //                       },
                        //                     ),
                        //                   ),
                        //                   SizedBox(
                        //                     width: 3.w,
                        //                   ),
                        //                   Expanded(
                        //                     flex: 2,
                        //                     child: DefaultButton(
                        //                       radius: 30,
                        //                       firstGradientColor:
                        //                       const Color(0xff002F56),
                        //                       secondGradientColor:
                        //                       const Color(0xff002F56),
                        //                       title: MyApp.tr.send,
                        //                       fontSize: 11.sp,
                        //                       fontWeight: FontWeight.w700,
                        //                       textColor: Colors.white,
                        //                       onTap: () {
                        //                         setState(() {
                        //                           showDialog(
                        //                             context: context,
                        //                             barrierDismissible: true,
                        //                             builder:
                        //                                 (BuildContext context) {
                        //                               return Dialog(
                        //                                 insetAnimationDuration:
                        //                                 const Duration(
                        //                                     milliseconds: 100),
                        //                                 insetAnimationCurve:
                        //                                 Curves.bounceInOut,
                        //                                 child: DoneContainer(
                        //                                     image:
                        //                                     AppAssets.bgSuccess,
                        //                                     firstText: MyApp.tr.theSettlementReportWasRejected
                        //                                 ),
                        //                               );
                        //                             },
                        //                           );
                        //                         });
                        //                       },
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //               SizedBox(
                        //                 height: 1.h,
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),
                        //     backgroundColor: const Color(0xffF4F5F9),
                        //     isClose: false);
                        cubit.executePostReconciliation(requestId: widget.minutesOfSettlementArguments?.requestId,minutesOfMeetingApprovalStatus: 2);
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
                      title: MyApp.tr.acceptTheSettlementReport,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                      onTap: () {
                        cubit.executePostReconciliation(requestId: widget.minutesOfSettlementArguments?.requestId,minutesOfMeetingApprovalStatus: 1);
                      },
                    ),
                  )
                ],
              ),
            ):const SizedBox(),
            appBar: buildAppBar(context,MyApp.tr.minutesOfReconciliation) ,
            body: state is LoadingState? const Center(child: RotatingLoader()):SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                child: Column(
                  children: [
                    ClaimStatusWidget(status: LitigationStatus.fromValue(widget.minutesOfSettlementArguments?.status??0),isDetailsFromHome: false,),
                    SizedBox(height: 2.h,),
                    CustomExpansionTile(
                      isLoading: true,
                      isPaddingTitle: true,
                      initiallyExpanded: true,
                      expandedIcon: AppAssets.icArrowDown,
                      collapsedIcon: AppAssets.icArrowUp,
                      title:MyApp.tr.detailsOfTheReconciliationMinutes,
                      leading: Image(
                        image: AssetImage(AppAssets.icClaimsInfo),
                      ), children:[
                      CustomRow(dm: CustomRowDM(value: cubit.reconciliation?.report?.modificationRequest??"", label: MyApp.tr.modificationRequest),),
                      CustomRow(dm: CustomRowDM(value: cubit.reconciliation?.report?.reconciliationSessionDetails??"", label: MyApp.tr.editTheDisputedLocation),),
                      CustomRowColumn(
                        values: cubit.reconciliation?.report?.litigationRequestMeetingReconciliationItems
                          ?.map((e) => e.reconciliationItem.toString()) // Convert each item to a string if necessary
              .toList(), // Convert the Iterable to a List
          label: MyApp.tr.peaceClause,

          )                    ]
                    ),
                    SizedBox(
                      height: 3.h,
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
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.firstPartyCitizen?.fullName ??
                                      "",
                                  label: MyApp.tr.plaintiff)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.firstPartyCitizen?.fax ??
                                      "",
                                  label: MyApp.tr.fax)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.firstPartyCitizen?.homeTelephone ??
                                      "",
                                  label: MyApp.tr.homeTele)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.firstPartyCitizen?.workTelephone ??
                                      "",
                                  label: MyApp.tr.workTele)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.firstPartyCitizen?.identityNumber ??
                                      "",
                                  label: MyApp.tr.idNumber)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.firstPartyCapacity ??
                                      "",
                                  label: MyApp.tr.plaintiffStatus)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.firstPartyCitizen?.mobile ??
                                      "",
                                  label: MyApp.tr.mobileNumber)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.firstPartyCitizen?.email ??
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
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.secondPartyCitizen?.fullName ??
                                      "",
                                  label: MyApp.tr.fullName)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.secondPartyCapacity ??
                                      "",
                                  label: MyApp.tr.characteristicsOfTheDefendant)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.secondPartyCitizen?.fax ??
                                      "",
                                  label: MyApp.tr.fax)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.secondPartyCitizen?.homeTelephone ??
                                      "",
                                  label: MyApp.tr.homeTele)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.secondPartyCitizen?.workTelephone ??
                                      "",
                                  label: MyApp.tr.workTele)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.secondPartyCitizen?.mobile ??
                                      "",
                                  label: MyApp.tr.mobileNumber)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.secondPartyCitizen?.email ??
                                      "",
                                  label: MyApp.tr.email)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.secondPartyCitizen?.identityNumber ??
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
                          image: AssetImage(AppAssets.icClaimsInfo),
                        ),
                        expandedIcon: AppAssets.icArrowDown,
                        collapsedIcon: AppAssets.icArrowUp,
                        children: [
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation
                                      ?.litigationRequestShortDto?.requestCode ??
                                      "",
                                  label: MyApp.tr.caseCode)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value:
                                  cubit.reconciliation?.litigationRequestShortDto?.cityName ??
                                      "",
                                  label: MyApp.tr.theCity)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value:
                                  cubit.reconciliation?.litigationRequestShortDto?.areaName ??
                                      "",
                                  label: MyApp.tr.area)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation
                                      ?.litigationRequestShortDto?.contractAddress ??
                                      "",
                                  label: MyApp.tr.caseTitle)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto?.contract
                                      ?.litigationRequestContractType?.typeName ??
                                      "",
                                  label: MyApp.tr.claimType)),
                          CustomRow(
                              dm: CustomRowDM(
                                  value: cubit.reconciliation?.litigationRequestShortDto
                                      ?.litigationRequestCategory?.categoryName ??
                                      "",
                                  label: MyApp.tr.requestType)),
                        ]),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<CustomRow> _buildRows(List<CustomRowDM> items) {
    return items.map((item) {
      return CustomRow(
        dm: item,
      );
    }).toList();
  }
}
