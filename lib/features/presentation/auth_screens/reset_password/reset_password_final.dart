import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/features/presentation/auth_screens/reset_password/reset_password_cubit.dart';
import 'package:reac/features/presentation/auth_screens/reset_password/reset_password_state.dart';

import '../../../../app/app_assets.dart';
import '../../../../app/default_button.dart';
import '../../../../my_app.dart';
import '../../widgets/custom_text_form_field.dart';
import '../login/login_state.dart';
import '../widgets.dart';

class ResetPasswordFinal extends StatelessWidget {
  ResetPasswordFinal({super.key});

  static const String id = "ResetPasswordFinal";
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final resetPasswordCubit = getIt<ResetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => resetPasswordCubit,
      child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 5.w),
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
                                      image:
                                          AssetImage(AppAssets.bgLoginLogo))),
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
                              loginTextEditing(
                                  MyApp.tr.newPassword,
                                  MyApp.tr.writeNewPassword,
                                  false,
                                  newPasswordController,
                                  false ,
                                  resetPasswordCubit.state.message ?? "",TextInputAction.next,
                                  validate: (value){
                                return   resetPasswordCubit.validateNewPassword(value);
                              }),
                              SizedBox(
                                height: 4.h,
                              ),
                              loginTextEditing(
                                  MyApp.tr.confirmPassword,
                                  MyApp.tr.confirmPassword,
                                  false,
                                  confirmNewPassword,
                                  false,
                                  resetPasswordCubit.state.message ?? "",TextInputAction.done,
                                  validate: (value){
                                return   resetPasswordCubit.validatePasswordAndConfirmation(value,newPasswordController);

                              }),
                              SizedBox(
                                height: 10.h,
                              ),
                              DefaultButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                  }
                                },
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
                Image(image: AssetImage(AppAssets.bgLoginShape)),
              ],
            ),
          );
        },
      ),
    );
  }

}
