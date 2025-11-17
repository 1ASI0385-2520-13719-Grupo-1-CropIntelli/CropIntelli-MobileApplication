import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFFF2E8D5);
  static const primary = Color(0xFF2F6B3D);
  static const inputBackground = Color(0xFFF4E3B2);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primary),
    ),
  );
}
