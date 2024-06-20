import 'package:ballotchain/screens/wallet_screen.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({super.key});

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      child: const Icon(
        Icons.account_balance_wallet,
        color: Colors.grey,
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WalletScreen()),
        );
      },
    );
  }
}
