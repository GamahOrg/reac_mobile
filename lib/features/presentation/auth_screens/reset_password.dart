import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/default_button.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/features/presentation/auth_screens/verify_login_gulf.dart';
import 'package:reac/my_app.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../app/app_assets.dart';
import '../widgets/custom_text_form_field.dart';
class ResetPassword extends StatelessWidget {
   ResetPassword({super.key});
static const String id="ResetPassword";
TextEditingController identityNumberrController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(image: AssetImage(AppAssets.bgLoginShape)),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height,
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                  height: 7.h,
                ),
                  Center(child: Image(image: AssetImage(AppAssets.bgLoginLogo))),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(MyApp.tr.passwordRecovery,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.selectedTextTab,
                      )),
                  SizedBox(
                    height: 3.h,
                  ),
                  identityNumber(),
                  SizedBox(
                    height: 15.h,
                  ),
                  DefaultButton(onTap: (){
                    Navigator.pushNamed(context, VerifyLoginGulfScreen.id,arguments: "ChangePassword");
                  },title:MyApp.tr.verification ,fontSize:11.sp ,fontWeight: FontWeight.w500,firstGradientColor:AppColors.selectedTextTab,secondGradientColor:AppColors.selectedTextTab ,radius: 50,width: double.infinity,)
                ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Column identityNumber() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              MyApp.tr.idNumber,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                  color: AppColors.TextBlack),
            ),
            SizedBox(
              width: 0.5.h,
            ),
            gradientText()
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        CustomTextFormField(
          controller: identityNumberrController,
          hinText: MyApp.tr.writeIdNumber,
          borderRadiusEnable: 50,
          borderColorFocused: AppColors.selectedTextTab,
           borderColorEnable: Color(0xffE6E7EC),
          borderRadiusFocused: 50,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
          hinTextColor: AppColors.lightGray,
          textInputType: TextInputType.number,
          suffixIcon: InkWell(
              onTap: () {
                identityNumberrController.clear();
              },
              child: SvgPicture.asset(AppAssets.icCloseCircle,
                  fit: BoxFit.scaleDown)),
        ),
      ],
    );
  }

  GradientText gradientText() {
    return GradientText(
            "*",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            colors: const [
              AppColors.darkBlue,
              AppColors.lightBlue,
              AppColors.thirdBlue
            ],
          );
  }
}
