import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_divider/text_divider.dart';

import '../../constants/my_styles.dart';

class ORCustomDivider extends StatelessWidget {
  const ORCustomDivider({super.key, this.color = Colors.white});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: TextDivider(
        endIndent: 30,
        indent: 30,
        text: Text(
          "OR".tr,
          style: color == Colors.white
              ? MyStyles.font14whiteW900
              : MyStyles.font14greyW900,
        ),
        color: color,
        thickness: 0.5,
      ),
    );
  }
}
