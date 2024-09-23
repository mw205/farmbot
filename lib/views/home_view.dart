import 'package:farmbot/constants/my_styles.dart';
import 'package:farmbot/controllers/home_controller.dart';
import 'package:farmbot/gen/colors.gen.dart';
import 'package:farmbot/utils/my_utils.dart';
import 'package:farmbot/views/widgets/crop_maturity_table.dart';
import 'package:farmbot/views/widgets/custom_progress_indicator.dart';
import 'package:farmbot/views/widgets/drawer_button.dart';
import 'package:farmbot/views/widgets/farm_bot_drawer.dart';
import 'package:farmbot/views/widgets/soil_moisture_table.dart';
import 'package:farmbot/views/widgets/welcome_user_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = "/home";

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return DefaultTabController(
      length: 2,
      child: GetX<HomeController>(
        builder: (controller) => ModalProgressHUD(
          inAsyncCall: homeController.isLoading.value,
          progressIndicator: const CustomProgressIndicator(),
          child: Scaffold(
            appBar: AppBar(
              leading: Builder(
                builder: (context) {
                  return const CustomDrawerButton();
                },
              ),
              title: WelcomeUserText(
                  userName: controller.getUserFirstName() ?? ""),
              bottom: PreferredSize(
                preferredSize: Size(MyScreenUtils.w, 60),
                child: Column(
                  children: [
                    Divider(color: Colors.grey.withOpacity(0.3)),
                    TabBar(
                      overlayColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      indicatorColor: Colors.transparent,
                      labelColor: ColorName.green,
                      unselectedLabelStyle: MyStyles.kFont18GreyW600,
                      labelStyle: MyStyles.kFont18GreenW600,
                      dividerColor: Colors.grey.withOpacity(0.3),
                      tabs: [
                        Tab(text: "Soil Moisture".tr),
                        Tab(text: "crop maturity".tr)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            drawer: const FarmBotDrawer(),
            body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [SoilMoistureTable(), CropMaturityTable()],
            ),
          ),
        ),
      ),
    );
  }
}
