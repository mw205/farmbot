import 'package:farmbot/controllers/sign_up_controller.dart';
import 'package:farmbot/utils/my_validators.dart';
import 'package:farmbot/views/login_view.dart';
import 'package:farmbot/views/widgets/custom_back_button.dart';
import 'package:farmbot/views/widgets/custom_phone_text_field.dart';
import 'package:farmbot/views/widgets/custom_progress_indicator.dart';
import 'package:farmbot/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants/my_styles.dart';
import 'widgets/custom_button.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String id = "/signUpView";
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomBackButton(),
        ),
      ),
      body: GetX<SignUpController>(
        init: SignUpController(),
        builder: (controller) => ModalProgressHUD(
          inAsyncCall: controller.isLoading.value,
          progressIndicator: const CustomProgressIndicator(),
          child: Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  const Gap(15),
                  Text(
                    "${"Sign Up".tr}.",
                    textAlign: TextAlign.center,
                    style: MyStyles.kFont35GreenW900,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet a aconsectetur".tr,
                    style: MyStyles.kFont18GreyW500,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(15),
                  CustomTextFormField(
                    textEditingController: controller.nameController,
                    label: "Name".tr,
                    fontSize: 18,
                  ),
                  const Gap(15),
                  CustomTextFormField(
                    textEditingController: controller.emailController,
                    validator: (value) => MyValidators.emailValidator(value),
                    label: "Email".tr,
                    fontSize: 18,
                  ),
                  const Gap(15),
                  CustomTextFormField(
                    textEditingController: controller.passwordController,
                    validator: (value) => MyValidators.passwordValidator(value),
                    label: "Password".tr,
                    obscureText: true,
                    fontSize: 18,
                  ),
                  const Gap(15),
                  CustomTextFormField(
                    textEditingController: controller.confirmPasswordController,
                    validator: (value) {
                      if (value != controller.passwordController.text) {
                        return 'Passwords do not match'.tr;
                      }

                      return null;
                    },
                    label: "Confirm Password".tr,
                    obscureText: true,
                    fontSize: 18,
                  ),
                  const Gap(15),
                  CustomPhoneTextField(
                    controller: controller.phoneController,
                    onInit: (countryCode) {
                      controller.phoneCode.value = countryCode!.code!;
                    },
                  ),
                  const Gap(35),
                  CustomButton(
                      onTap: () {
                        if (key.currentState!.validate()) {
                          controller.createUserWithEmailAndPassword();
                        }
                      },
                      title: "Sign Up".tr),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GestureDetector(
                      onTap: () {
                        Get.offNamed(LoginView.id);
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account? ".tr,
                                style: MyStyles.kFont18DarkerGreyW600,
                              ),
                              TextSpan(
                                text: " Sign In from here ".tr,
                                style: MyStyles.kFont18GreenW700,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
