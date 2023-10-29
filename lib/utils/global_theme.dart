import 'package:asa/styles/color_constants.dart';
import 'package:flutter/material.dart';

ThemeData globalTheme() {
  return ThemeData(
    fontFamily: "Hauora",
    scaffoldBackgroundColor: ColorConstants.slate[25],
    colorScheme: appColorScheme,
  );
}
