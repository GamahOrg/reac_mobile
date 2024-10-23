import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/extensions.dart';

import '../../../app/app_assets.dart';
import '../../../app/default_button.dart';
import '../../../my_app.dart';
import '../widgets/custom_text_form_field.dart';
import 'widgets.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  static const String id = "ChangePassword";
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(image: AssetImage(AppAssets.bgLoginShape)),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 7.h,
                        ),
                        Center(
                            child: Image(
                                image: AssetImage(AppAssets.bgLoginLogo))),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(MyApp.tr.changePassword,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.selectedTextTab,
                            )),
                        SizedBox(
                          height: 3.h,
                        ),
                        newPassword(),
                        SizedBox(
                          height: 4.h,
                        ),
                        confirmPassword(),
                        SizedBox(
                          height: 10.h,
                        ),
                        DefaultButton(
                          onTap: () {},
                          firstGradientColor: AppColors.selectedTextTab,
                          secondGradientColor: AppColors.selectedTextTab,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.white,
                          title: MyApp.tr.sure,
                          width: double.infinity,
                          height: 6.h,
                          radius: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column newPassword() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              MyApp.tr.newPassword,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                  color: AppColors.TextBlack),
            ),
            SizedBox(
              width: 0.5.h,
            ),
            requiredSymbolInputWidget()
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        CustomTextFormField(
          textInputAction: TextInputAction.next,
          validator: (value){},
          controller: newPasswordController,
          hinText: MyApp.tr.writeNewPassword,
          borderColorFocused: AppColors.selectedTextTab,
          borderRadiusFocused: 50,
          borderColorEnable: const Color(0xffE6E7EC),
          borderRadiusEnable: 50,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
          hinTextColor: AppColors.lightGray,
          textInputType: TextInputType.text,
          suffixIcon: InkWell(
              onTap: () {
                newPasswordController.clear();
              },
              child: SvgPicture.asset(AppAssets.icCloseCircle,
                  fit: BoxFit.scaleDown)),
        ),
      ],
    );
  }

  Column confirmPassword() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              MyApp.tr.confirmPassword,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                  color: AppColors.TextBlack),
            ),
            SizedBox(
              width: 0.5.h,
            ),
            requiredSymbolInputWidget()
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        CustomTextFormField(
          textInputAction: TextInputAction.done,
          controller: confirmNewPassword,
          hinText: MyApp.tr.confirmPassword,
            borderColorEnable: AppColors.reqStringsColor,
            borderRadiusEnable: 50,
          borderRadiusFocused: 50,
          borderColorFocused: AppColors.selectedTextTab,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
          hinTextColor: AppColors.lightGray,
          textInputType: TextInputType.text,
          suffixIcon: InkWell(
              onTap: () {
                confirmNewPassword.clear();
              },
              child: SvgPicture.asset(AppAssets.icCloseCircle,
                 fit: BoxFit.scaleDown)), validator: (String?value ) {  },
        ),
      ],
    );
  }
}
