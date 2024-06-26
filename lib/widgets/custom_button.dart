// ignore_for_file: public_member_api_docs, sort_c
import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? width;
  final Color? btnColor;
  final Widget? child;
  final String label;
  final Color? labelColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.width,
    this.btnColor,
    this.child,
    required this.label,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 47,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: btnColor ?? ColorConstants.primaryColor,
        ),
        child: Center(
          child: child ??
              Text(
                label,
                style: TextStyle(
                  color: labelColor ?? ColorConstants.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
        ),
      ),
    );
  }
}
