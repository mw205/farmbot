import 'package:farmbot/constants/my_strings.dart';
import 'package:farmbot/controllers/settings_services.dart';
import 'package:farmbot/services/notification_service.dart';
import 'package:farmbot/views/welcome_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  bool isNotifcationEnabled = true;
  RxBool isLoading = false.obs;
  void toggleNotification() {
    isNotifcationEnabled = !isNotifcationEnabled;
    if (isNotifcationEnabled) {
      FirebaseMessaging.instance.deleteToken();
    } else {
      NotificationService.instance.initNotifications();
    }
    update();
  }

  void logout() async {
    try {
      isLoading.value = true;
      await FirebaseAuth.instance.signOut();
      await FirebaseAuth.instance.currentUser?.reload();
      await SettingsServices.instance.storage.remove(MyStrings.kAccessToken);
      Get.offAllNamed(WelcomeView.id);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      Get.snackbar("Error!!".tr, "there is an error!!");
    }
  }
}
