import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/extensions.dart';
import '../../../../app/app_assets.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/default_button.dart';
import '../../../../app/helpers/flash_toast_helper.dart';
import '../../../../my_app.dart';
import '../../widgets/custom_text_form_field.dart';
import '../widgets.dart';
class ChangePasswordContent extends StatelessWidget {
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmNewPasswordController;
  final bool obscureCurrentPassword;
  final bool obscureNewPassword;
  final bool obscureConfirmPassword;
  final Function(bool, bool, bool) onToggleVisibility;

  ChangePasswordContent({
    super.key,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.confirmNewPasswordController,
    required this.obscureCurrentPassword,
    required this.obscureNewPassword,
    required this.obscureConfirmPassword,
    required this.onToggleVisibility,
  });
  final GlobalKey<FormState> _key=GlobalKey();
  String currentPassword="password12";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        child: StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setState) {
            return Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(MyApp.tr.changePassword),
                  SizedBox(height: 3.h),
                  _buildPasswordField(
                    validator:  (value) {
                      if (value == null || value.isEmpty) {
                        return MyApp.tr.pleaseEnterTheRequiredData;
                      }
                      if(value!=currentPassword){{
                        return MyApp.tr.theCurrentPasswordIsIncorrect;
                      }}
                    },
                    title: MyApp.tr.currentPassword,
                    controller: currentPasswordController,
                    obscureText: obscureCurrentPassword,
                    onTap: () => onToggleVisibility(true, false, false),
                  ),
                  SizedBox(height: 4.h),
                  _buildPasswordField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return MyApp.tr.pleaseEnterTheRequiredData;
                      }
                      bool hasLetter = value.contains(RegExp(r'[A-Za-z]'));
                      bool hasNumber = value.contains(RegExp(r'[0-9]'));
                      if (value.length < 8||!hasLetter || !hasNumber) {
                        return MyApp.tr.thePasswordMustContainLettersAndNumbers;
                      }
                      return null;
                    },
                    title: MyApp.tr.newPassword,
                    controller: newPasswordController,
                    obscureText: obscureNewPassword,
                    onTap: () => onToggleVisibility(false, true, false),
                  ),
                  SizedBox(height: 4.h),
                  _buildPasswordField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return MyApp.tr.pleaseEnterTheRequiredData;
                      }
                      bool hasLetter = value.contains(RegExp(r'[A-Za-z]'));
                      bool hasNumber = value.contains(RegExp(r'[0-9]'));
                      if (value.length < 8||!hasLetter || !hasNumber) {
                        return MyApp.tr.thePasswordMustContainLettersAndNumbers;
                      }
                      if(value !=newPasswordController.text)
                      {
                        return MyApp.tr.pleaseMatchThePasswordWithTheConfirmationPassword;
                      }
                      return null;
                    },
                    title: MyApp.tr.confirmNewPassword,
                    controller: confirmNewPasswordController,
                    obscureText: obscureConfirmPassword,
                    onTap: () => onToggleVisibility(false, false, true),
                  ),
                  SizedBox(height: 6.h),
                  _buildButtons(context),
                ],
              ),
            );
          },

        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.TextBlack,
      ),
    );
  }

  Widget _buildPasswordField({
    required String title,
    required TextEditingController controller,
    required bool obscureText,
    required final String? Function(String?) validator,
    required Function() onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
                color: AppColors.TextBlack,
              ),
            ),
            SizedBox(width: 0.5.h),
            requiredSymbolInputWidget(),
          ],
        ),
        SizedBox(height: 1.h),
        CustomTextFormField(
          validator:validator,
          obsureText: obscureText,
          maxLine: 1,
          controller: controller,
          hinText: title,
          borderRadiusEnable: 50,
          borderRadiusFocused: 50,
          borderColorFocused: AppColors.selectedTextTab,
          borderColorEnable:const Color(0xffE6E7EC) ,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
          hinTextColor: AppColors.lightGray,
          textInputType: TextInputType.text,
          suffixIcon: InkWell(
            onTap: onTap,
            child: SvgPicture.asset(AppAssets.icEyePassword, fit: BoxFit.scaleDown),
          ),
        ),
      ],
    );
  }


  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultButton(
            radius: 30,
            height: 6.h,
            firstGradientColor: AppColors.white,
            secondGradientColor: AppColors.white,
            title: MyApp.tr.cancellation,
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            textColor: AppColors.selectedTextTab,
            onTap: () => Navigator.pop(context),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          flex: 2,
          child: DefaultButton(
            radius: 30,
            height: 6.h,
            firstGradientColor: AppColors.selectedTextTab,
            secondGradientColor: AppColors.selectedTextTab,
            title: MyApp.tr.changePassword,
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            textColor: Colors.white,
            onTap: () {
              if(_key.currentState!.validate()){
                Navigator.pop(context);
                FlashToastHelper.showSuccessToast(context: context, content: "Success");
              }
            },
          ),
        ),
      ],
    );
  }
}
