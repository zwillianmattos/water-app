import 'package:flutter/material.dart';
import 'package:water/water_theme.dart';

import 'features/pages/splash/splash_page.dart';

class WaterApp extends StatelessWidget {
  const WaterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water App',
      theme: WaterTheme.themeData,
      home: const SplashPage(),
    );
  }
}
