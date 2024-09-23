import 'package:farmbot/controllers/home_controller.dart';
import 'package:farmbot/views/widgets/soil_spot.dart';
import 'package:farmbot/views/widgets/spots_custom_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CropMaturityTable extends StatelessWidget {
  const CropMaturityTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetX<HomeController>(
        builder: (controller) {
          return !controller.isLoading.value &&
                  controller.spotsDataList.value != null &&
                  controller.spotsDataList.value!.isNotEmpty
              ? SpotsCustomGrid(
                  spotsDataList: controller.spotsDataList.value!,
                  type: SoilSpotType.maturity)
              : const SizedBox();
        },
      ),
    );
  }
}
