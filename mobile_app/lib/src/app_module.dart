import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_app/src/features/home/home_page.dart';
import 'package:mobile_app/src/features/onboarding/repository/onboarding_repository.dart';
import 'package:mobile_app/src/features/onboarding/repository/onboarding_repository_impl.dart';
import 'package:mobile_app/src/features/onboarding/ui/onboarding_controller.dart';
import 'package:mobile_app/src/features/onboarding/ui/onboarding_page.dart';
import 'package:mobile_app/src/features/onboarding/usecases/calculate_water_intake_usecase.dart';
import 'package:mobile_app/src/features/splash/ui/splash_page.dart';

class AppModule extends Module {
  @override
  void binds(i) async {
    i.addSingleton<OnboardingRepository>(OnboardingRepositoryImpl.new);
    i.addSingleton(CalculateWaterIntakeUsecase.new);
    i.addSingleton(OnboardingController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const SplashPage());
    r.child('/onboarding', child: (_) => const OnboardingPage());
    r.child('/home', child: (_) => const HomePage());
  }
}
