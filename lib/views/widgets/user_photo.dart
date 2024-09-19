import 'package:cached_network_image/cached_network_image.dart';
import 'package:farmbot/constants/my_strings.dart';
import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({super.key, @required this.imagePath});
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            imagePath ?? MyStrings.profilePhoto,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
