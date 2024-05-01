import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_app/src/features/splash/ui/splash_page.dart';
class AppModule extends Module {
  // @override
  // void binds(i) async {
  // }
  
  @override
  void routes(r) {
    r.child('/', child: (_) => const SplashPage());
  }
}
