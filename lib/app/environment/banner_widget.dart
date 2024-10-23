import 'package:flutter/material.dart';

import '../di/di.dart';
import 'config/build_config.dart';

class BannerWidget extends StatelessWidget {
  final Widget child;
  const BannerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (getIt<BuildConfig>().env == CustomEnv.client) return child;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Builder(builder: (context) {
        return Stack(
            fit: StackFit.expand, children: [child, _buildBanner(context)]);
      }),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
            message: getIt<BuildConfig>().env,
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: const Color(0xff3DDC84)),
      ),
    );
  }
}
