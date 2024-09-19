import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:farmbot/constants/my_strings.dart';
import 'package:farmbot/services/api_call_handler.dart';
import 'package:farmbot/services/dio_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  NotificationService._();
  static NotificationService instance = NotificationService._();
  final Dio _dio = DioConfig.getDio();
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    if (fcmToken != null) {
      signFCMToken(fcmToken);
    }
    log("fcm_token $fcmToken");
  }

  void signFCMToken(String fcmToken) {
    ApiCallHandler.handleApiCall(
      apiCall: () {
        return _dio.post(MyStrings.firebase + MyStrings.fcmToken, data: {
          "fcm_token": fcmToken,
        });
      },
      parser: ({required data}) {},
    );
  }
}
