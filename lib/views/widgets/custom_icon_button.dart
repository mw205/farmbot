import 'package:farmbot/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.onTap,
    required this.icon,
    this.isFilled = true,
    this.isSelected = false,
    super.key,
  });
  final Widget icon;
  final void Function()? onTap;
  final bool isFilled;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: isFilled
              ? isSelected
                  ? ColorName.green
                  : ColorName.beige
              : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
