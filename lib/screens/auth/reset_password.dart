import 'package:ballotchain/screens/auth/login_screen.dart';
import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:ballotchain/util/constants/image_constants.dart';
import 'package:ballotchain/widgets/custom_button.dart';
import 'package:ballotchain/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _showPassword = false;

  void toggleVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstants.forgotPasswordImage),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Set new password",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: ColorConstants.primaryColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Your new password must be different to previously used passwords.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorConstants.hintTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              label: "Password",
              controller: _passwordController,
              obscureText: !_showPassword,
              keyboardType: TextInputType.visiblePassword,
              hintText: "Enter your password",
              suffixIcon: IconButton(
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: toggleVisibility,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: "Confirm password",
              obscureText: !_showPassword,
              controller: _confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              hintText: "Confirm your new password",
              suffixIcon: IconButton(
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: toggleVisibility,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButton(
              onPressed: () {
                // TODO: implement reset password function
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PasswordResetSuccess(),
                  ),
                );
              },
              label: "Reset Password",
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordResetSuccess extends StatelessWidget {
  const PasswordResetSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstants.congratulationsImage),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Password changed succesfully",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.primaryColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "You can now login to Ballot Chain with your new password credentials",
              style: TextStyle(
                color: Color(0xFF758494),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 45,
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
                label: "Continue")
          ],
        ),
      ),
    );
  }
}
