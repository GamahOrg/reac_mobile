import 'package:flutter/material.dart';
import 'package:reac/app/app_assets.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/features/presentation/auth_screens/login/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id="SplashScreen";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context,LoginScreen.id);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.selectedTextTab,
      body:Center(child: Image(image: AssetImage(AppAssets.bgSplashLogo))) ,
    );
  }
}