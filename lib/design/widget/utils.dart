import 'package:flutter/material.dart';
import 'package:reac/app/extensions.dart';
import '../../app/app_colors.dart';

OutlineInputBorder buildOutlineInputBorderWithColor({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(9),
    borderSide: BorderSide(
      color: color ?? Colors.grey,
    ),
  );
}

Text buildInputTitle({required String title}) {
  return Text(
    title,
    style: TextStyle(
        color: AppColors.blackTextColor,
        fontWeight: FontWeight.w700,
        fontSize: 7.sp),
  );
}

Container buildGreySpacer() {
  return Container(
    height: 0.7.h,
    width: 15.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: AppColors.grayColor7,
    ),
  );
}

Container buildInputFieldShadow() {
  return Container(
    width: double.infinity,
    height: 5.h,
    margin: EdgeInsets.symmetric(vertical: 1.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(9),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(1, 3), // changes position of shadow
        ),
      ],
    ),
  );
}

Widget customDot(Color color) {
  return Container(
    width: 10,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    ),
  );
}
