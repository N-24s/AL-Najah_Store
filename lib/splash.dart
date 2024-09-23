import 'package:al_najah_store/onboarding/onboarding.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
            ],
          ),
        
          childWidget: SizedBox(
            height: 300,
            width: 200,
            child: Image.asset("assets/logo/logo1.png"),
          ),
          duration: const Duration(seconds: 5),
          animationDuration: const Duration(seconds: 10),
          nextScreen: OnboardingScreen(),
        );
  }
}