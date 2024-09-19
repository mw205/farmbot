import 'package:farmbot/constants/my_strings.dart';
import 'package:farmbot/controllers/settings_services.dart';
import 'package:farmbot/model/api_result.dart';
import 'package:farmbot/model/user_model.dart';
import 'package:farmbot/services/register_service.dart';
import 'package:farmbot/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxString phoneCode = "eg".obs;
  RxBool isAuthed = false.obs;
  RxBool isLoading = false.obs;

  void createUserWithEmailAndPassword() async {
    isLoading.value = true;
    isAuthed.value = true;

    ApiResult<UserModel> response =
        await RegisterService.registerUserByEmailAndPassword(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phoneNumber: phoneController.text,
      passwordConfirmation: confirmPasswordController.text,
      phoneCode: phoneCode.value,
    );
    response.when(
      success: (data) {
        SettingsServices.instance.storage
            .write(MyStrings.kAccessToken, data.token);
        if (SettingsServices.instance.accessToken != null) {
          Get.offAllNamed(HomeView.id);
        }
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
}
