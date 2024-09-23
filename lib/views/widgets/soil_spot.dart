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
    required this.value,
    required this.spotNumber,
    required this.name,
    required this.type,
  });
  final bool value;
  final int spotNumber;
  final String name;
  final SoilSpotType type;

  @override
  Widget build(BuildContext context) {
    LottieBuilder soilStatusAnimation(SoilSpotType type) {
      if (type == SoilSpotType.moisture) {
        return value
            ? Assets.animation.plant.lottie(
                repeat: false,
              )
            : Assets.animation.watering.lottie(
                repeat: true,
              );
      } else {
        return value
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
        return value ? "Good".tr : "Bad Water".tr;
      } else {
        return value ? "ripe".tr : "unripe".tr;
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
            color: value ? Colors.green : Colors.red,
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
              "${"Spot".tr} $spotNumber",
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
