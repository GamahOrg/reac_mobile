import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../app_cubit.dart';

class LanguageDirection extends StatelessWidget{
 final Widget child;
 final bool? condition;
  const LanguageDirection({super.key, required this.child, this.condition});

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          double transformY =
          ( condition?? AppCubit.get(context).isArSelected)? 0 : math.pi;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(transformY),
            child:child,
          );
        }
    );
  }
}

