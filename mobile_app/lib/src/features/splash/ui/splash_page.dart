import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app/shared/widgets/scafold_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _lottieController;
  bool _showLogo = false;

  @override
  void initState() {
    super.initState();
    _lottieController = AnimationController(vsync: this);
    _lottieController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showLogo = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWater(
      body: (isWatch) => Stack(
        children: [
          _background(),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: _logo(),
          ),
        ],
      ),
    );
  }

  _background() {
    return Lottie.asset(
      controller: _lottieController,
      onLoaded: (composition) {
        _lottieController
          ..duration = composition.duration
          ..forward();
      },
      'assets/waves.json',
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }

  _logo() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _showLogo ? 1.0 : 0.0,
      child: Image.asset('assets/images/logo.png', scale: 1.2,),
      onEnd: () {
        Modular.to.pushReplacementNamed('/onboarding');
      },
    );
  }
}
