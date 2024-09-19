import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_icon_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {super.key, this.isFilled = true, this.color = Colors.black});
  final bool isFilled;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      isFilled: isFilled,
      onTap: () {
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back_sharp,
        color: color,
        size: 25,
      ),
    );
  }
}
