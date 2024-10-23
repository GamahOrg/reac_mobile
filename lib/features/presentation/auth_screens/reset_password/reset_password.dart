import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/default_button.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/app/helpers/flash_toast_helper.dart';
import 'package:reac/features/presentation/auth_screens/reset_password/reset_password_cubit.dart';
import 'package:reac/features/presentation/auth_screens/reset_password/reset_password_state.dart';
import 'package:reac/features/presentation/auth_screens/verify_login_gulf.dart';
import 'package:reac/features/presentation/auth_screens/widgets.dart';
import 'package:reac/my_app.dart';

import '../../../../app/app_assets.dart';
import '../../../../app/state_render/state_render_impl.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  static const String id = "ResetPassword";

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final myCubit = getIt<ResetPasswordCubit>();

  TextEditingController identityNumberrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => myCubit,
        )
      ],
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is SuccessStateReset) {
            dPrint("success");
            WidgetsBinding.instance.addPostFrameCallback((_) {
              FlashToastHelper.showSuccessToast(
                  context: context, content: state.message.toString());
              Navigator.pushNamed(context, VerifyLoginGulfScreen.id,
                  arguments: "resetPassword");
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height,
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 5.w),
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
                            loginTextEditing(
                                MyApp.tr.idNumber,
                                MyApp.tr.writeIdNumber,
                                false,
                                identityNumberrController,
                                myCubit.state is InvalidIdentity,
                                myCubit.state.message ?? "",
                                TextInputAction.done),
                            SizedBox(
                              height: 15.h,
                            ),
                            DefaultButton(
                              onTap: () {
                                myCubit.execute(
                                    identityNumber:
                                        identityNumberrController.text);

                                // Navigator.pushNamed(context, VerifyLoginGulfScreen.id,arguments: "ChangePassword");
                              },
                              title: MyApp.tr.verification,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              firstGradientColor: AppColors.selectedTextTab,
                              secondGradientColor: AppColors.selectedTextTab,
                              radius: 50,
                              width: double.infinity,
                            )
                          ],
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
