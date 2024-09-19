import 'package:farmbot/utils/my_utils.dart';
import 'package:flutter/material.dart';

import '../../constants/my_styles.dart';
import '../../gen/colors.gen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTap,
      this.title,
      this.color = ColorName.green,
      this.width,
      this.height,
      this.image,
      this.filled = true,
      this.isCircle = false,
      this.child,
      this.radius});
  final void Function()? onTap;
  final String? title;
  final Color color;
  final String? image;
  final double? width;
  final double? height;
  final double? radius;
  final bool filled;
  final bool isCircle;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          color: filled ? color : Colors.white,
          borderRadius: isCircle ? null : BorderRadius.circular(5),
          border: filled ? null : Border.all(color: ColorName.green),
          image: image == null
              ? null
              : DecorationImage(
                  image: AssetImage(image!),
                  fit: BoxFit.cover,
                ),
        ),
        height: radius ?? height ?? 48,
        width: radius ?? width ?? MyScreenUtils.w * 0.9,
        child: child ??
            Text(
              title ?? "",
              style: filled
                  ? MyStyles.kFont22WhiteW400
                  : MyStyles.kFont20BlackW400,
            ),
      ),
    );
  }
}
