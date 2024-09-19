import 'package:farmbot/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/my_styles.dart';

enum CustomTextFieldType { phone, email, password, name }

class CustomTextFormField extends StatefulWidget {
  late final String label;
  late final Widget? icon;
  late final Function(String)? onChanged;
  late final bool? obscureText;
  late final String? obsecuringCharacter;
  late final TextInputType? keyboardType;
  late final CustomTextFieldType? type;
  late final TextEditingController? textEditingController;
  late final String? Function(String?)? validator;

  final int fontSize;
  CustomTextFormField(
      {super.key,
      this.onChanged,
      required this.label,
      this.icon,
      this.obscureText = false,
      this.obsecuringCharacter = "*",
      this.textEditingController,
      this.keyboardType = TextInputType.text,
      this.fontSize = 20,
      this.validator}) {
    type = null;
  }

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObsecured;
  @override
  void initState() {
    isObsecured = widget.obscureText ?? false;
    super.initState();
  }

  void togglePasswordVisibility() {
    setState(() {
      isObsecured = !isObsecured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            widget.label,
            style: MyStyles.kFont20BlackW600,
          ),
        ),
        TextFormField(
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "This field can't be empty".tr;
            }
            final validationResult = widget.validator?.call(value);

            return validationResult;
          },
          obscureText: isObsecured,
          obscuringCharacter: "*",
          enableSuggestions: true,
          controller: widget.textEditingController,
          style: MyStyles.kFont20BlackW400,
          cursorColor: ColorName.green,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            errorStyle: MyStyles.font15RedW700,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            border: _buildBorder(),
            enabledBorder: _buildBorder(),
            focusedBorder: _buildBorder(),
            errorBorder: _buildBorder(color: Colors.red),
            focusedErrorBorder: _buildBorder(color: Colors.red),
            suffixIcon: widget.obscureText == true
                ? IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      togglePasswordVisibility();
                    },
                    icon: Icon(
                      isObsecured ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey.shade400,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }

  InputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color ?? Colors.grey.shade200));
  }
}
