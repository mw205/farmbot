import 'package:farmbot/constants/my_styles.dart';
import 'package:farmbot/controllers/settings_controller.dart';
import 'package:farmbot/views/widgets/custom_back_button.dart';
import 'package:farmbot/views/widgets/settings_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const String id = "/settingsView";
  @override
  Widget build(BuildContext context) {
    // SettingsController settingsController =
    Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomBackButton(),
        ),
        title: Text(
          "Settings".tr,
          style: MyStyles.kFont25BlackW700,
        ),
      ),
      body: GetX<SettingsController>(
        builder: (controller) => ModalProgressHUD(
          inAsyncCall: controller.isLoading.value,
          child: const SettingsListView(),
        ),
      ),
    );
  }
}
