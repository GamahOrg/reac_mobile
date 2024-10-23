import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';

class CustemTextSpan extends StatelessWidget {
  const CustemTextSpan(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.onTap,
      this.attempt});

  final String firstText, secondText;
  final Function()? onTap;
  final int? attempt;

  @override
  Widget build(BuildContext context) {
    return attempt! >= 3
        ? Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text.rich(TextSpan(
                  text: firstText,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 9.sp,
                      color: const Color(0xff0D112666).withOpacity(0.40)),
                  children: <InlineSpan>[
                    TextSpan(
                      text: secondText,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 9.sp,
                        color: const Color(0xff002F56),
                      ),
                      recognizer: TapGestureRecognizer()..onTap = onTap,
                    ),
                  ],
                )),
              ),
            ],
          )
        : SizedBox();
  }
}
