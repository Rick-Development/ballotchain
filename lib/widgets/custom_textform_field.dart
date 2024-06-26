import 'package:ballotchain/util/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintTextStyle;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? borderRadius;
  final EdgeInsets? margin;
  final int? maxLines;

  const CustomTextField({
    super.key,
    required this.label,
    this.labelStyle,
    required this.controller,
    required this.hintText,
    this.hintTextStyle,
    this.fillColor,
    this.keyboardType,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.margin,
    this.borderRadius,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF344054),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              fillColor: fillColor ?? ColorConstants.whiteColor,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorConstants.hintTextColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 12),
                borderSide: BorderSide(
                  color: ColorConstants.borderSide,
                  width: 0.5,
                ),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
