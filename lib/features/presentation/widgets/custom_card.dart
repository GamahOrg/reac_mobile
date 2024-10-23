import 'package:flutter/material.dart';
import 'package:reac/app/app_assets.dart';
import 'package:reac/app/default_button.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/features/presentation/scalpel_model_screen.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Function() onButtonTap;

  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Color(0xffE4E9F2)),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
              blurRadius:0.5,
              spreadRadius: 1,
              offset: Offset(0,1),
              color: Color(0xfff2f2f2)
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image(image: AssetImage(AppAssets.icClaimsInfo)),
              SizedBox(width: 2.w,),
              Text(
                title,
                style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff61686B)),
              ),
            ],
          ),
          SizedBox(height: 0.8.h),
          Text(
            description,
            style: TextStyle(
                fontSize: 9.sp,
                color: const Color(0xff61686B),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 3.h),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: DefaultButton(
              fontSize:10.sp ,
              height: 5.h,
              width: 35.w,
              radius: 50,
              firstGradientColor: const Color(0xff002F56),
              secondGradientColor: const Color(0xff002F56),
              fontWeight:FontWeight.w700 ,
              onTap:onButtonTap,
              title:
                buttonText,
            ),
          )
        ],
      ),
    );
  }
}
