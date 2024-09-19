import 'package:farmbot/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(
        Icons.view_list_rounded,
        color: ColorName.green,
        size: 24,
      ),
    );
  }
}
