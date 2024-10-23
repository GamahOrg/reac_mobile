import 'package:flutter/material.dart';
import 'package:reac/app/app_colors.dart';

class RotatingLoader extends StatefulWidget {
  final Duration duration;

  const RotatingLoader({
    super.key,
    this.duration = const Duration(seconds: 2),
  });

  @override
  _RotatingLoaderState createState() => _RotatingLoaderState();
}

class _RotatingLoaderState extends State<RotatingLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: _controller,
        child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: AppColors.selectedTextTab,
                width: 15,
              ),
              shape: BoxShape.rectangle,
            ),
            child: Center(
              child: Container(
                width: 15,
                height: 15,
                color: Colors.white,
              ),
            )));
  }
}
