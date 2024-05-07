import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';
import 'package:rotary_scrollbar/rotary_scrollbar.dart';
import 'package:water/water.dart';

class SettingPage extends StatefulWidget {
  final bool isWatch;
  const SettingPage({super.key, required this.isWatch});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> implements Disposable {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget menus = Container(
      color: WaterColors.background,
      child: ListView(
        controller: scrollController,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Center(
              child: Text(
                "Menu",
                style: TextStyle(color: WaterColors.primaryText),
              ),
            ),
          ),
          WListItem(
            label: 'Drink Log',
            trailing: const Icon(IconlyLight.arrow_right_2),
            onTap: () {},
          ),
          WListItem(
            label: 'Drink Report',
            trailing: const Icon(IconlyLight.arrow_right_2),
            onTap: () {},
          ),
          WListItem(
            label: 'Settings',
            trailing: const Icon(IconlyLight.arrow_right_2),
            onTap: () {},
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );

    return widget.isWatch
        ? RotaryScrollWrapper(
            rotaryScrollbar: RotaryScrollbar(
              autoHide: false,
              controller: scrollController,
            ),
            child: menus,
          )
        : menus;
  }
}
