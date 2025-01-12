import 'package:flutter/material.dart';
import 'package:reac/features/presentation/auth_screens/reset_password/reset_password.dart';
import 'package:reac/features/presentation/auth_screens/reset_password/reset_password_final.dart';
import 'package:reac/features/presentation/auth_screens/verify_login_gulf.dart';
import 'package:reac/features/presentation/home/claims_screen.dart';
import 'package:reac/features/presentation/widgets/claim_details_screen.dart';

import '../features/presentation/agreement_list_screen.dart';
import '../features/presentation/appointment_members_arbitration_panel_list.dart';
import '../features/presentation/arbitration_awards_list.dart';
import '../features/presentation/auth_screens/login/login_screen.dart';
import '../features/presentation/auth_screens/verify/verify_login_screen.dart';
import '../features/presentation/claim_details/claim_details.dart';
import '../features/presentation/interpretation_list.dart';
import '../features/presentation/interpretation_of_ the _arbitration _award.dart';
import '../features/presentation/mailing_list_screen.dart';
import '../features/presentation/minutes_of_settlement.dart';
import '../features/presentation/number_arbitrators_list.dart';
import '../features/presentation/reconcilition_list.dart';
import '../features/presentation/reply_to_the_reporter.dart';
import '../features/presentation/scalpel_model_screen.dart';
import '../features/presentation/setting_screen.dart';

class AppRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case ClaimDetailsSCreen.id:
        return MaterialPageRoute(builder: (_) => const ClaimDetailsSCreen());
      case ClaimDetails.id:
        var arguments = settings.arguments as ClaimDetailsArgements;
        return MaterialPageRoute(
            builder: (_) => ClaimDetails(
                  claimDetailsArgements: arguments,
                ));
      case ArbitrationAwardsList.id:
        return MaterialPageRoute(builder: (_) => const ArbitrationAwardsList());
      case ScalpelModelScreen.id:
        var arguments = settings.arguments as ScalpelModelScreenArguments;
        return MaterialPageRoute(
            builder: (_) => ScalpelModelScreen(
                  scalpelModelScreenArguments: arguments,
                ));
      case ReplyReporterScreen.id:
        return MaterialPageRoute(builder: (_) => const ReplyReporterScreen());
      case NumberArbitratorsList.id:
        return MaterialPageRoute(builder: (_) => const NumberArbitratorsList());

      case SettingScreen.id:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case InterpretationOfTheArbitrationAward.id:
        var arguments =
            settings.arguments as InterpretationOfTheArbitrationAwardArguments;
        return MaterialPageRoute(
            builder: (_) => InterpretationOfTheArbitrationAward(
                  arguments: arguments,
                ));
      case MailingListScreen.id:
        return MaterialPageRoute(builder: (_) => const MailingListScreen());
      case InterpretationListScreen.id:
        return MaterialPageRoute(
            builder: (_) => const InterpretationListScreen());
      case AgreementListScreen.id:
        return MaterialPageRoute(builder: (_) => const AgreementListScreen());
      case MinutesOfSettlement.id:
        var arguments = settings.arguments as MinutesOfSettlementArguments;
        return MaterialPageRoute(
            builder: (_) => MinutesOfSettlement(
                  minutesOfSettlementArguments: arguments,
                ));
      case LoginScreen.id:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppointmentMembersArbitrationPanelList.id:
        return MaterialPageRoute(
            builder: (_) => const AppointmentMembersArbitrationPanelList());
      case ReconciliationList.id:
        return MaterialPageRoute(builder: (_) => const ReconciliationList());
      case ClaimsScreen.id:
        return MaterialPageRoute(builder: (_) => const ClaimsScreen());
      case VerifyLoginScreen.id:
        return MaterialPageRoute(builder: (_) => VerifyLoginScreen(arg: settings.arguments as VerifyArgument,));
      case VerifyLoginGulfScreen.id:
        final String isLogin = settings.arguments.toString();
        return MaterialPageRoute(
            builder: (_) => VerifyLoginGulfScreen(isFromLoginScreen: isLogin));
      case ResetPassword.id:
        return MaterialPageRoute(builder: (_) => ResetPassword());
      case ResetPasswordFinal.id:
        return MaterialPageRoute(builder: (_) => ResetPasswordFinal());
      default:
        return MaterialPageRoute(
            builder: (_) => const Center(
                  child: Text("Page Not Found"),
                ));
    }
  }
}
