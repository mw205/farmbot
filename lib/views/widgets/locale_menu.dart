import 'package:farmbot/constants/my_styles.dart';
import 'package:farmbot/controllers/locale_controller.dart';
import 'package:farmbot/model/locale_options_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleMenu extends StatelessWidget {
  const LocaleMenu({
    super.key,
    required this.localeController,
  });

  final LocaleController localeController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocaleController>(
      init: localeController,
      builder: (controller) {
        final currentOption =
            controller.currentLocaleOption ?? controller.options.first;

        return DropdownButtonHideUnderline(
          child: DropdownButton<LocaleOptions>(
            alignment: AlignmentDirectional.centerEnd,
            menuWidth: 180,
            iconSize: 0,
            value: currentOption,
            dropdownColor: Colors.grey.shade200,
            items: List.generate(
              controller.options.length,
              (index) {
                final option = controller.options[index];
                return DropdownMenuItem<LocaleOptions>(
                  value: option,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 8.0),
                          child: Text(
                            option.name.tr,
                            style: MyStyles.kFont18BlackW400,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: option.icon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            onChanged: (value) {
              controller.onChangeLocale(value!);
            },
          ),
        );
      },
    );
  }
}
