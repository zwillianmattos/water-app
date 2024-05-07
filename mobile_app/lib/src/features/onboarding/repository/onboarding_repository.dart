abstract class OnboardingRepository {
  Future<void> saveOnboardingData({
    required String gender,
    required double weight,
    required String activity,
    required String weather,
  });
}