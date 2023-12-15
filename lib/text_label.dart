import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  const TextLabel({
    Key? key,
    required this.label,
    required this.textColor,
    required this.textToDisplay,
  }) : super(key: key);

  final String label;
  final Color textColor;
  final String textToDisplay;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: label),
          TextSpan(
            text: textToDisplay,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}
