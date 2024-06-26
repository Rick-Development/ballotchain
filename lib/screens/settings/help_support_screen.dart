import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: ColorConstants.primaryColor,
        foregroundColor: Colors.black,
      ),
      body: const Center(child: Text('Help & Support Screen')),
    );
  }
}
