import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reac/app/extensions.dart';

import '../../app/app_colors.dart';
import 'utils.dart';

class TextFormFieldWithTitleWidget extends StatefulWidget {
  final String title;
  final String hintText;
  final String errorText;
  final bool isPassword;
  final bool hasIcon;
  final Widget? icon;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Function? onSubmitted;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final bool? isPhone;

  const TextFormFieldWithTitleWidget({
    Key? key,
    this.keyboardType = TextInputType.text,
    required this.title,
    required this.hintText,
    required this.errorText,
    required this.isPassword,
    required this.hasIcon,
    this.isPhone = false,
    this.icon,
    this.onSubmitted,
    this.focusNode,
    this.textInputAction,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextFormFieldWithTitleWidget> createState() =>
      _TextFormFieldWithTitleWidgetState();
}

class _TextFormFieldWithTitleWidgetState
    extends State<TextFormFieldWithTitleWidget> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildInputTitle(title: widget.title),
        SizedBox(height: 2.h),
        buildTextFormFieldWithTitle(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            hintText: widget.hintText,
            errorText: widget.errorText,
            isPassword: widget.isPassword,
            hasIcon: widget.hasIcon,
            textFieldAction: widget.textInputAction,
            focusNode: widget.focusNode,
            onSubmitted: widget.onSubmitted,
            isPhone: widget.isPhone,
            icon: widget.icon),
      ],
    );
  }

  Widget buildTextFormFieldWithTitle(
      {required String errorText,
      required String hintText,
      var icon,
      var textFieldAction,
      required bool isPassword,
      required bool hasIcon,
      var focusNode,
      var onSubmitted,
      var isPhone,
      required TextInputType keyboardType,
      required var controller}) {
    return Stack(
      children: [
        buildInputFieldShadow(),
        Container(
          color: AppColors.white,
          child: TextFormField(
            cursorColor: AppColors.mainColor,
            controller: controller,
            keyboardType: keyboardType,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorText;
              }
              if (isPhone == true) {
                if (!value.startsWith('05')) {
                  return 'رجاء ادخال رقم هاتف سعودى يبدا ب 05xxxxxxxx';
                }
                if (value.length < 10) {
                  return 'رجاء ادخال رقم هاتف صحيح يتكون من 10 ارقام';
                }
              }
              return null;
            },
            inputFormatters: isPhone
                ? [
                    LengthLimitingTextInputFormatter(10),
                  ]
                : [],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              focusedBorder:
                  buildOutlineInputBorderWithColor(color: AppColors.mainColor),
              enabledBorder:
                  buildOutlineInputBorderWithColor(color: AppColors.grayColor7),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              prefixIcon: hasIcon ? icon : null,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: AppColors.greyStrings,
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w400),
              suffixIcon: isPassword
                  ? Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.grayColor6,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                    )
                  : null,
            ),
            focusNode: focusNode,
            onFieldSubmitted: onSubmitted,
            textInputAction: textFieldAction,
            obscureText: isPassword == true ? !passwordVisible : false,
          ),
        ),
      ],
    );
  }
}
