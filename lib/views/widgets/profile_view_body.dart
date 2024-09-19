import 'package:farmbot/controllers/home_controller.dart';
import 'package:farmbot/model/settings_model.dart';
import 'package:farmbot/views/widgets/profile_details_list.dart';
import 'package:farmbot/views/widgets/user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
    required this.tiles,
  });

  final List<TileModel> tiles;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();

    return ListView(
      children: [
        const Gap(50),
        UserInfoCard(
          imagePhotoUrl: homeController.getUserPhotoUrl(),
          isDark: true,
        ),
        ProfileDetailsList(tiles: tiles)
      ],
    );
  }
}
