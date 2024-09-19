import 'package:farmbot/constants/my_styles.dart';
import 'package:farmbot/gen/assets.gen.dart';
import 'package:farmbot/gen/colors.gen.dart';
import 'package:farmbot/views/widgets/custom_back_button.dart';
import 'package:farmbot/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

import '../controllers/home_controller.dart';
import '../model/settings_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String id = "/profileView";
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    List<TileModel> tiles = [
      TileModel(
        leadingIcon: Assets.images.userLogo.svg(
          colorFilter: const ColorFilter.mode(
            ColorName.green,
            BlendMode.srcIn,
          ),
        ),
        title: homeController.user.value.phoneNumber ?? "",
      ),
      TileModel(
        leadingIcon: const Icon(
          Icons.alternate_email,
          color: ColorName.green,
        ),
        title: homeController.user.value.email ?? "",
      )
    ];
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8),
          child: CustomBackButton(),
        ),
        title: Text(
          "Profile Details".tr,
          style: MyStyles.kFont30BlackW700,
        ),
      ),
      body: ProfileViewBody(tiles: tiles),
    );
  }
}
