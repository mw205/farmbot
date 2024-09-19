import 'package:farmbot/constants/my_styles.dart';
import 'package:farmbot/controllers/home_controller.dart';
import 'package:farmbot/views/widgets/user_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/my_strings.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard(
      {super.key, required this.imagePhotoUrl, this.isDark = false});
  final String? imagePhotoUrl;
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return Column(
      children: [
        UserPhoto(imagePath: imagePhotoUrl ?? MyStrings.profilePhoto),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
          child: Text(
            homeController.user.value.displayName,
            style:
                isDark ? MyStyles.kFont30BlackW700 : MyStyles.kFont30WhiteW700,
          ),
        ),
      ],
    );
  }
}
