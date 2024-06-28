import 'package:ballotchain/screens/auth/email_verification_screen.dart';
import 'package:ballotchain/screens/auth/login_screen.dart';
import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:ballotchain/util/constants/image_constants.dart';
import 'package:ballotchain/widgets/custom_button.dart';
import 'package:ballotchain/widgets/custom_textform_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

  void toggleVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(ImageConstants.authLogo),
              ),
              const SizedBox(
                height: 42,
              ),
              Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.primaryColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "To sign up, fill in your personal details below",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.hintTextColor,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              CustomTextField(
                label: "Name",
                controller: _nameController,
                hintText: "Enter your name",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                label: "Email",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: "Enter your email",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                label: "Password",
                obscureText: !_showPassword,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                hintText: "Enter your password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: toggleVisibility,
                ),
              ),
              Text(
                "Must be at least 8 characters",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.hintTextColor,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                onPressed: () {
                  // TODO: implement sign up function
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmailVerificationScreen(),
                    ),
                  );
                },
                label: "Get Started",
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  // TODO: implement google sign up
                },
                child: Container(
                  height: 47,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: ColorConstants.borderSide,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageConstants.googleIcon),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "Sign up with Google",
                        style: TextStyle(
                          color: Color(0xFF344054),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      // TODO - Implement log in onTap
                      TextSpan(
                        text: "Log in",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorConstants.hintTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
