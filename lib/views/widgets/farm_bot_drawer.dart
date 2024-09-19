import 'package:farmbot/constants/my_strings.dart';
import 'package:farmbot/constants/my_styles.dart';
import 'package:farmbot/controllers/home_controller.dart';
import 'package:farmbot/gen/colors.gen.dart';
import 'package:farmbot/model/drawer_options.dart';
import 'package:farmbot/views/widgets/user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FarmBotDrawer extends StatelessWidget {
  const FarmBotDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return Drawer(
      backgroundColor: ColorName.green,
      elevation: 0,
      shadowColor: Colors.transparent,
      semanticLabel: "home drawer",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(75),
          UserInfoCard(
            imagePhotoUrl:
                homeController.getUserPhotoUrl() ?? MyStrings.profilePhoto,
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: homeController.drawerOptions.length,
            separatorBuilder: (context, index) {
              return Divider(
                color: ColorName.beige.withOpacity(0.3),
                indent: 40,
                endIndent: 40,
              );
            },
            itemBuilder: (context, index) {
              DrawerOptions option = homeController.drawerOptions[index];
              return ListTile(
                onTap: option.onTap,
                leading: option.icon,
                title: Text(
                  option.title.tr,
                  style: MyStyles.kFont22BeigeW600,
                ),
              );
            },
          ),
          const Spacer(),
          const Text("FarmBot V0.0", style: MyStyles.kFont22BeigeW600)
        ],
      ),
    );
  }
}
