import 'package:farmbot/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../controllers/locale_controller.dart';
import '../controllers/splash_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(SplashController());
    Get.put(LocaleController());
  }
}
