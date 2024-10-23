import 'package:flutter/material.dart';
import 'package:reac/app/extensions.dart';

import 'app_colors.dart';


class AppTextStyle {
  static const String mainArFont = 'REGA';

  static TextStyle get hintTextStyle => const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: AppColors.textHintColor);

  static TextStyle get hintSmallTextStyle => TextStyle(
      fontSize: 10.0.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.textHintColor);

  static TextStyle get headline1 =>
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold);

  static TextStyle get headline2 =>
      TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.bold);

  static TextStyle get appBarTitleStyle =>
      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600,height: 1.5);

  static TextStyle get normal =>
      TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.w600, height: 1.5);

  static TextStyle get listTextStyle =>
      TextStyle(fontSize: 8.5.sp, fontWeight: FontWeight.w600);

  static TextStyle get reqListTextStyle => TextStyle(
      fontSize: 10.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.reqStringsColor);

  static TextStyle get reqTitles =>
      const TextStyle(color: AppColors.greyStrings);

  static TextStyle get tabParTextStyle => TextStyle(
      fontSize: 10.sp, fontFamily: mainArFont, fontWeight: FontWeight.bold);



  static const TextStyle  appTextStyle1 = TextStyle(fontSize: 15, fontWeight: FontWeight.w600,height: 1.5, color: Colors.white);

  static const TextStyle  appTextStyle2 = TextStyle(fontSize: 15, fontWeight: FontWeight.w600,height: 1.5, color: Colors.white);

  static const TextStyle appCardTitleStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: 14,);

  static const TextStyle appCardSubTitleStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 12,);

}

