import 'package:flutter/material.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app_cubit.dart';
import 'package:reac/my_app.dart';
import '../../../app/app_assets.dart';

class VerifyLoginScreen extends StatelessWidget {
  const VerifyLoginScreen({super.key});

  static const String id = "VerifyLoginCitizenScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(image: AssetImage(AppAssets.bgLoginShape)),
          Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height,
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    Center(
                        child: Image(image: AssetImage(AppAssets.bgLoginLogo))),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      MyApp.tr
                          .pleaseOpenTheApplicationAndConfirmTheRequestByChoosingTheNumber,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 11.sp,
                          color: AppColors.selectedTextTab),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Center(
                      child: Container(
                        width: 27.w,
                        padding: EdgeInsets.symmetric(vertical: 0.7.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1, color: AppColors.lightGray)),
                        child: Text(
                          AppCubit.get(context).isArSelected
                              ? "13".toFarsi()
                              : "13",
                          style: TextStyle(
                              fontSize: 34.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.selectedTextTab),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
