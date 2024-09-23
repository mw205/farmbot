import 'package:farmbot/gen/colors.gen.dart';
import 'package:farmbot/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeUserText extends StatelessWidget {
  const WelcomeUserText({
    super.key,
    required this.userName,
  });
  final String? userName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Welcome".tr,
          style: const TextStyle(
            fontFamily: FontFamily.zain,
            color: ColorName.green,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: userName == null
              ? Container(
                  width: 50,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50), right: Radius.circular(50)),
                  ),
                )
              : Text(
                  userName ?? "",
                  style: const TextStyle(
                    fontFamily: FontFamily.zain,
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        )
      ],
    );
  }
}
