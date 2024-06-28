import 'dart:async';

import 'package:ballotchain/screens/auth/login_screen.dart';
import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:ballotchain/util/constants/image_constants.dart';
import 'package:ballotchain/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  Timer? _timer;
  int _start = 120;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;

    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstants.authLogo),
            const SizedBox(
              height: 35,
            ),
            Image.asset(ImageConstants.emailVerificationImage),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Check your email",
              style: TextStyle(
                color: Color(0xFF041459),
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "We have sent to a verification email to ",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    // TODO: Replace with actual email
                    text: "john123@gmail.com",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              style: TextStyle(
                color: Color(0xFF758494),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Didn't get the email?",
              style: TextStyle(
                color: Color(0xFF041459),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: _start == 0
                  ? Column(
                      children: [
                        CustomButton(
                          onPressed: _start == 0
                              ? () {
                                  setState(() {
                                    _start = 120;
                                    startTimer();
                                  });
                                }
                              : null,
                          width: 120,
                          height: 30,
                          label: "Resend email",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageConstants.warningIcon),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Resend email in ',
                              ),
                              TextSpan(
                                text:
                                    "${minutes.toString().padLeft(2, '0')}:${seconds.toString()}",
                              ),
                            ],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF718096),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              label: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
