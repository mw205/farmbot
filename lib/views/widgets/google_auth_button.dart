import 'package:farmbot/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import 'circular_button.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find<LoginController>();
    return CustomCircularButton(
      radius: 55,
      child: Assets.images.googleLogo.svg(
        fit: BoxFit.cover,
        width: 30,
        height: 30,
      ),
      onTap: () {
        controller.loginWithGoogle();
      },
    );
  }
}
