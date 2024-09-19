import 'package:farmbot/gen/assets.gen.dart';
import 'package:farmbot/model/on_boarding_item_model.dart';
import 'package:farmbot/views/login_view.dart';
import 'package:farmbot/views/sign_up_view.dart';
import 'package:farmbot/views/widgets/custom_button.dart';
import 'package:farmbot/views/widgets/custom_progress_indicator.dart';
import 'package:farmbot/views/widgets/google_auth_button.dart';
import 'package:farmbot/views/widgets/o_r_custom_divider.dart';
import 'package:farmbot/views/widgets/on_boarding_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../controllers/login_controller.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});
  static const String id = "/welcome";
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find<LoginController>();
    return Scaffold(
      body: GetX<LoginController>(
        builder: (controller) => ModalProgressHUD(
          inAsyncCall: loginController.isLoading.value,
          progressIndicator: const CustomProgressIndicator(),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OnBoardingItem(
                    item: OnBoardingItemModel(
                      image: Assets.images.welcome.image(),
                      title: "Welcome to FarmBot".tr,
                    ),
                  ),
                  const Gap(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        width: 150,
                        onTap: () {
                          Get.toNamed(LoginView.id);
                        },
                        title: "Sign In".tr,
                      ),
                      const Gap(10),
                      CustomButton(
                        filled: false,
                        width: 150,
                        onTap: () {
                          Get.toNamed(SignUpView.id);
                        },
                        title: "Sign Up".tr,
                      ),
                    ],
                  ),
                  const ORCustomDivider(
                    color: Colors.grey,
                  ),
                  const GoogleAuthButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
