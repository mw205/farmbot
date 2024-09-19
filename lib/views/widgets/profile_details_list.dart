import 'package:farmbot/constants/my_styles.dart';
import 'package:farmbot/gen/colors.gen.dart';
import 'package:farmbot/model/settings_model.dart';
import 'package:flutter/material.dart';

class ProfileDetailsList extends StatelessWidget {
  const ProfileDetailsList({
    super.key,
    required this.tiles,
  });

  final List<TileModel> tiles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          TileModel tile = tiles[index];
          return ListTile(
            leading: tile.leadingIcon,
            title: Text(
              tile.title,
              style: MyStyles.kFont25BlackW700,
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
              indent: 15,
              endIndent: 15,
              color: ColorName.beige,
            ),
        itemCount: tiles.length);
  }
}
