import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/default_button.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/features/presentation/auth_screens/login/login_screen.dart';
import 'package:reac/features/presentation/auth_screens/reset_password/reset_password_cubit.dart';
import 'package:reac/features/presentation/auth_screens/reset_password/reset_password_final.dart';
import 'package:reac/features/presentation/auth_screens/reset_password/reset_password_state.dart';
import 'package:reac/features/presentation/home/claims_screen.dart';
import 'package:reac/features/presentation/manager/verify_otp_cubit.dart';
import 'package:reac/features/presentation/manager/verify_otp_state.dart';
import 'package:reac/features/presentation/widgets/custom_pinput.dart';
import 'package:reac/features/presentation/widgets/custom_text_span.dart';
import 'package:reac/features/presentation/widgets/done_container.dart';
import 'package:reac/my_app.dart';
import '../../../app/app_assets.dart';
import '../../../app/di/di.dart';
import '../../../app/helpers/flash_toast_helper.dart';
import '../../../app/state_render/state_render_impl.dart';
import '../../domain/use_cases/verify_otp_usecase.dart';

class VerifyLoginGulfScreen extends StatefulWidget {
  String? isFromLoginScreen;

  VerifyLoginGulfScreen({super.key, this.isFromLoginScreen});

  static const String id = "VerifyLoginGulfScreen";

  @override
  State<VerifyLoginGulfScreen> createState() => _VerifyLoginGulfScreenState();
}

class _VerifyLoginGulfScreenState extends State<VerifyLoginGulfScreen> {
  final myCubit = getIt<VerifyOtpCubit>();
  final resetPassword = getIt<ResetPasswordCubit>();
  final defaultPinTheme = PinTheme(
    width: 15.w,
    height: 7.h,
    textStyle: TextStyle(
        fontSize: 11.sp,
        color: AppColors.pinputColor.withOpacity(0.60),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xffDEE0E3)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  GlobalKey formKey = GlobalKey<FormState>();
  int attempt = 0;
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => myCubit),
          BlocProvider(create: (context) => resetPassword)
        ],
        child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is SuccessStateReset) {
              FlashToastHelper.showSuccessToast(
                  context: context,
                  content: "ارسال الرقم السري المؤقت (OTP) الى رقم جوالك");
            }
          },
          child: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
            listener: (context, state) {
              if (state is SuccessState) {
                if (widget.isFromLoginScreen == "login") {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    successLoginDialog(context).then((_) {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        Navigator.pushReplacementNamed(
                          context,
                          ClaimsScreen.id,
                        );
                      });
                    });
                  });
                } else if (widget.isFromLoginScreen == "resetPassword") {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    FlashToastHelper.showSuccessToast(
                        context: context, content: "VerifyOtpSuccess");
                    Navigator.pushNamed(context, ResetPasswordFinal.id);
                  });
                } else {
                  // stateRenderImpl.render(state);
                }
              }
            },
            builder: (context, state) {
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
                                          image: AssetImage(
                                              AppAssets.bgLoginLogo))),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    MyApp.tr.mobileVerificationCodeOTP,
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.darkPinputColor),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    MyApp.tr
                                        .enterTheDigitCodeSentToYouViaTextMessageToYourNumber,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11.sp,
                                        color: AppColors.grayPinputColor),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    "966594367189+",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.selectedTextTab),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: CustomPinput(
                                        pinController: pinController,
                                        defaultPinTheme: defaultPinTheme,
                                        validator: (value) {},
                                      )),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Visibility(
                                    visible: myCubit.state is otpError,
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        child: Text(myCubit.state.message ?? "",
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 12)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  DefaultButton(
                                    onTap: () {
                                      myCubit.execute(VerifyOtpModel(
                                          newMobileNumber: "123456",
                                          otp: pinController.text));
                                    },
                                    title: MyApp.tr.sendOtp,
                                    firstGradientColor:
                                        AppColors.selectedTextTab,
                                    secondGradientColor:
                                        AppColors.selectedTextTab,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp,
                                    radius: 50,
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  resendOtp(context)
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
            },
          ),
        ));
  }

  CustemTextSpan resendOtp(BuildContext context) {
    return CustemTextSpan(
        attempt: myCubit.attempt,
        firstText: MyApp.tr.havenotReceivedMessageYet,
        secondText: MyApp.tr.sendTheCodeAgain,
        onTap: () async {
          resendOtpFun(context);
        });
  }

  void resendOtpFun(BuildContext context) async {
    attempt++;
    if (attempt > 2) {
      FlashToastHelper.showErrorToast(
        context: context,
        content:
            "تم تجاوز الحد المسموح لمحاولات إعادة الإرسال. يرجى المحاولة بعد ساعة",
      );
      await Future.delayed(const Duration(seconds: 1));
      attempt = 0;
    } else {
      resetPassword.execute(identityNumber: "546");
    }
  }

  Future<dynamic> successLoginDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          insetAnimationDuration: const Duration(milliseconds: 100),
          insetAnimationCurve: Curves.bounceInOut,
          child: DoneContainer(
            image: AppAssets.bgSuccess,
            firstText: MyApp.tr.theAccountCreatedSuccessfully,
            secondText: MyApp.tr.youWillBeRedirectedToTheHomePage,
          ),
        );
      },
    );
  }
}
