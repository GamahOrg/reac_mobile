import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reac/app/extensions.dart';
class CustomDropdownButtonFormField extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final String suffixIconPath;
  final ValueChanged<String?>? onChanged;
  final double? radius;
  final Color? borderColor;
  final FormFieldValidator<String>? validator;
  final String? value;
  const CustomDropdownButtonFormField({
    super.key,
    required this.items,
    required this.hintText,
    required this.suffixIconPath,
    this.onChanged,
    this.borderColor,
    this.radius,
    this.validator,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: borderColor != null
            ? Border.all(color: borderColor!)
            : Border.all(color: Colors.grey.shade200),
        borderRadius: radius != null
            ? BorderRadius.circular(radius!)
            : BorderRadius.circular(10),
        color: const Color(0xffffffff),
      ),
      child: DropdownButtonFormField<String>(
        validator: validator,
        value: value, // Use value here
        icon: const SizedBox.shrink(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 1.7.h, horizontal: 5.0.w),
          hintText: hintText,
          suffixIcon: SvgPicture.asset(
            suffixIconPath,
            fit: BoxFit.scaleDown,
          ),
          hintStyle: TextStyle(
            fontSize: 10.0.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xffA5AEB1),
          ),
          border: InputBorder.none,
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}













