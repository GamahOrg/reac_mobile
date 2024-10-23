import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reac/app/extensions.dart';

import '../../app/app_assets.dart';
import '../../app/app_colors.dart';
import '../../app/default_button.dart';
import '../../my_app.dart';
import 'text_form_field_w_title.dart';

class DialogueBottomSheet extends StatefulWidget {
  TextEditingController? textController;
  final String? icon;
  final String mainText;
  final String secondaryText;
  final String buttonTitle;
  final bool isGreen;
  final bool hasTextField;
  final Function() onButtonPressed;

  DialogueBottomSheet({
    Key? key,
    this.textController,
    required this.mainText,
    required this.secondaryText,
    required this.hasTextField,
    this.icon,
    required this.buttonTitle,
    required this.isGreen,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  State<DialogueBottomSheet> createState() => _DialogueBottomSheetState();
}

class _DialogueBottomSheetState extends State<DialogueBottomSheet> {
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 3.h),
        Image.asset(widget.icon == null ? AppAssets.icUserError : widget.icon!),
        SizedBox(height: 2.h),
        Text(widget.mainText,
            style: TextStyle(
                color: AppColors.black0A,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700)),
        SizedBox(height: 2.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          child: Text(
            widget.secondaryText,
            style: TextStyle(
                color: AppColors.black0A35,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp),
            textAlign: TextAlign.center,
          ),
        ),
        if (widget.hasTextField)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            child: Form(
              key: _formKey,
              child: TextFormFieldWithTitleWidget(
                onSubmitted: (value) {
                  if (_formKey.currentState!.validate()) {
                    widget.onButtonPressed();
                  }
                },
                isPassword: false,
                hintText: MyApp.tr.enterUserNameHere,
                errorText: MyApp.tr.plsEnterUserName,
                controller: widget.textController,
                title: MyApp.tr.userName,
                hasIcon: true,
                icon: SvgPicture.asset(AppAssets.icAccount,
                    fit: BoxFit.scaleDown),
              ),
            ),
          ),
        SizedBox(height: 3.h),
        buildBackButton(context),
        SizedBox(height: 2.h),
      ],
    );
  }

  DefaultButton buildBackButton(BuildContext context) {
    return DefaultButton(
      title: widget.buttonTitle,
      textColor: widget.isGreen ? AppColors.white : AppColors.mainColor,
      fontWeight: FontWeight.w700,
      width: 90.w,
      onTap: () {
        if (widget.hasTextField) {
          if (_formKey.currentState!.validate()) {
            widget.onButtonPressed();
          }
        } else {
          widget.onButtonPressed();
        }
      },
      firstGradientColor: widget.isGreen
          ? AppColors.buttonLightGreenGradient
          : AppColors.buttonBGGrey,
      secondGradientColor: widget.isGreen
          ? AppColors.buttonLightGreenGradient
          : AppColors.buttonBGGrey,
    );
  }
}
