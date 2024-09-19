import 'package:farmbot/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../gen/assets.gen.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String id = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MyScreenUtils.w,
          child: Assets.images.logo.image(),
        ),
      )
          .animate()
          .moveX(
            duration: const Duration(
              milliseconds: 250,
            ),
          )
          .fadeIn(
            duration: const Duration(
              milliseconds: 400,
            ),
          ),
    );
  }
}
