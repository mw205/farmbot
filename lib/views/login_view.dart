import 'package:farmbot/controllers/login_controller.dart';
import 'package:farmbot/utils/my_validators.dart';
import 'package:farmbot/views/sign_up_view.dart';
import 'package:farmbot/views/widgets/custom_back_button.dart';
import 'package:farmbot/views/widgets/custom_progress_indicator.dart';
import 'package:farmbot/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants/my_styles.dart';
import 'widgets/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String id = "/signInView";
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
        body: GetX<LoginController>(
          builder: (controller) {
            return ModalProgressHUD(
              inAsyncCall: controller.isLoading.value,
              progressIndicator: const CustomProgressIndicator(),
              child: Form(
                key: key,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      const Gap(70),
                      Text("${"Sign In".tr}.",
                          textAlign: TextAlign.center,
                          style: MyStyles.kFont35GreenW900),
                      Text(
                        "Lorem ipsum dolor sit amet a aconsectetur".tr,
                        style: MyStyles.kFont18GreyW500,
                        textAlign: TextAlign.center,
                      ),
                      const Gap(70),
                      CustomTextFormField(
                          textEditingController: controller.emailController,
                          validator: (value) =>
                              MyValidators.emailValidator(value),
                          label: "Email".tr),
                      const Gap(25),
                      CustomTextFormField(
                        textEditingController: controller.passwordController,
                        label: "Password".tr,
                        obscureText: true,
                      ),
                      const Gap(35),
                      CustomButton(
                          onTap: () {
                            if (key.currentState!.validate()) {
                              controller.loginWithEmailAndPassword();
                            }
                          },
                          title: "Sign In".tr),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: GestureDetector(
                          onTap: () {
                            Get.offNamed(SignUpView.id);
                          },
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Don't have an account?".tr,
                                    style: MyStyles.kFont18DarkerGreyW600,
                                  ),
                                  TextSpan(
                                    text: "Register from here".tr,
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
            );
          },
        ));
  }
}
