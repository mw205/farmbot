import 'package:flutter/material.dart';

class DrawerOptions {
  final Widget icon;
  final String title;
  final void Function() onTap;

  DrawerOptions({required this.icon, required this.title, required this.onTap});
}
