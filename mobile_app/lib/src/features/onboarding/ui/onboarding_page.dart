import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_app/shared/widgets/scafold_widget.dart';
import 'package:water/water.dart';

import 'onboarding_controller.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final OnboardingController controller = Modular.get<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWater(
      appBar: const WAppBar(
        title: 'Onboarding',
      ),
      body: (bool isWatch) {
        return Container(
          color: WaterColors.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Configure information for a recommended water drinking goal",
                  style:
                      TextStyle(color: WaterColors.primaryText, fontSize: 16),
                ),
              ),
              Column(
                children: [
                  WListItem(
                    label: 'Gender',
                    trailing: ValueListenableBuilder<String>(
                      valueListenable: controller.genderNotifier,
                      builder: (context, value, child) {
                        return Text(
                          value.isNotEmpty ? value : 'Select',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      _showGenderPicker();
                    },
                  ),
                  WListItem(
                    label: 'Weight',
                    trailing: ValueListenableBuilder<double>(
                      valueListenable: controller.weightNotifier,
                      builder: (context, value, child) {
                        return Text(
                          value != 0.0
                              ? '${value.toStringAsFixed(1)} kg'
                              : 'Select',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      _showWeightPicker();
                    },
                  ),
                  WListItem(
                    label: 'Daily Activities',
                    trailing: ValueListenableBuilder<String>(
                      valueListenable: controller.activityNotifier,
                      builder: (context, value, child) {
                        return Text(
                          value.isNotEmpty ? value : 'Select',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      _showActivityPicker();
                    },
                  ),
                  WListItem(
                    label: 'Weather',
                    trailing: ValueListenableBuilder<String>(
                      valueListenable: controller.weatherNotifier,
                      builder: (context, value, child) {
                        return Text(
                          value.isNotEmpty ? value : 'Select',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      _showWeatherPicker();
                    },
                  ),
                ],
              ),
              WOutlinedButton(
                label: 'Get recommended quantity',
                onPressed: () {
                  controller.calculateRecommendedWaterIntake();
                },
              ),
              ValueListenableBuilder(
                valueListenable: controller.goalNotifier,
                builder: (context, value, snapshot) {
                  if (value > 0) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      padding: const EdgeInsets.all(16.0),
                      width: MediaQuery.sizeOf(context).width,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: WaterColors.primary,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Daily Goal (recommended)",
                            style: TextStyle(
                              color: WaterColors.secondary,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${value.toStringAsFixed(0)} ml",
                            style: const TextStyle(
                              color: WaterColors.secondary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              WTextButton(onPressed: () {}, label: 'next')
            ],
          ),
        );
      },
    );
  }

  void _showGenderPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: ListView(
            children: [
              const Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Gender",
                    style: TextStyle(
                      color: WaterColors.primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              WListItem(
                label: 'Female',
                onTap: () {
                  Navigator.of(context).pop('Female');
                },
              ),
              WListItem(
                label: 'Male',
                onTap: () {
                  Navigator.of(context).pop('Male');
                },
              ),
            ],
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        controller.genderNotifier.value = value;
      }
    });
  }

  void _showWeightPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return ValueListenableBuilder(
                valueListenable: controller.weightNotifier,
                builder: (context, value, snapshot) {
                  return SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                            color: WaterColors.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        WeightRuler(
                          minValue: 0,
                          maxValue: 300,
                          step: 0.1,
                          initialValue: value,
                          onChanged: (value) {
                            setState(() {
                              controller.weightNotifier.value = value;
                            });
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('0 kg'),
                              Text('300 kg'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        WTextButton(
                          label: 'Confirm',
                          onPressed: () {
                            Navigator.of(context).pop(value);
                          },
                        ),
                      ],
                    ),
                  );
                });
          },
        );
      },
    ).then((value) {
      if (value != null) {
        controller.weightNotifier.value = value;
      }
    });
  }

  void _showActivityPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Daily Activities",
                  style: TextStyle(
                    color: WaterColors.primaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            WListItem(
              label: 'No exercise habit',
              onTap: () {
                Navigator.of(context).pop('No exercise habit');
              },
            ),
            WListItem(
              label: 'Light exercise (e.g. walking, household chores, etc.)',
              onTap: () {
                Navigator.of(context).pop('Light exercise');
              },
            ),
            WListItem(
              label: 'Moderate exercise (e.g. brisk walking, running, etc.)',
              onTap: () {
                Navigator.of(context).pop('Moderate exercise');
              },
            ),
            WListItem(
              label: 'Intense exercise (e.g. fast running, jumping rope, etc.)',
              onTap: () {
                Navigator.of(context).pop('Intense exercise');
              },
            ),
          ],
        );
      },
    ).then((value) {
      if (value != null) {
        controller.activityNotifier.value = value;
      }
    });
  }

  void _showWeatherPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Weather",
                  style: TextStyle(
                    color: WaterColors.primaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            WListItem(
              label: 'Cold',
              onTap: () {
                Navigator.of(context).pop('Cold');
              },
            ),
            WListItem(
              label: 'Moderate',
              onTap: () {
                Navigator.of(context).pop('Moderate');
              },
            ),
            WListItem(
              label: 'Warm',
              onTap: () {
                Navigator.of(context).pop('Warm');
              },
            ),
            WListItem(
              label: 'Too hot',
              onTap: () {
                Navigator.of(context).pop('Too hot');
              },
            ),
          ],
        );
      },
    ).then((value) {
      if (value != null) {
        controller.weatherNotifier.value = value;
      }
    });
  }
}
