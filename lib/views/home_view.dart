import 'package:farmbot/constants/my_styles.dart';
import 'package:farmbot/controllers/home_controller.dart';
import 'package:farmbot/gen/colors.gen.dart';
import 'package:farmbot/gen/fonts.gen.dart';
import 'package:farmbot/utils/my_utils.dart';
import 'package:farmbot/views/widgets/custom_progress_indicator.dart';
import 'package:farmbot/views/widgets/drawer_button.dart';
import 'package:farmbot/views/widgets/farm_bot_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'widgets/soil_spot.dart';

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
              children: [SoilMoistureTable(), CropMaturity()],
            ),
          ),
        ),
      ),
    );
  }
}

class SoilMoistureTable extends StatelessWidget {
  const SoilMoistureTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Table(
            children: List.generate(
              3,
              (rowNumber) => TableRow(
                children: List.generate(
                  3,
                  (spotNumber) => SoilSpot(
                    rowNumber: rowNumber + 1,
                    spotNumber: spotNumber + 1,
                    type: SoilSpotType.moisture,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CropMaturity extends StatelessWidget {
  const CropMaturity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Table(
            children: List.generate(
              3,
              (rowNumber) => TableRow(
                children: List.generate(
                  3,
                  (spotNumber) => SoilSpot(
                    rowNumber: rowNumber + 1,
                    spotNumber: spotNumber + 1,
                    type: SoilSpotType.maturity,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WelcomeUserText extends StatelessWidget {
  const WelcomeUserText({
    super.key,
    required this.userName,
  });
  final String? userName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Welcome".tr,
          style: const TextStyle(
            fontFamily: FontFamily.zain,
            color: ColorName.green,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: userName == null
              ? Container(
                  width: 50,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50), right: Radius.circular(50)),
                  ),
                )
              : Text(
                  userName ?? "",
                  style: const TextStyle(
                    fontFamily: FontFamily.zain,
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        )
      ],
    );
  }
}
