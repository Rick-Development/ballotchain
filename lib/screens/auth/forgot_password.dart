import 'package:ballotchain/screens/auth/reset_password_verification.dart';
import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:ballotchain/util/constants/image_constants.dart';
import 'package:ballotchain/widgets/custom_button.dart';
import 'package:ballotchain/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstants.forgotPasswordImage),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Forgot password?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Color(0xFF041549),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "No worries, we'll send you reset instructions.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF667085),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              label: "Email",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: "Enter your email",
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButton(
              label: "Reset password",
              onPressed: () {
                // TODO: Implement reset password logic
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ResetPasswordVerificationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
