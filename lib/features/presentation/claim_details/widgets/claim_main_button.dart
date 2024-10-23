import 'package:flutter/material.dart';
import 'package:reac/app/app_enums.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/features/presentation/manager/claim_details_cubit.dart';

import '../../../../app/default_button.dart';
import '../../../../my_app.dart';
import '../../../domain/models/claim_model/details_response_model.dart';

class ClaimMainButton extends StatelessWidget {
  int? status;
  DetailsResponseModel? cubit;
  StepsClaims? typeStep;
  void Function() callBack;

  ClaimMainButton({super.key, this.status, required this.callBack,this.cubit,this.typeStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
      child: DefaultButton(
        onTap: () {
          callBack.call();
        },
        radius: 30,
        firstGradientColor: const Color(0xff002F56),
        secondGradientColor: const Color(0xff002F56),
        title: getMainButtonText(),
        fontSize: 11.sp,
        fontWeight: FontWeight.w700,
        textColor: Colors.white,
        width: 90.w,
      ),
    );
  }

  String getMainButtonText() {
    var name = "";
    if (typeStep?.text == StepsClaims.appointmentOfMembersOfTheArbitrationPanel.text) {
      name = MyApp.tr.appointmentOfMembersOfTheArbitrationPanel;
    } else if (typeStep?.text == StepsClaims.determineTheNumberOfArbitrators.text) {
      name = MyApp.tr.determineTheNumberOfArbitrators;
    }
    return name;
  }
}
