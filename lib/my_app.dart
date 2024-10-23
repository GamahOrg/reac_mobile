import 'package:flutter/services.dart';
import 'package:reac/app/app_prefs.dart';
import 'package:flutter/material.dart';
import 'package:reac/app/app_router.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/environment/banner_widget.dart';
import 'package:reac/app/environment/config/build_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reac/app_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reac/features/presentation/auth_screens/login/login_screen.dart';
import 'package:reac/features/presentation/home/claims_screen.dart';
import 'app/text_style.dart';




GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static bool isAppTypeEngineer = getIt<BuildConfig>().env == CustomEnv.client;
  static late bool isDark;
  static late AppLocalizations tr;
  static late BuildContext appContext;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLogged = getIt<AppPreferences>().userToken.isNotEmpty? true:false;
    return BannerWidget(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<AppCubit>()),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, local) {
            var cubit = context.read<AppCubit>();
            return MaterialApp(
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                theme:ThemeData(
                  appBarTheme: const AppBarTheme(
                   systemOverlayStyle: SystemUiOverlayStyle(
                     statusBarColor: Colors.transparent,
                     statusBarIconBrightness: Brightness.light,
                   )
                  ),
                  fontFamily: AppTextStyle.mainArFont,
                  scaffoldBackgroundColor: const Color(0xffF4F5F9),
                ),
                onGenerateTitle: (context) {
                  appContext = context;
                  isDark = cubit.isDark;
                  tr = AppLocalizations.of(context)!;
                  return tr.appTitle;
                },
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: cubit.locale,
                onGenerateRoute: AppRouter.generatedRoute,
                //initialRoute: getInitialRoute());
                home: isLogged?  const ClaimsScreen():const LoginScreen());
          },
        ),
      ),
    );
  }
}
