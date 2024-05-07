import 'dart:async';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

import 'mobile.dart';
import 'watch.dart';

class ScaffoldWater extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Function(bool isWatch) body;

  const ScaffoldWater({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
  });

  @override
  State<ScaffoldWater> createState() => _ScaffoldWaterState();
}

class _ScaffoldWaterState extends State<ScaffoldWater> {
  late bool _isWatch = false;

  @override
  void initState() {
    super.initState();
    _checkDeviceType();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> _checkDeviceType() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool isWatch = await _isRunningOnWatch();
      setState(() {
        _isWatch = isWatch;
      });
    });
  }

  Future<bool> _isRunningOnWatch() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Theme.of(context).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.systemFeatures.contains("android.hardware.type.watch");
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.model.toLowerCase().contains("watch");
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return _isWatch
        ? buildWatchScaffold(
            widget.body(_isWatch),
            widget.floatingActionButton,
          )
        : buildPhoneScaffold(
            widget.appBar,
            widget.body(_isWatch),
            widget.floatingActionButton,
          );
  }
}
