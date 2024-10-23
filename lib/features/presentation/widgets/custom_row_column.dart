import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/app_assets.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';

import '../../../app/app_colors.dart';

class CustomRowColumn extends StatelessWidget {
   CustomRowColumn({
    super.key,
    this.icon,
    this.label,
    this.values,this.isIcon=true

  });
  final String? icon;
  final String? label;
  final List<String>? values;
  bool isIcon=true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h, right:8,left:8),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Divider(
              height: 1,
              color: AppColors.dividerColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isIcon? SvgPicture.asset(AppAssets.icBook2):SizedBox(),
              SizedBox(width: 1.5.w),
              if (label != null)
                Expanded(
                  child: Text(
                    label!,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: const Color(0xff14151A)
                    ),
                  ),
                ),
            ],
          ),
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color:const Color(0xffF4F5F9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
                          child: Text(
                            values![index],
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff0F1324).withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
              itemCount:  values?.length??0,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height:2.h,);
            },),
        ],
      ),
    );
  }
}
