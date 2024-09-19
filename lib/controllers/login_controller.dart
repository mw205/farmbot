import 'dart:developer';

import 'package:farmbot/constants/my_strings.dart';
import 'package:farmbot/controllers/settings_services.dart';
import 'package:farmbot/model/api_result.dart';
import 'package:farmbot/model/user_model.dart';
import 'package:farmbot/services/login_service.dart';
import 'package:farmbot/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isAuthed = false.obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    await checkUserAuthStatus();
    super.onInit();
  }

  void loginWithEmailAndPassword() async {
    isLoading.value = true;
    ApiResult<UserModel> apiResult =
        await LoginService.loginUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    apiResult.when(
      success: (data) {
        isLoading.value = false;
        isAuthed.value = true;
        SettingsServices.instance.storage.write(
          MyStrings.kAccessToken,
          data.token,
        );
        Get.offAllNamed(HomeView.id);
      },
      error: (error) {
        isLoading.value = false;
        Get.snackbar(
          "Error!!".tr,
          error.message,
        );
      },
    );
  }

  void loginWithGoogle() async {
    await signInWithGoogle();
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.currentUser!.reload();
      await signFirebase();
      Get.offAllNamed(HomeView.id);
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  Future<void> signFirebase() async {
    await LoginService.loginUserWithFirebase(
      token: FirebaseAuth.instance.currentUser!.uid,
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    isLoading.value = true;

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> checkUserAuthStatus() async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;

      // Reload the Firebase user to ensure the latest status
      await firebaseUser?.reload();

      // Check Firebase auth state changes
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        // If the user is not signed in with Firebase
        if (user == null) {
          // Check for the backend access token
          String? backendToken =
              SettingsServices.instance.storage.read(MyStrings.kAccessToken);

          if (backendToken == null) {
            // Neither Firebase nor backend auth is valid
            isAuthed.value = false;
          } else {
            // Firebase is not signed in, but backend access token exists
            isAuthed.value = true;
          }
        } else {
          // Firebase user is signed in
          isAuthed.value = true;
        }
      });
    } on FirebaseAuthException {
      isAuthed.value = false;
    } catch (e) {
      isAuthed.value = false;
    }
    log("is User Authed : ${isAuthed.value}");
  }
}
