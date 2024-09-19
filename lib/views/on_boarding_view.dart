import 'package:farmbot/controllers/locale_controller.dart';
import 'package:farmbot/controllers/on_boarding_controller.dart';
import 'package:farmbot/gen/colors.gen.dart';
import 'package:farmbot/views/widgets/locale_menu.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/custom_button.dart';
import 'widgets/on_boarding_item.dart';
import 'widgets/skip_button.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String id = "/onBoarding";

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());
    LocaleController localeController = Get.find<LocaleController>();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocaleMenu(localeController: localeController),
                  SkipButton(
                    onTap: () {
                      controller.goToWelcome();
                    },
                  )
                ],
              ),
            ),
            const Gap(50),
            SizedBox(
              height: 500,
              width: 400,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  controller.isLastIndex = controller.items.length - 1 == index;
                  return OnBoardingItem(
                    item: controller.items[index],
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              effect: JumpingDotEffect(
                dotColor: Colors.grey.shade200,
                activeDotColor: ColorName.green,
                dotHeight: 12,
                dotWidth: 12,
              ),
              controller: controller.pageController,
              count: controller.items.length,
            ),
            const Gap(20),
            CustomButton(
              width: 200,
              height: 48,
              onTap: () {
                controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn);
                if (controller.isLastIndex) {
                  controller.goToWelcome();
                }
              },
              title: "Next".tr,
            )
          ],
        ),
      ),
    );
  }
}
