import 'package:flutter/material.dart';
import 'package:wear_plus/wear_plus.dart';

Widget buildWatchScaffold(body, floatingActionButton) {
  return AmbientMode(
    builder: (BuildContext context, WearMode mode, Widget? child) {
      return WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
          return Scaffold(
            body: body,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      );
    },
  );
}
