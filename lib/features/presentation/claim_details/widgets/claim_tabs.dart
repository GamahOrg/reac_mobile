import 'package:flutter/material.dart';
import 'package:reac/app/app_enums.dart';
import 'package:reac/app/extensions.dart';

import '../../../../app/app_colors.dart';
import '../../../../my_app.dart';

class ClaimTabs extends StatefulWidget {
  ClaimStatus? status;
  Function() firstTab;
  Function() secondTab;

  ClaimTabs(
      {super.key,
      this.status,
      required this.firstTab,
      required this.secondTab});

  @override
  State<ClaimTabs> createState() => _ClaimTabsState();
}

class _ClaimTabsState extends State<ClaimTabs> {
  bool isFirstTabSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: true, //widget.status != ClaimStatus.underPayment,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            margin: EdgeInsets.only(top: 11.5.h),
            height: 6.h,
            width: 95.w,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildTabItem(MyApp.tr.claimData, isFirstTabSelected, () {
                  setState(() {
                    isFirstTabSelected = true;
                  });
                  widget.firstTab.call();
                }),
                _buildTabItem(
                  MyApp.tr.eventsOfTheCase,
                  !isFirstTabSelected,
                  () {
                    setState(() {
                      isFirstTabSelected = false;
                    });
                    widget.secondTab.call();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Expanded _buildTabItem(String title, bool flag, Function() onPressed) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          onPressed.call();
        },
        style: OutlinedButton.styleFrom(
            side: BorderSide.none,
            backgroundColor:
                flag ? AppColors.selectedTabBackground : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            color:
                flag ? AppColors.selectedTextTab : AppColors.unSelectedTextTab,
          ),
        ),
      ),
    );
  }
}
