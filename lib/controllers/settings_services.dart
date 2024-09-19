import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/my_strings.dart';

class SettingsServices extends GetxService {
  SettingsServices._();
  static final SettingsServices instance = SettingsServices._();
  final GetStorage _storage = GetStorage();
  GetStorage get storage => _storage;

  Future<void> initSettings() async {
    await GetStorage.init();
  }

  Locale getLocale() {
    String? localeKey =
        SettingsServices.instance.storage.read(MyStrings.kLocaleKey);
    if (localeKey == null) {
      return Get.deviceLocale!;
    } else {
      return Locale(
          SettingsServices.instance.storage.read(MyStrings.kLocaleKey));
    }
  }

  String? get accessToken => instance.storage.read(MyStrings.kAccessToken);
}
