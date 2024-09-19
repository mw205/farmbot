import 'package:farmbot/views/home_view.dart';
import 'package:farmbot/views/on_boarding_view.dart';
import 'package:get/get.dart';

import '../constants/my_strings.dart';
import 'settings_services.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(milliseconds: 2500),
      () async {
        if (SettingsServices.instance.storage.read(MyStrings.kSkipOnBoarding) ??
            true) {
          Get.offNamed(OnBoardingView.id);
        } else {
          Get.offNamed(HomeView.id);
        }
      },
    );
    super.onInit();
  }
}
