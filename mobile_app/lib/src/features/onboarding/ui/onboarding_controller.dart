import 'package:flutter/material.dart';

import '../usecases/calculate_water_intake_usecase.dart';

class OnboardingController {
  final CalculateWaterIntakeUsecase calculateWaterIntakeUsecase;

  OnboardingController({required this.calculateWaterIntakeUsecase});

  final ValueNotifier<String> genderNotifier = ValueNotifier<String>('');
  final ValueNotifier<double> weightNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<String> activityNotifier = ValueNotifier<String>('');
  final ValueNotifier<String> weatherNotifier = ValueNotifier<String>('');

  final ValueNotifier<double> goalNotifier = ValueNotifier<double>(0.0);

  void dispose() {
    genderNotifier.dispose();
    weightNotifier.dispose();
    activityNotifier.dispose();
    weatherNotifier.dispose();
    goalNotifier.dispose();
  }

  Future<void> calculateRecommendedWaterIntake() async {
    String gender = genderNotifier.value;
    double weight = weightNotifier.value;
    String activity = activityNotifier.value;
    String weather = weatherNotifier.value;
    
    double intake = await calculateWaterIntakeUsecase.execute(
      gender: gender,
      weight: weight,
      activity: activity,
      weather: weather,
    );

    goalNotifier.value = intake;
  }
}
