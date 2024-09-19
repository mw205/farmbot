import 'package:farmbot/controllers/locale_controller.dart';
import 'package:farmbot/controllers/settings_controller.dart';
import 'package:farmbot/gen/assets.gen.dart';
import 'package:farmbot/gen/colors.gen.dart';
import 'package:farmbot/views/widgets/locale_menu.dart';
import 'package:farmbot/views/widgets/notification_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/my_styles.dart';
import '../../model/settings_model.dart';

class SettingsListView extends StatelessWidget {
  const SettingsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.find<SettingsController>();
    final LocaleController localeController = Get.find<LocaleController>();
    List<TileModel> settings = [
      TileModel(
        leadingIcon: Assets.images.notificationsLogo.svg(
          colorFilter: const ColorFilter.mode(
            ColorName.green,
            BlendMode.srcIn,
          ),
        ),
        title: "Notifcation".tr,
        onTap: () {},
        trailingIcon: GetBuilder<SettingsController>(
          init: controller,
          builder: (_) {
            return NotificationSwitch(controller: controller);
          },
        ),
      ),
      TileModel(
        leadingIcon: const Icon(
          Icons.language_sharp,
          color: ColorName.green,
        ),
        title: "Change Language".tr,
        trailingIcon: LocaleMenu(localeController: localeController),
      ),
      TileModel(
        leadingIcon: Assets.images.terms.svg(
          colorFilter: const ColorFilter.mode(
            ColorName.green,
            BlendMode.srcIn,
          ),
        ),
        title: "terms and conditions".tr,
        onTap: () {},
      ),
      TileModel(
        leadingIcon: Assets.images.helpCenter.svg(
          colorFilter: const ColorFilter.mode(
            ColorName.green,
            BlendMode.srcIn,
          ),
        ),
        title: "Help Center".tr,
        onTap: () {},
      ),
      TileModel(
        leadingIcon: Assets.images.logout.svg(
          colorFilter: const ColorFilter.mode(
            ColorName.green,
            BlendMode.srcIn,
          ),
        ),
        title: "Log Out".tr,
        onTap: () {
          controller.logout();
        },
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: settings.map(
          (settingsModel) {
            return ListTile(
              leading: SizedBox(
                  width: 20, height: 20, child: settingsModel.leadingIcon),
              title: Text(
                settingsModel.title,
                style: MyStyles.font18BlackW900,
              ),
              trailing: settingsModel.trailingIcon ??
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
              onTap: settingsModel.onTap,
            );
          },
        ).toList(),
      ),
    );
  }
}
