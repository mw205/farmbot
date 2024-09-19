import 'package:farmbot/controllers/settings_controller.dart';
import 'package:farmbot/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class NotificationSwitch extends StatelessWidget {
  const NotificationSwitch({
    super.key,
    required this.controller,
  });

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeTrackColor: ColorName.green,
      value: controller.isNotifcationEnabled,
      onChanged: (value) {
        controller.toggleNotification();
      },
    );
  }
}
