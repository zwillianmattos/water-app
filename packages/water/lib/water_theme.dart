import 'package:flutter/material.dart';
import 'package:water/colors.dart';

class WaterTheme {
  static final ThemeData themeData = ThemeData(
    primaryColor: WaterColors.primary,
    hintColor: WaterColors.secondary,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: WaterColors.primaryText),
      labelLarge: TextStyle(color: WaterColors.neutralText),
      bodyMedium: TextStyle(color: WaterColors.secondaryText),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? WaterColors.primary
            : WaterColors.primaryText,
      ),
      trackOutlineWidth: MaterialStatePropertyAll(1),
      trackOutlineColor: MaterialStatePropertyAll(
        WaterColors.secondaryText,
      ),
      trackColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? WaterColors.background
            : null,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: WaterColors.primary,
      onPrimary: WaterColors.neutralText,
      secondary: WaterColors.secondary,
      onSecondary: WaterColors.secondaryText,
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      background: WaterColors.background,
      onBackground: WaterColors.primaryText,
      surface: WaterColors.background,
      onSurface: WaterColors.primaryText,
    ),
    useMaterial3: true,
  );
}
