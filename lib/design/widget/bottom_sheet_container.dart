import 'package:flutter/material.dart';
import 'package:reac/app/extensions.dart';


class BottomSheetContainer extends StatelessWidget {
  final Widget child;
  EdgeInsetsGeometry? padding;
  Color? backgroundColor;
  BottomSheetContainer({super.key, required this.child, this.padding , this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding ?? EdgeInsets.symmetric(vertical: 2.h,),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor??Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 8,
              blurRadius: 10,
              offset: const Offset(6, 3), // changes position of shadow
            ),
          ],
        ),
        child: child
    );
  }
}