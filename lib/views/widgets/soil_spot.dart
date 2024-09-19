import 'dart:math';

import 'package:farmbot/constants/my_styles.dart';
import 'package:farmbot/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

enum SoilSpotType { moisture, maturity }

class SoilSpot extends StatelessWidget {
  const SoilSpot({
    super.key,
    required this.spotNumber,
    required this.rowNumber,
    required this.type,
  });
  final int spotNumber;
  final int rowNumber;
  final SoilSpotType type;

  @override
  Widget build(BuildContext context) {
    int x = Random().nextInt(2);

    LottieBuilder soilStatusAnimation(SoilSpotType type) {
      if (type == SoilSpotType.moisture) {
        return x == 1
            ? Assets.animation.plant.lottie(
                repeat: false,
              )
            : Assets.animation.watering.lottie(
                repeat: true,
              );
      } else {
        return x == 1
            ? Assets.animation.ripe.lottie(
                repeat: true,
              )
            : Assets.animation.unripe.lottie(
                repeat: false,
              );
      }
    }

    String soilStatusText() {
      if (type == SoilSpotType.moisture) {
        return x == 1 ? "Good".tr : "Bad Water".tr;
      } else {
        return x == 1 ? "ripe".tr : "unripe".tr;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: x == 1 ? Colors.green : Colors.red,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 80,
              height: 100,
              child: soilStatusAnimation(type),
            ),
            Text(
              textAlign: TextAlign.center,
              "${"Spot".tr} ${spotNumber * rowNumber}",
              style: MyStyles.kFont20BlackW400,
            ),
            const Gap(5),
            Text(
              textAlign: TextAlign.center,
              soilStatusText(),
              style: MyStyles.kFont20BlackW400,
            ),
          ],
        ),
      ),
    );
  }
}
