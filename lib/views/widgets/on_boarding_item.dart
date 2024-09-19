import 'package:farmbot/constants/my_styles.dart';
import 'package:farmbot/model/on_boarding_item_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.item,
  });
  final OnBoardingItemModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 350,
          child: item.image,
        ),
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            item.title.tr,
            textAlign: TextAlign.center,
            style: MyStyles.kFont25BlackW700,
          ),
        ),
      ],
    );
  }
}
