import 'package:farmbot/constants/my_strings.dart';
import 'package:farmbot/controllers/settings_services.dart';
import 'package:farmbot/model/on_boarding_item_model.dart';
import 'package:farmbot/views/welcome_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../gen/assets.gen.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController();
  bool isLastIndex = false;
  List<OnBoardingItemModel> items = [
    OnBoardingItemModel(
      title: "Lorem ipsum dolor sit amet a aconsectetur",
      image: Assets.images.onBoarding1.image(width: 300),
    ),
    OnBoardingItemModel(
      title: "Lorem ipsum dolor sit amet a aconsectetur",
      image: Assets.images.onBoarding2.image(width: 300),
    ),
    OnBoardingItemModel(
      title: "Lorem ipsum dolor sit amet a aconsectetur",
      image: Assets.images.onboarding3.image(width: 300),
    ),
  ];
  void goToWelcome() async {
    await SettingsServices.instance.storage
        .write(MyStrings.kSkipOnBoarding, false);
    Get.offNamed(WelcomeView.id);
  }
}
