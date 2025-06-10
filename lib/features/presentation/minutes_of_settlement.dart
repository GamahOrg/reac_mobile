import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/design/widget/language_direction.dart';
import 'package:reac/features/domain/models/claim_model/reconciliation.dart';
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
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

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

                    // Replace the GestureDetector with this:
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DefaultButton(
                        radius: 30,
                        firstGradientColor: const Color(0xff03598D),
                        secondGradientColor: const Color(0xff002F56),
                        title: "تحميل محضر الصلح",
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        textColor: Colors.white,
                        onTap: () async {
                          if (cubit.reconciliation != null) {
                            await _generateAndOpenPdf(context, cubit.reconciliation!);
                          } else {
                            FlashToastHelper.showErrorToast(
                                context: context, content: "MyApp.tr.noDataAvailableForPdf");
                          }
                        },
                      ),
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

  Future<void> _generateAndOpenPdf(
      BuildContext context, Reconciliation data) async {
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
      Reconciliation data) async {
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
                    pw.SizedBox(height: 20),

                    // Title
                    pw.Text('محضر صلح',
                        style: pw.TextStyle(
                            font: arabicFont,
                            color: PdfColor.fromHex('#005257'),
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 10),
                    pw.Text('في الدعوى رقم (${data.litigationRequestShortDto?.requestCode ?? ''}) وتاريخ ${dateFormat.format( DateTime.parse(data.report?.reportDate??""))}',
                        style: pw.TextStyle(font: arabicFont)),
                    pw.Text('والصادر من المركز السعودي للتحكيم العقاري',
                        style: pw.TextStyle(font: arabicFont)),
                    pw.SizedBox(height: 20),

                    // Parties Data
                    pw.Text('بيانات أطراف الدعوى',
                        style: pw.TextStyle(
                            font: arabicFont,
                            color: PdfColor.fromHex('#00848d'),
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 10),


                    // First Party Table
                    _buildPartyTable(
                      arabicFont: arabicFont,
                      header: 'الطرف الاول',
                      headerColor: '#005257',
                      name: data.litigationRequestShortDto?.contract?.firstPartyCitizen?.fullName ?? '',
                      id: data.litigationRequestShortDto?.contract?.firstPartyCitizen?.identityNumber ?? '',
                      phone: data.litigationRequestShortDto?.contract?.firstPartyCitizen?.mobile ?? '',
                      email: data.litigationRequestShortDto?.contract?.firstPartyCitizen?.email ?? '',
                      birthdate: '',
                      nationalAddress:  '',
                      representedBy:  '',
                      capacity: '',
                      agencyNumber: '',
                    ),

                    pw.SizedBox(height: 20),

                    // Second Party Table
                    _buildPartyTable(
                      arabicFont: arabicFont,
                      header: 'الطرف الثاني',
                      headerColor: '#04a488',
                      name: data.litigationRequestShortDto?.contract?.secondPartyCitizen?.fullName ?? '',
                      id: data.litigationRequestShortDto?.contract?.secondPartyCitizen?.identityNumber ?? '',
                      phone: data.litigationRequestShortDto?.contract?.secondPartyCitizen?.mobile ?? '',
                      email: data.litigationRequestShortDto?.contract?.secondPartyCitizen?.email ?? '',
                      birthdate: '',
                      nationalAddress:  '',
                      representedBy:  '',
                      capacity: '',
                      agencyNumber: '',
                    ),
                    pw.SizedBox(height: 20),

                    // Reformer Table
                    _buildReformerTable(
                      arabicFont: arabicFont,
                      name: data.litigationRequestShortDto?.applicantCitizen?.fullName ?? '',
                      phone: data.litigationRequestShortDto?.applicantCitizen?.mobile ?? '',
                      email: data.litigationRequestShortDto?.applicantCitizen?.email ?? '',
                    ),
                    pw.SizedBox(height: 20),

                    // Introduction
                    pw.Paragraph(
                      text: 'فإنه في يوم ${DateTime.parse(data.report?.reportDate ??"")} م في تمام الساعة (${DateTime.parse(data.report?.reportDate??"")}) تم التصالح بين الأطراف الموضحة بياناتهم أعلاه في مقر المركز السعودي للتحكيم العقاري وتم إنهاء النزاع الحاصل بينهم وتحرير هذا الصلح وكتابته في هذا اليوم.',
                      style: pw.TextStyle(font: arabicFont),
                    ),
                    pw.SizedBox(height: 130),

                    // Dispute Details
                    pw.Text('"تحرير محل النزاع"',
                        style: pw.TextStyle(
                            font: arabicFont,
                            color: PdfColor.fromHex('#005257'),
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold),
                        textAlign: pw.TextAlign.center),
                    pw.SizedBox(height: 10),
                    pw.Paragraph(
                      text: data.report?.reconciliationSessionDetails ?? '',
                      style: pw.TextStyle(font: arabicFont),
                    ),
                    pw.SizedBox(height: 20),

                    // Reconciliation Terms
                    pw.Text('"بنود الصلح"',
                        style: pw.TextStyle(
                            font: arabicFont,
                            color: PdfColor.fromHex('#005257'),
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold),
                        textAlign: pw.TextAlign.center),
                    pw.SizedBox(height: 10),
                    pw.Paragraph(
                      text: 'اتفق الأطراف الموضح بياناتهم أعلاه على إنهاء النزاع الحاصل بينهم وفق البنود التالية:',
                      style: pw.TextStyle(font: arabicFont),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        for (var item in data.report?.litigationRequestMeetingReconciliationItems ?? [])
                          pw.Text('• ${item.reconciliationItem}',
                              style: pw.TextStyle(font: arabicFont)),
                        pw.SizedBox(height: 20),

                        // Reconciliation Terms
                        pw.Center(
                          child: pw.Text('احكام عامة',
                            style: pw.TextStyle(
                                font: arabicFont,
                                color: PdfColor.fromHex('#02A488'),
                                fontSize: 16,
                                fontWeight: pw.FontWeight.bold),
                          ),
                        ),

                        pw.SizedBox(height: 10),
                        pw.Paragraph(
                          text:  "تسري أحكام هذا الصلح اعتباراً من تاريخ التوقيع، عليه ويتعهد الطرفان بتنفيذ واحترام جميع بنودها مع اتفاقهما على مانيآتي.\n\nلا يعتبر تعديل أي بند من بنود هذا الصلح نافذاً إلى بعد موافقة الطرفين كتابياً على التعديل ويعتبر التعديل ملحقاً من ملحقات هذا المحضر ويرفق به كجزء لا يتجزأ منه.\n\nإن عدم استخدام أي من الطرفين لأي حق من حقوقه المنصوص عليها بهذا الصلح أو المقررة له نظاماً لا يمكن بأي حال من الأحوال اعتباره تنازلاً من هذا الطرف عن استخدام هذا الحق ما لم يقع هذا التنازل بصورة صريحة ومكتوبة ولا يشمل التنازل الكتابي المذكور إلا الواقعة المخصصة فيه ولا يتعنى نطاقه إلى أي خروقات أو حقوق أو مطالبات لاحقة معما كانت صفتها حتى لو تشابهت مع ما جرى التنازل بخصوصه.\n\nأقر كل طرف في هذا المحضر بالتفهم الكامل لبنوده والإدراك التام لكافة ما ورد فيه بعد الاطلاع عليه بما يمتثل معه بعد التوقيع عليه المعارضة بعدم الإدراك أو الفهم الخاطئ أو الغين أو خلافه.\n\nعلى الطرفين تقوى الله سبحانه وتعالى في أمورهم كلها وفي تنفيذ هذا الصلح طبقاً للأحكام والبنود الواردة فيه وبما يتفق مع الأنظمة والمرف وبطريقة ثلاثم موجبات حسن البنية.\n\nوعليه جرى التوقيع وصلى الله وسلم على نبينا محمد وأله وصحبه أجمعين.",
                          style: pw.TextStyle(font: arabicFont),
                        ),
                      ],
                    ),
                  ]
                ),
                pw.Column(
                children: [
                  pw.Table(
                    border: pw.TableBorder.all(color: PdfColors.black),
                    columnWidths: {
                      0: pw.FlexColumnWidth(3), // البيانات
                      1: pw.FlexColumnWidth(3), // الطرف الأول
                      2: pw.FlexColumnWidth(3), // الطرف الثاني
                      3: pw.FlexColumnWidth(2), // المصلح
                    },
                    children: [
                      // Header row
                      pw.TableRow(
                        decoration: pw.BoxDecoration(color: PdfColor.fromHex('#005257')),
                        children: [

                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text('المصلح', style: pw.TextStyle(color: PdfColors.white, font: arabicFont)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text('الطرف الثاني', style: pw.TextStyle(color: PdfColors.white, font: arabicFont)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text('الطرف الأول', style: pw.TextStyle(color: PdfColors.white, font: arabicFont)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text('البيانات', style: pw.TextStyle(color: PdfColors.white, font: arabicFont)),
                          ),
                        ],
                      ),

                      // Row 1 - الاسم
                      pw.TableRow(
                        children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text(data.litigationRequestShortDto?.reformerCitizen?.fullName ??"", style: pw.TextStyle(font: arabicFont)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text(data.litigationRequestShortDto?.contract?.secondPartyCitizen?.fullName ?? '', style: pw.TextStyle(font: arabicFont)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text(data.litigationRequestShortDto?.contract?.firstPartyCitizen?.fullName ?? '', style: pw.TextStyle(font: arabicFont)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text('الاسم', style: pw.TextStyle(font: arabicFont)),
                          ),
                        ],
                      ),

                      // Row 2 - التوقيع
                      pw.TableRow(
                        children: [

                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text(data.litigationRequestShortDto?.reformerCitizen?.fullName ??"" , style: pw.TextStyle(font: arabicFont)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text(data.litigationRequestShortDto?.contract?.secondPartyCitizen?.fullName ?? '', style: pw.TextStyle(font: arabicFont)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text(data.litigationRequestShortDto?.contract?.firstPartyCitizen?.fullName ??"", style: pw.TextStyle(font: arabicFont)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text('التوقيع', style: pw.TextStyle(font: arabicFont)),
                          ),
                        ],
                      ),

                      // Row 3 - التاريخ
                      pw.TableRow(
                        children: [
                          pw.Container(),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text(
                              "${data.litigationRequestShortDto?.mintuesOfMeetingApprovalDefendantStatus == 1
                                  ? 'طلب مقبول بتاريخ'
                                  : data.litigationRequestShortDto?.mintuesOfMeetingApprovalDefendantStatus == 2
                                  ? 'فى حاله انتظار':'طلب مرفوض بتاريخ'

                              }\n${DateTime.parse(data.report?.reportDate ?? "").toString()}",
                              style: pw.TextStyle(font: arabicFont),
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text(
                              "${data.litigationRequestShortDto?.mintuesOfMeetingApprovalPlaintiffStatus == 1
                                  ? 'طلب مقبول بتاريخ'
                                  : data.litigationRequestShortDto?.mintuesOfMeetingApprovalPlaintiffStatus == 2
                                  ? 'فى حاله انتظار':'طلب مرفوض بتاريخ'

                              }\n${DateTime.parse(data.report?.reportDate ?? "").toString()}",
                              style: pw.TextStyle(font: arabicFont),
                            ),
                          ),
                          pw.Container(),

                          // Empty cell
                        ],
                      ),
                    ],
                  ),

                   ]
                   )

                // Add more sections as needed...
        ],
      ),
    );

    return pdf;
  }


  pw.Widget _buildPartyTable({
    required pw.Font arabicFont,
    required String header,
    required String headerColor,
    required String name,
    required String id,
    required String phone,
    required String email,
    String? birthdate,
    String? nationalAddress,
    String? representedBy,
    String? capacity,
    String? agencyNumber,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        // Header Row - single cell
        pw.Container(
          color: PdfColor.fromHex(headerColor),
          padding: const pw.EdgeInsets.all(12),
          alignment: pw.Alignment.center,
          child: pw.Text(
            header,
            style: pw.TextStyle(
              font: arabicFont,
              color: PdfColors.white,
              fontSize: 14,
            ),
            textAlign: pw.TextAlign.center,
          ),
        ),

        // The actual table
        pw.Table(
          border: pw.TableBorder.all(),
          columnWidths: {
            0: const pw.FlexColumnWidth(1),
            1: const pw.FlexColumnWidth(1),
          },
          children: [
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    'اسم المدعي: $name',
                    style: pw.TextStyle(font: arabicFont),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    'الهوية / الإقامة / السجل التجاري: $id',
                    style: pw.TextStyle(font: arabicFont),
                  ),
                ),
              ],
            ),

            // National Address and Phone
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    'العنوان الوطني: ${nationalAddress ?? ''}',
                    style: pw.TextStyle(font: arabicFont),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    'رقم الهاتف: $phone',
                    style: pw.TextStyle(font: arabicFont),
                  ),
                ),
              ],
            ),

            // Email and Birthdate
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    'البريد الإلكتروني: $email',
                    style: pw.TextStyle(font: arabicFont),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    'تاريخ الميلاد: ${birthdate ?? ''}',
                    style: pw.TextStyle(font: arabicFont),
                  ),
                ),
              ],
            ),

            // Represented By and Capacity
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    'يمثله (إن وجد): ${representedBy ?? ''}',
                    style: pw.TextStyle(font: arabicFont),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    'صفته: ${capacity ?? ''}',
                    style: pw.TextStyle(font: arabicFont),
                  ),
                ),
              ],
            ),

            // Agency Number Row (single cell)
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    'رقم الوكالة: ${agencyNumber ?? ''}',
                    style: pw.TextStyle(font: arabicFont),
                  ),
                ),
                pw.Container(), // Empty cell
              ],
            ),
          ],
        ),
      ],
    );
  }




  pw.Widget _buildReformerTable({
    required pw.Font arabicFont,
    required String name,
    required String phone,
    required String email,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        // Header Row (merged)
        pw.Container(
          color: PdfColor.fromHex('#04a488'),
          padding: const pw.EdgeInsets.all(12),
          alignment: pw.Alignment.center,
          child: pw.Text(
            'بيانات المصلح',
            style: pw.TextStyle(
              font: arabicFont,
              color: PdfColors.white,
              fontSize: 14,
            ),
            textAlign: pw.TextAlign.center,
          ),
        ),

        // The table itself
        pw.Table(
          border: pw.TableBorder.all(),
          columnWidths: {
            0: const pw.FlexColumnWidth(1),
            1: const pw.FlexColumnWidth(1),
          },
          children: [
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    'الاسم: $name',
                    style: pw.TextStyle(font: arabicFont),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8),
                  child: pw.Text(
                    'رقم الهاتف: $phone',
                    style: pw.TextStyle(font: arabicFont),
                  ),
                ),
              ],
            ),
          ],
        ),

        // Last Row (merged)
        pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border.all(),
          ),
          padding: const pw.EdgeInsets.all(8),
          alignment: pw.Alignment.center,
          child: pw.Text(
            'البريد الإلكتروني: $email',
            style: pw.TextStyle(font: arabicFont),
            textAlign: pw.TextAlign.center,
          ),
        ),
      ],
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
