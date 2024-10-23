import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/extensions.dart';

import '../../../app/app_assets.dart';
import '../../../app/constants.dart';
import 'custom_row.dart';

class ExpandWidget extends StatelessWidget {
  final String? headerIcon;
  final String title;
  final List<CustomRowDM> list;

  const ExpandWidget(
      {super.key, this.headerIcon, required this.title, required this.list});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
                colors: [
                  Color(0xff03598D),
                  Color(0xFF002F56),
                ],
                begin: FractionalOffset(1.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: SvgPicture.asset(headerIcon ?? AppAssets.icNote2),
      ),
      trailing: SvgPicture.asset(AppAssets.icArrowDown),
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
              color: const Color(0xff61686B))),
      children: _buildChildren(),
    );
  }

  List<CustomRow> _buildChildren() {
    return list.map((item) => CustomRow(dm: item)).toList();
  }
}
