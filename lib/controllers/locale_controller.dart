import 'package:farmbot/constants/my_strings.dart';
import 'package:farmbot/controllers/settings_services.dart';
import 'package:farmbot/model/locale_options_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../gen/assets.gen.dart';

class LocaleController extends GetxController {
  LocaleOptions? currentLocaleOption;

  List<LocaleOptions> options = [
    LocaleOptions(
      name: "Arabic",
      locale: const Locale("ar"),
      icon: Assets.images.arabicLogo.provider(),
    ),
    LocaleOptions(
      name: "English",
      locale: const Locale("en"),
      icon: Assets.images.englishLogo.provider(),
    ),
  ];
  @override
  void onInit() async {
    super.onInit();
    await getDefaultLocale();
  }

  Future<void> getDefaultLocale() async {
    if (isLocaleKeySet() == false) {
      Locale deviceLocale = Get.deviceLocale ?? const Locale("en");
      if (deviceLocale.languageCode == "ar") {
        currentLocaleOption = options.firstWhere(
          (option) => option.locale.languageCode == "ar",
        );
      } else {
        currentLocaleOption = options.firstWhere(
          (option) => option.locale.languageCode == "en",
          orElse: () => options[1],
        );
      }
      changeLanguage(ifNull: !isLocaleKeySet());
    } else {
      currentLocaleOption = options.firstWhere(
        (option) =>
            option.locale.languageCode ==
            SettingsServices.instance.getLocale().languageCode,
        orElse: () => options[1],
      );
    }
    update();
  }

  void onChangeLocale(LocaleOptions option) async {
    currentLocaleOption = option;
    changeLanguage(ifNull: false);
    update();
  }

  //this will be stored in the local storage of the device
  void changeLanguage({@required bool? ifNull}) async {
    if (ifNull == true) {
      // this is used to set the locale based on the device locale
      await SettingsServices.instance.storage.writeIfNull(
          MyStrings.kLocaleKey, currentLocaleOption!.locale.languageCode);
      await updateLocale();
    } else {
      //if the user changed the locale
      await SettingsServices.instance.storage.write(
          MyStrings.kLocaleKey, currentLocaleOption!.locale.languageCode);
      await updateLocale();
    }
    update();
    await SettingsServices.instance.storage
        .write(MyStrings.kIsLanguageSet, true);
  }

  Future<void> updateLocale() async {
    await Get.updateLocale(Locale(currentLocaleOption!.locale.languageCode));
  }

  //check if the local key exists in the local storage of the device
  bool isLocaleKeySet() {
    bool? isLocaleKeySet =
        SettingsServices.instance.storage.read(MyStrings.kIsLanguageSet) ??
            false;
    return isLocaleKeySet;
  }
}
