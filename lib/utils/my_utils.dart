import 'package:flutter/material.dart';

class MyScreenUtils {
  static double h = 0;
  static double w = 0;
  static bool isTablet = false;

  static void initUtils(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    isTablet = MediaQuery.of(context).size.shortestSide >= 600;
  }
}
