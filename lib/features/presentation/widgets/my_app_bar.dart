import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/extensions.dart';

import '../../../app/app_assets.dart';
import '../../../my_app.dart';

class MyAppBar extends AppBar {
  MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            width: 40,
            height: 40,
            child: SvgPicture.asset(
              AppAssets.icBack,
            ),
          ),
        ),
      ),
      leadingWidth: 23.w,
      title: Text(
        MyApp.tr.caseDetails,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: const Color(0xffFFFFFF),
        ),
      ),
      centerTitle: true,
      toolbarHeight: MediaQuery.sizeOf(context).height * 0.11,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff03598D),
              Color(0xff002F56),
            ],
          ),
        ),
      ),
    );
  }
}
