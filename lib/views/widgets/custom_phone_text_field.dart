import 'package:country_code_picker/country_code_picker.dart';
import 'package:farmbot/utils/my_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/my_styles.dart';

class CustomPhoneTextField extends StatefulWidget {
  final bool isLabeled;
  final TextEditingController? controller;
  final void Function(CountryCode?)? onInit;
  const CustomPhoneTextField({
    this.controller,
    this.isLabeled = false,
    this.onInit,
    super.key,
  });

  @override
  State<CustomPhoneTextField> createState() => _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends State<CustomPhoneTextField> {
  bool isTextFieldFocused = false;
  String? countryCode;
  bool isValid = true;
  InputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color ?? Colors.grey.shade200));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            "Phone Number".tr,
            style: MyStyles.kFont20BlackW600,
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(bottom: isValid ? 0 : 25.0),
                child: AnimatedContainer(
                  padding: const EdgeInsets.all(5),
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isValid ? Colors.grey.shade200 : Colors.red,
                    ),
                    borderRadius: const BorderRadiusDirectional.horizontal(
                      start: Radius.circular(5),
                    ),
                  ),
                  child: CountryCodePicker(
                    onInit: widget.onInit,
                    onChanged: widget.onInit,
                    padding: const EdgeInsets.all(0),
                    textStyle: isValid
                        ? MyStyles.kFont18GreyW500
                        : MyStyles.kFont18RedW500,
                    initialSelection: "eg",
                    showFlagMain: true,
                    showFlag: true,
                    alignLeft: true,
                    flagWidth: 40,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    isValid = false;
                    setState(() {});
                    return MyValidators.phoneNumberValidator(value);
                  } else {
                    isValid = true;
                    setState(() {});
                    return null;
                  }
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                controller: widget.controller,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  errorStyle: MyStyles.font15RedW700,
                  enabledBorder: buildBorder(),
                  focusedBorder: buildBorder(),
                  errorBorder: buildBorder(color: Colors.red),
                  focusedErrorBorder: buildBorder(color: Colors.red),
                ),
                style: MyStyles.kFont18BlackW400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
