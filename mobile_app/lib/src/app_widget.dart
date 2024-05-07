import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:water/water_theme.dart';

import 'app_module.dart';

class WaterApp extends StatelessWidget {
  const WaterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: MaterialApp.router(
        title: 'Water App',
        theme: WaterTheme.themeData,
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}
