import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/app_assets.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/extensions.dart';

import '../../../app/constants.dart';
class CustomRowDM{
  final String? startIcon;
  final String? label;
  final String? value;
  final String? lastIcon;
  final Color? valueColor;
  final String? lastIcon2;
  final Function()? onTap1;
  final Function()? onTap2;

  CustomRowDM({this.startIcon, this.label,
    this.value, this.lastIcon,this.valueColor,this.lastIcon2,this.onTap1,this.onTap2});

}
class CustomRow extends StatelessWidget {
  const CustomRow({super.key, this.dm});

  final CustomRowDM? dm;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h, left: 8, right: 8),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 22.0),
            child: Divider(
              height: 2,
              color: AppColors.dividerColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SvgPicture.asset(dm!.startIcon?? AppAssets.icHashtag),
              ),
                SizedBox(width: 1.5.w,),
              Expanded(
                  child: Text(dm!.label!,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 9.sp,
                          color: AppColors.darkPinputColor))),
              Text(
                dm!.value??"",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 9.sp,
                    color: dm?.valueColor==null?AppColors.pinputColor.withOpacity(0.6):dm!.valueColor),
              ),
              SizedBox(width: 2.5.w,),
              Visibility(
                visible: dm!.lastIcon!=null,
                child: InkWell(onTap: dm?.onTap1,child: SvgPicture.asset(dm!.lastIcon??AppAssets.icDocumentDownload)),
              ),
              SizedBox(width: 0.4.w,),
              Visibility(
                visible: dm!.lastIcon2!=null,
                child: InkWell(onTap: dm?.onTap2,child: SvgPicture.asset(dm!.lastIcon2??AppAssets.icDocumentDownload)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
