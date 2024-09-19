import 'package:flutter/material.dart';

class TileModel {
  final Widget leadingIcon;
  final String title;
  final void Function()? onTap;
  final Widget? trailingIcon;
  TileModel({
    required this.leadingIcon,
    required this.title,
    this.onTap,
    this.trailingIcon,
  });
}
