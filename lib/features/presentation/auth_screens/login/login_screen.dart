import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reac/app/app_assets.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/app_enums.dart';
import 'package:reac/app/default_button.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/features/presentation/auth_screens/login/login_cubit.dart';
import 'package:reac/features/presentation/auth_screens/login/login_state.dart';
import 'package:reac/features/presentation/auth_screens/reset_password/reset_password.dart';
import 'package:reac/features/presentation/home/claims_screen.dart';
import 'package:reac/features/presentation/widgets/custom_drop_down_button_text_field.dart';
import 'package:reac/my_app.dart';

import '../../../../app/helpers/flash_toast_helper.dart';
import '../widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String id = "LoginCitizenScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  IdentityType? identityTypeSelect;
  GlobalKey formKey = GlobalKey<FormState>();
  final myCubit = getIt<LoginCubit>();
  String? selectedVal;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => myCubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          if (state is ErrorState) {
            FlashToastHelper.showErrorToast(
                context: context, content: state.error.toString());
            setState(() {});
          }
          if (state is SuccessState) {
            if (identityTypeSelect == IdentityType.citizen) {
              Navigator.pushNamed(context, ClaimsScreen.id);
            } else {
              Navigator.pushNamed(context, ClaimsScreen.id, arguments: "login");
            }
          }
        }, builder: (context, state) {
          return SingleChildScrollView(
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Image(image: AssetImage(AppAssets.bgLoginShape)),
              SizedBox(height: 101.h, child: pageContent()),
            ]),
          );
        }),
      ),
    );
  }

  Widget pageContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
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
                      child: Image(image: AssetImage(AppAssets.bgLoginLogo))),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(MyApp.tr.logInToYourAccount,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.selectedTextTab,
                      )),
                  SizedBox(
                    height: 3.h,
                  ),
                  identityType(),
                  SizedBox(
                    height: 4.h,
                  ),
                  loginTextEditing(
                      MyApp.tr.idNumber,
                      MyApp.tr.writeIdNumber,
                      false,
                      identityNumberController,
                      myCubit.state is InvalidIdentity,
                      myCubit.state.message ?? "",
                      TextInputAction.next),
                  identityTypeSelect == IdentityType.gulf
                      ? Column(
                          children: [
                            SizedBox(
                              height: 4.h,
                            ),
                            loginTextEditing(
                                MyApp.tr.password,
                                MyApp.tr.writePassword,
                                true,
                                passwordController,
                                myCubit.state is PasswordError,
                                myCubit.state.message ?? "",
                                TextInputAction.done),
                          ],
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: 8.h,
                  ),
                  DefaultButton(
                    onTap: () {
                      if (identityTypeSelect == IdentityType.gulf) {
                        myCubit.login(identityNumberController.text, "123456",
                            identityTypeSelect);
                      } else {
                        myCubit.login(identityNumberController.text, "123456",
                            identityTypeSelect);
                      }
                    },
                    firstGradientColor: AppColors.selectedTextTab,
                    secondGradientColor: AppColors.selectedTextTab,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.white,
                    isCircular: true,
                    widget: myCubit.state is LoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColors.white,
                          ))
                        : identityTypeSelect == IdentityType.gulf
                            ? Text(
                                MyApp.tr.login,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                MyApp.tr.verification,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                    width: double.infinity,
                    height: 6.h,
                    radius: 50,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  identityTypeSelect == IdentityType.gulf
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                MyApp.tr.forgetPassword,
                                style: TextStyle(
                                    color: Color(0X660D1126),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ResetPassword.id);
                                  },
                                  child: Text(
                                    MyApp.tr.resetPassword,
                                    style: TextStyle(
                                      color: Color(0XFF002F56),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0XFF002F56),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column identityType() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              MyApp.tr.identityType,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                  color: AppColors.TextBlack),
            ),
            SizedBox(
              width: 0.5.w,
            ),
            requiredSymbolInputWidget()
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        CustomDropdownButtonFormField(
          value: selectedVal,
          items: [MyApp.tr.citizen, MyApp.tr.gulf],
          hintText: MyApp.tr.chooseIdentifyType,
          suffixIconPath: AppAssets.icArrowDown1,
          onChanged: (val) {
            if (val == MyApp.tr.gulf) {
              identityTypeSelect = IdentityType.gulf;
            } else {
              identityTypeSelect = IdentityType.citizen;
            }
            setState(() {});
            selectedVal = val;
            print(val);
          },
          radius: 50,
          borderColor: AppColors.lightColor,
        ),
        Visibility(
          visible: myCubit.state is InvalidType,
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(myCubit.state.message ?? "",
                  style: const TextStyle(color: Colors.red, fontSize: 12)),
            ),
          ),
        )
      ],
    );
  }
}
