import 'package:flutter/material.dart';

import '../../utils/my_utils.dart';

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton({
    super.key,
    required this.child,
    required this.onTap,
    this.radius,
  });
  final Widget child;
  final double? radius;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: radius ?? MyScreenUtils.h * 0.05,
        width: radius ?? MyScreenUtils.w * 0.05,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.19),
        ),
        child: Center(child: child),
      ),
    );
  }
}
