import 'dart:ui';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.buttonLabel,
    required this.buttonColor,
  });
  final Function onPressed;
  final String buttonLabel;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        buttonLabel,
        style: TextStyle(color: buttonColor, fontSize: 12),
      ),
    );
  }
}
