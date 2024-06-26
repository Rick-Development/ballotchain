import 'package:ballotchain/screens/auth/login_screen.dart';
import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:ballotchain/util/constants/image_constants.dart';
import 'package:ballotchain/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstants.onboardingImage),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  "Interaktiv skrivtavla söbel. Spepav.",
                  style: GoogleFonts.montserrat(
                    fontSize: 25.76,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Sign in to explore changes we've made.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: CustomButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              label: "Sign in",
              btnColor: ColorConstants.whiteColor,
              labelColor: ColorConstants.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
