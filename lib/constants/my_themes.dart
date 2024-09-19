import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';
import 'my_strings.dart';

class MyThemes {
  static ThemeData themeData = ThemeData(
    fontFamily: MyStrings.kPrimaryFontFamily,
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorName.green,
      selectionColor: ColorName.green.withOpacity(0.25),
      selectionHandleColor: ColorName.green,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
  );
}
