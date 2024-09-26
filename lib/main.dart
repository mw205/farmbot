import 'package:farmbot/constants/my_themes.dart';
import 'package:farmbot/controllers/settings_services.dart';
import 'package:farmbot/services/notification_service.dart';
import 'package:farmbot/translations/farm_bot_translations.dart';
import 'package:farmbot/utils/init_bindings.dart';
import 'package:farmbot/utils/my_utils.dart';
import 'package:farmbot/utils/water_mark.dart';
import 'package:farmbot/views/home_view.dart';
import 'package:farmbot/views/on_boarding_view.dart';
import 'package:farmbot/views/profile_view.dart';
import 'package:farmbot/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'middlewares/auth_middleware.dart';
import 'views/login_view.dart';
import 'views/settings_view.dart';
import 'views/sign_up_view.dart';
import 'views/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SettingsServices.instance.initSettings();
  await NotificationService.instance.initNotifications();

  runApp(const FarmBotApp());
}

class FarmBotApp extends StatelessWidget {
  const FarmBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyScreenUtils.initUtils(context);
    return GetMaterialApp(
      initialBinding: InitBindings(),
      debugShowCheckedModeBanner: false,
      translations: FarmBotTranslations(),
      theme: MyThemes.themeData,
      locale: SettingsServices.instance.getLocale(),
      routingCallback: (routing) {
        if (routing!.current == WelcomeView.id) {}
      },
      getPages: [
        GetPage(name: SplashView.id, page: () => const SplashView()),
        GetPage(name: OnBoardingView.id, page: () => const OnBoardingView()),
        GetPage(name: WelcomeView.id, page: () => const WelcomeView()),
        GetPage(
          name: HomeView.id,
          page: () => const HomeView(),
          middlewares: [
            AuthMiddleware(),
          ],
        ),
        GetPage(name: LoginView.id, page: () => const LoginView()),
        GetPage(name: SignUpView.id, page: () => const SignUpView()),
        GetPage(name: SettingsView.id, page: () => const SettingsView()),
        GetPage(name: ProfileView.id, page: () => const ProfileView()),
      ],
    );
  }
}
