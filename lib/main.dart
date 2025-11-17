import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const CropIntelliApp());
}

class CropIntelliApp extends StatelessWidget {
  const CropIntelliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CropIntelli',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(), // SIN const
    );
  }
}
