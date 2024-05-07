import '../repository/onboarding_repository.dart';

class CalculateWaterIntakeUsecase {
  final OnboardingRepository repository;

  CalculateWaterIntakeUsecase({required this.repository});

  Future<double> execute({
    required String gender,
    required double weight,
    required String activity,
    required String weather,
  }) async {
    double waterIntake = 0.0;
    if (gender == 'Male') {
      waterIntake += weight * 35.0;
    } else if (gender == 'Female') {
      waterIntake += weight * 31.0;
    }
    if (activity == 'Intense exercise') {
      waterIntake += 500.0;
    } else if (activity == 'Moderate exercise') {
      waterIntake += 250.0;
    }
    if (weather == 'Warm') {
      waterIntake += 100.0;
    } else if (weather == 'Too hot') {
      waterIntake += 300.0;
    }
    return waterIntake;
  }
}
