import 'package:farmbot/controllers/login_controller.dart';
import 'package:farmbot/views/home_view.dart';
import 'package:farmbot/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_services.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    LoginController loginController = Get.find<LoginController>();
    Future.wait([loginController.checkUserAuthStatus()]);
    if (loginController.isAuthed.value ||
        SettingsServices.instance.accessToken != null) {
      if (route != HomeView.id) {
        return const RouteSettings(name: HomeView.id);
      } else {
        return null;
      }
    } else {
      return const RouteSettings(name: WelcomeView.id);
    }
    // return super.redirect(route);
  }
}
