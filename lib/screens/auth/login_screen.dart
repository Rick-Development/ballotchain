import 'package:ballotchain/screens/auth/sign_up_screen.dart';
import 'package:ballotchain/screens/mainScreen/pages/dashboard.dart';
import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:ballotchain/util/constants/image_constants.dart';
import 'package:ballotchain/widgets/custom_button.dart';
import 'package:ballotchain/widgets/custom_textform_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          child: Center(
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
                  "Log in",
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
                  "Welcome back! Please enter your details.",
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
                  label: "Email",
                  controller: _emailController,
                  hintText: "Enter your email",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  label: "Password",
                  obscureText: !_showPassword,
                  controller: _passwordController,
                  hintText: "Enter your password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: toggleVisibility,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // TODO: Implement remember me logic
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                          side: BorderSide(
                            color: ColorConstants.borderSide,
                          ),
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF344054),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      // TODO: Implement forgot password onTap
                      onPressed: () {
                        // Navigator.pushNamed(
                        //     context, ForgotPasswordScreen.route);
                      },
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF344054),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomButton(
                  onPressed: () {
                    // TODO: implement sign in function
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                    );
                  },
                  label: "Sign in",
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: implement google sign in
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
                          "Sign in with Google",
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
                      text: "Don't have an account? ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        // TODO - Implement sign up onTap
                        TextSpan(
                          text: "Sign up",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
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
      ),
    );
  }
}
