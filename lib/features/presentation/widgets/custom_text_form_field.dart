import 'package:flutter/material.dart';
import 'package:reac/app/extensions.dart'; // Assuming this contains helper extensions for padding/sizing
import '../../../app/app_colors.dart'; // Assuming this contains your custom color palette

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hinText,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.hinTextColor,
    this.borderRadiusEnable,
    this.borderColorEnable,
    this.textInputType,
    this.suffixIcon,
    this.validator,
    this.prefixIcon,
    this.obsureText = false,
    this.controller,
    this.borderRadiusFocused,
    this.borderColorFocused,
    this.maxLine = 1,
    this.onFieldSubmitted,
    this.textInputAction,
    this.contentPadding,
  });

  final String? hinText;
  final double? fontSize;
  final int? maxLine;
  final TextInputAction? textInputAction;
  final FontWeight? fontWeight;
  final bool? obsureText;
  final Color? hinTextColor;
  final double? borderRadiusEnable;
  final double? borderRadiusFocused;
  final TextInputType? textInputType;
  final Color? borderColorEnable;
  final Color? borderColorFocused;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final EdgeInsets? contentPadding; // New: Added to allow custom padding
  final ValueChanged<String?>? onFieldSubmitted; // Updated type

  @override
  Widget build(BuildContext context) {
    assert(
    !(obsureText! && maxLine! > 1),
    'Obscure text cannot have multiple lines.',
    ); // Added assertion for validation

    return TextFormField(
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: textInputType,
      maxLines: obsureText == true ? 1 : maxLine,
      controller: controller,
      textInputAction: textInputAction,
      obscureText: obsureText ?? false,
      cursorColor: AppColors.selectedTextTab,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: borderColorEnable ?? const Color(0xffE6E7EC),
          ),
          borderRadius: BorderRadius.circular(borderRadiusEnable ?? 20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: borderColorFocused ?? AppColors.selectedTextTab,
          ),
          borderRadius: BorderRadius.circular(borderRadiusFocused ?? 20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(borderRadiusFocused ?? 20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(borderRadiusFocused ?? 20),
        ),
        hintText: hinText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: hinTextColor,
        ),
        contentPadding: contentPadding ?? EdgeInsets.symmetric(
          vertical: 1.4.h,
          horizontal: 5.w,
        ), // Use default padding if not provided
      ),
    );
  }
}
