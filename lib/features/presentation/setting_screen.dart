import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reac/app/app_assets.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/app/helpers/flash_toast_helper.dart';
import 'package:reac/features/presentation/widgets/custom_text_form_field.dart';
import 'package:reac/features/presentation/widgets/done_container.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../app/app_colors.dart';
import '../../app/constants.dart';
import '../../app/custom_bottom_sheet.dart';
import '../../app/default_button.dart';
import '../../app_cubit.dart';
import '../../design/widget/language_direction.dart';
import '../../my_app.dart';
import 'auth_screens/change_password/change_password.dart';
import 'auth_screens/widgets.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
 static const String id="SettingScreen";
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  void _togglePasswordVisibility(bool current, bool newPass, bool confirm) {
    setState(() {
      if (current) _obscureCurrentPassword = !_obscureCurrentPassword;
      if (newPass) _obscureNewPassword = !_obscureNewPassword;
      if (confirm) _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(context,MyApp.tr.setting),
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 3.h),
            children: [
              _buildSettingItem(
                onTap: _showChangePasswordBottomSheet,
                leading: AppAssets.icLock,
                title: MyApp.tr.changePassword,
                trailing: AppAssets.icBlueArrow,
              ),
              _buildSettingItem(
                onTap: () {
                  setState(() {
                    var cubit = AppCubit.get(context);

                    AppCubit.get(context).isArSelected? cubit.changeLang(
                        Constants.enLanguage):cubit.changeLang(
                        Constants.arLanguage);
                  });
                },
                leading: AppAssets.icLanguageBlue,
                title:AppCubit.get(context).isArSelected? MyApp.tr.changeToEnglish:MyApp.tr.changeToArabic,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required Function() onTap,
    required String leading,
    required String title,
    String? trailing,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.appsecondWhite,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: SvgPicture.asset(leading),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: AppColors.TextBlack,
            ),
          ),
          trailing: trailing != null ? LanguageDirection(child: SvgPicture.asset(trailing)) : null,
        ),
      ),
    );
  }

  void _showChangePasswordBottomSheet() {
    CustomBottomSheet.show(
      isClose: false,
      context,
      child: StatefulBuilder(
        builder: (BuildContext context, void Function(void Function()) setState) {
          return ChangePasswordContent(
            currentPasswordController: currentPasswordController,
            newPasswordController: newPasswordController,
            confirmNewPasswordController: confirmNewPasswordController,
            obscureCurrentPassword: _obscureCurrentPassword,
            obscureNewPassword: _obscureNewPassword,
            obscureConfirmPassword: _obscureConfirmPassword,
            onToggleVisibility: (bool current, bool newPass, bool confirm) {
              setState(() {
                _togglePasswordVisibility(current, newPass, confirm);
              });
            },
          );
        },
      ),
    );
  }

}

