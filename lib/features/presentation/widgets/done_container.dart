import 'package:flutter/material.dart';
import 'package:reac/app/extensions.dart';
import '../../../app/app_assets.dart';
import '../../../app/constants.dart';

class DoneContainer extends StatelessWidget {
  const DoneContainer({
    super.key,
    this.image,
    this.firstText,
    this.secondText,
  });

  final String? image;
  final String? firstText;
  final String? secondText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (image != null) Image(image: AssetImage(image??AppAssets.bgSuccess)),
          SizedBox(height: 2.h,width: 100.w,),
          if (firstText != null)
            Text(
              firstText!,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xff222325),
              ),
              textAlign: TextAlign.center,
            ),
          SizedBox(height: 1.h),
          if (secondText != null)
            Text(
              secondText!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff61686B),
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
