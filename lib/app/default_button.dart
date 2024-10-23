import 'package:flutter/material.dart';
import 'package:reac/app/constants.dart';
import 'package:reac/app/extensions.dart';

import 'app_colors.dart';



// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  String? title;
  Widget? icon;
  bool? backIcon;
  Color? textColor, firstGradientColor, secondGradientColor, borderColor;
  double? radius;
  double? width;
  double? height;
  double? fontSize;
  FontWeight? fontWeight;
  Function()? onTap;
  Widget? widget;
  bool isCircular=false;

  DefaultButton(
      {super.key,
        this.title,
        this.widget,
        this.icon,
        this.isCircular=false,
         this.backIcon,
        required this.onTap,
        this.textColor = Colors.white,
        this.firstGradientColor = Colors.white,
        this.secondGradientColor = Colors.white,
        this.borderColor = AppColors.mainColor,
        this.radius,
        this.width,
        this.height,
        this.fontSize,
        this.fontWeight,
      });

  final double constWidth = 60.w;
  final double constHeight = 6.h;
  final double constRadius = 15;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? constHeight,
      width: width ?? constWidth,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            elevation: 0,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? constRadius)),side: BorderSide(width: 1,color: Color(0xff002F56))),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [firstGradientColor!, secondGradientColor!]),
              borderRadius: BorderRadius.circular(radius ?? constRadius)),
          child: Center(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: backIcon==true?8.w:1.w),
                    child:isCircular?widget: Text(
                      title.orEmpty(),
                      style: TextStyle(
                                color: textColor,
                                fontSize: fontSize ?? 11.sp,
                                fontWeight: fontWeight ?? FontWeight.w700),
                            textAlign: TextAlign.center,
                    ),
                  ),
                ),
                if(backIcon==true)...[
                  const Icon(Icons.arrow_forward,color: Colors.white,),
                  SizedBox(width: 3.w,)
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}