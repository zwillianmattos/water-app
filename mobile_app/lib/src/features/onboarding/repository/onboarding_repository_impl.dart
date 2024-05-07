
import 'package:mobile_app/src/features/onboarding/repository/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  @override
  Future<void> saveOnboardingData({
    required String gender,
    required double weight,
    required String activity,
    required String weather,
  }) async {
    // Implemente aqui a lógica para salvar os dados no Firebase
  }
}