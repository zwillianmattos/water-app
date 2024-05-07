import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mobile_app/shared/widgets/scafold_widget.dart';
import 'package:mobile_app/src/features/home/modals/settings_modal.dart';
import 'package:water/water.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWater(
      floatingActionButton: WFloatButton(
          icon: const Icon(
            Icons.add,
            size: 32,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Water",
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WFloatButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove,
                            size: 32,
                          ),
                        ),
                        const Text(
                          "50ml",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: WaterColors.primaryText),
                        ),
                        WFloatButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 32,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            );
          }),
      body: (bool isWatch) {
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: isWatch
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(IconlyLight.notification),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        useSafeArea: true,
                        builder: (BuildContext context) {
                          return ScaffoldWater(
                            body: ((isWatch) {
                              return SettingPage(isWatch: isWatch);
                            }),
                          );
                        },
                      );
                    },
                    icon: const Icon(IconlyLight.setting),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ProgressDoughnutChart(
              progress: 0,
              backgroundColor: const Color(0xFFE0FAFF),
              label: '1200ml / 3500ml',
            ),
          ],
        );
      },
    );
  }
}
