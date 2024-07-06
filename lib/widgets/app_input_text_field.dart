import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData prefixIcon;

  // Add the input formatter here
  final List<TextInputFormatter>? inputFormatters;

  const AppInputTextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.prefixIcon,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}

class AppButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final Color borderColor;

  const AppButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.titleColor,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: titleColor, backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor),
      ),
      child: Text(title),
    );
  }
}
