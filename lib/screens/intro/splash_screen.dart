import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:ballotchain/screens/intro/onboarding_screen.dart';
import 'package:ballotchain/util/constants/image_constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.gif(
        gifPath: ImageConstants.splashImage,
        backgroundColor: const Color(0XFF081B2D),
        gifWidth: 269,
        gifHeight: 474,
        nextScreen: const OnboardingScreen(),
        duration: const Duration(milliseconds: 1800),
        onInit: () async {
          debugPrint("onInit");
        },
        onEnd: () async {
          debugPrint("onEnd 1");
        },
      ),
    );
  }
}
