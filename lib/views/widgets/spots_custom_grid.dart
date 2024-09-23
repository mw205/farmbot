import 'package:farmbot/model/spots_data_model.dart';
import 'package:farmbot/views/widgets/soil_spot.dart';
import 'package:flutter/material.dart';

class SpotsCustomGrid extends StatelessWidget {
  const SpotsCustomGrid({
    super.key,
    required this.spotsDataList,
    required this.type,
  });
  final List<SpotsDataModel?> spotsDataList;
  final SoilSpotType type;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: spotsDataList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) {
        SpotsDataModel? spot = spotsDataList[index];
        return SoilSpot(
          name: spot!.name,
          value: spot.isDrought,
          spotNumber: index,
          type: type,
        );
      },
    );
  }
}
