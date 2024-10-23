import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reac/app/extensions.dart';


class CustomDialog {

  static Future<dynamic> show(BuildContext context,
      {required Widget child}) async {
    return await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: child,
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
          Tween(begin: const Offset(0, 1), end: Offset.zero).animate(anim1),
          child: child,
        );
      },
    );
  }

  static Future<dynamic> show2(BuildContext context,{required Widget child}) async {
    return await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: child,
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
          Tween(begin: const Offset(0, 1), end: Offset.zero).animate(anim1),
          child: Dialog(
            insetPadding: EdgeInsets.all(2.w),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: child,
          ),
        );
      },
    );
  }
}
