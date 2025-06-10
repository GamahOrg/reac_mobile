import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/features/domain/models/claim_model/upload_file_request.dart';

import '../../app/app_assets.dart';
import '../../app/app_colors.dart';
import '../../app/default_button.dart';
import '../../my_app.dart';
import '../domain/models/claim_model/arbitration_request_model.dart';
import 'manager/get_interpretation_rule_cubit.dart';

class ExplanationBottomSheet extends StatefulWidget {
  ExplanationBottomSheet(
      {super.key, this.interpretationRulingCubit, this.litigationRequestId});

  InterpretationRulingCubit? interpretationRulingCubit;
  String? litigationRequestId;

  @override
  State<ExplanationBottomSheet> createState() => _ExplanationBottomSheetState();
}

class _ExplanationBottomSheetState extends State<ExplanationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    int currentLength =
        widget.interpretationRulingCubit!.interpretationController.text.length;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleText(
                  MyApp.tr.requestForInterpretationOfTheArbitrationAward),
              SizedBox(height: 2.h),
              _buildSubtitleText(MyApp.tr.requestsForInterpretation),
              SizedBox(height: 1.h),
              _buildTextField(currentLength),
              SizedBox(height: 4.h),
              _buildAttachmentSection(),
              SizedBox(height: 1.h),
              _buildSelectedFilesSection(),
              SizedBox(height: 4.h),
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.TextBlack,
      ),
    );
  }

  Widget _buildSubtitleText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.TextBlack,
      ),
    );
  }

  Widget _buildTextField(int currentLength) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.lightColor),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
        child: Form(
          key: widget.interpretationRulingCubit!.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: MyApp.tr.writeHere,
                  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGray),
                  border: InputBorder.none,
                ),
                cursorColor: AppColors.selectedTextTab,
                controller:
                widget.interpretationRulingCubit!.interpretationController,
                onChanged: (value) {
                  setState(() {
                    if (currentLength >
                        widget.interpretationRulingCubit!.maxLength) {
                      widget.interpretationRulingCubit!.interpretationController
                          .text =
                          widget.interpretationRulingCubit!
                              .interpretationController.text
                              .substring(
                              0, widget.interpretationRulingCubit!.maxLength);
                      widget.interpretationRulingCubit!.interpretationController
                          .selection =
                          TextSelection.fromPosition(TextPosition(
                              offset: widget
                                  .interpretationRulingCubit!.maxLength));
                    }
                  });
                },
                keyboardType: TextInputType.text,
                maxLines: null,
                minLines: 7,
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Text(
                  "${widget.interpretationRulingCubit!.maxLength} / $currentLength",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.textTitleLightGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttachmentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(MyApp.tr.attachments,
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.TextBlack)),
            SizedBox(width: 1.w),
            Text("*",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.forthBlue)),
          ],
        ),
        SizedBox(height: 2.h),
        InkWell(
          onTap: () async {
            await widget.interpretationRulingCubit!.pickFiles();
            if (widget.interpretationRulingCubit!.result != null) {
              List<File> files = widget.interpretationRulingCubit!.result!.paths
                  .map((path) => File(path!))
                  .toList();
              await widget.interpretationRulingCubit?.uploadFile(
                uploadFileRequest: UploadFileRequest(
                  Id: "00000000-0000-0000-0000-000000000000",
                  Files: files,
                ),
              );
              widget.interpretationRulingCubit!.ids = widget
                  .interpretationRulingCubit!.uploadFileResponse
                  .orEmpty()
                  .map((e) => e.id.toString())
                  .toList();

              setState(() {}); // Trigger UI update
            }
          },
          child: DottedBorder(
            borderType: BorderType.Rect,
            color: AppColors.selectedTextTab,
            strokeWidth: 2,
            dashPattern: const [6, 8],
            child: Container(
              color: const Color(0xffe5e9ef),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              width: double.infinity,
              child: Row(
                children: [
                  Image(image: AssetImage(AppAssets.bgDownload)),
                  SizedBox(width: 5.w),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: MyApp.tr.dragAndDropTheFileHereOr,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 9.sp,
                              color: const Color(0xff4D4D4D)),
                        ),
                        TextSpan(
                          text: MyApp.tr.chooseFile,
                          style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.selectedTextTab),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          "${MyApp.tr.supportedFormats}: pdf, docx, excel, png, jpg",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 10.sp,
              color: AppColors.unSelectedTextTab),
        ),
      ],
    );
  }

  Widget _buildSelectedFilesSection() {
    final cubit = widget.interpretationRulingCubit!;

    if (cubit.result == null || cubit.result!.files.isEmpty) {
      return const SizedBox();
    }

    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: InkWell(
            onTap: () {
              setState(() {
                cubit.result = null; // Clear the selected files
                cubit.ids?.clear(); // Clear the uploaded file IDs
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
              decoration: BoxDecoration(
                color: AppColors.selectedTextTab,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete_forever_outlined, size: 12.sp, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 1.h),
        ...cubit.result!.files.map((file) {
          String? extension = cubit.getFileExtension(file.name);
          String? filePath = file.path;

          bool isImage(String? extension) {
            return extension == 'png' || extension == 'jpg' || extension == 'jpeg';
          }

          String getFileAsset(String? extension) {
            switch (extension?.toLowerCase()) {
              case "docx":
                return AppAssets.bgDocx;
              case "pdf":
                return AppAssets.bgPdf;
              case "xls":
                return AppAssets.bgXls;
              default:
                return AppAssets.bgPng;
            }
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              width: double.infinity * 0.5,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffe5e9ef),
                border: Border.all(color: AppColors.selectedTextTab),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (filePath != null && isImage(extension))
                    Image.file(
                      File(filePath),
                      width: 17.w,
                      height: 10.h,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    )
                  else
                    Image(
                      width: 17.w,
                      height: 10.h,
                      fit: BoxFit.contain,
                      image: AssetImage(getFileAsset(extension)),
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  SizedBox(height: 1.h),
                  Text(
                    file.name,
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: DefaultButton(
            radius: 30,
            firstGradientColor: Colors.white,
            secondGradientColor: Colors.white,
            title: MyApp.tr.cancellation,
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            textColor: AppColors.selectedTextTab,
            onTap: () {
              setState(() {
                widget.interpretationRulingCubit!.result = null; // Clear the selected files
                widget.interpretationRulingCubit!.ids?.clear(); // Clear the uploaded file IDs
              });
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(width: 3.w),
        Expanded(
          flex: 2,
          child: DefaultButton(
            radius: 30,
            firstGradientColor: AppColors.selectedTextTab,
            secondGradientColor: AppColors.selectedTextTab,
            title: MyApp.tr.send,
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            textColor: Colors.white,
            onTap: () {
              Navigator.pop(
                  context,
                  widget.interpretationRulingCubit?.executeAddArbitrationRequest(
                      arbitrationRequestModel: ArbitrationRequestModel(
                          litigationRequestId: widget.litigationRequestId,
                          litigationRequestArbitrationReportExplanationRequestFiles:
                          widget.interpretationRulingCubit!.ids,
                          explanationRequests: widget
                              .interpretationRulingCubit!
                              .interpretationController
                              .text)));
            },
          ),
        ),
      ],
    );
  }
}
