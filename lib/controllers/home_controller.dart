import 'package:farmbot/controllers/settings_services.dart';
import 'package:farmbot/gen/colors.gen.dart';
import 'package:farmbot/model/api_result.dart';
import 'package:farmbot/model/drawer_options.dart';
import 'package:farmbot/model/spots_data_model.dart';
import 'package:farmbot/model/user_model.dart';
import 'package:farmbot/services/plants_service.dart';
import 'package:farmbot/services/profile_service.dart';
import 'package:farmbot/views/profile_view.dart';
import 'package:farmbot/views/settings_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<DrawerOptions> drawerOptions = [
    DrawerOptions(
      icon: const Icon(
        Icons.person,
        color: ColorName.beige,
      ),
      title: "Profile Details".tr,
      onTap: () {
        Get.toNamed(ProfileView.id);
      },
    ),
    DrawerOptions(
      icon: const Icon(
        Icons.settings,
        color: ColorName.beige,
      ),
      title: "Settings".tr,
      onTap: () {
        Get.toNamed(
          SettingsView.id,
        );
      },
    ),
  ];
  final user = Rxn<dynamic>();
  Rx<List<SpotsDataModel?>?> spotsDataList = Rx<List<SpotsDataModel?>?>(null);
  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    if (SettingsServices.instance.accessToken != null) {
      await fetchProfileData();
      await fetchSpotsData();
    } else if (FirebaseAuth.instance.currentUser != null) {
      user.value = FirebaseAuth.instance.currentUser;
    }
    super.onInit();
  }

  Future<void> fetchProfileData() async {
    isLoading.value = true;
    ApiResult<UserModel> apiResult =
        await ProfileServiceImp.instance.fetchProfileData();
    apiResult.when(
      success: (data) {
        isLoading.value = false;
        user.value = data.data;
      },
      error: (error) {
        isLoading.value = false;
      },
    );
  }

  Future<void> fetchSpotsData() async {
    isLoading.value = true;
    ApiResult<List<SpotsDataModel>> apiResult =
        await PlantsServiceImp().getSpotsData();
    apiResult.when(
      success: (data) {
        spotsDataList.value = data;
        isLoading.value = false;
      },
      error: (error) {
        Get.snackbar("Error!!".tr, "there is an error!!".tr);
        isLoading.value = false;
      },
    );
  }

  Future<void> refreshData() async {
    spotsDataList.value = null;
    user.value = null;
    await fetchProfileData();
    await fetchSpotsData();
  }

  String? getUserFirstName() {
    return user.value?.displayName?.toString().split(" ").first ?? "";
  }

  String? getUserPhotoUrl() {
    return user.value.photoURL;
  }
}
