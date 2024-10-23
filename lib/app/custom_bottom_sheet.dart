import 'package:flutter/material.dart';
import 'package:reac/app/extensions.dart';

import '../design/widget/bottom_sheet_container.dart';
import 'app_colors.dart';

bool isClose = true;

class CustomBottomSheet {
  static Future<dynamic> show(BuildContext context,
      {required Widget child,
      required bool isClose,
      bool isBlur = true,
      Color? backgroundColor}) async {
    return await showModalBottomSheet(
      isScrollControlled: true,
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        maxWidth: double.infinity,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => BottomSheetContainer(
        padding: EdgeInsets.symmetric(vertical: 0.01.h),
        backgroundColor: backgroundColor,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: isClose == true ? _buildUpper(context) : const Center(),
              ),
              Container(
                  constraints: BoxConstraints(maxHeight: 92.h, minHeight: 10.h),
                  child: child),
            ]),
      ),
    );
  }

  static _buildUpper(context) {
    return SizedBox(
      // color: Colors.green,
      width: double.infinity,
      child: Stack(
        children: [
          // Container(margin: EdgeInsets.symmetric(horizontal: 10.w)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 2.h),
              width: 18.w,
              height: 1.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.grayLight),
            ),
          ),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: _buildCloseButton(context)),
        ],
      ),
    );
  }

  static Widget _buildCloseButton(context) {
    return SizedBox(
      width: 8.w,
      height: 8.w,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close),
        // SvgPicture.asset(
        //   AppAssets.icClose,
        //   width: 8.w,
        //   height: 8.w,
        // ),
      ),
    );
  }
}
