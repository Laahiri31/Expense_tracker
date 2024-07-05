import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbuttonWidget extends StatelessWidget {
  AppbuttonWidget({
    Key? key,
    required this.title,
    required this.titleColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final Color borderColor;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ,
      child: Container(
        width: 350,
        height: 48,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: titleColor,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: backgroundColor,
          border: Border.all(
            color: borderColor, 
            width: 1, 
          ),
        ),
      ),
    );
  }
}

