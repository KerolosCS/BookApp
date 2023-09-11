import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.style,
    required this.buttonBackgroundColor,
    required this.borderRadius,
    required this.txt,
    this.onPressed,
  });
  final TextStyle style;
  final Color buttonBackgroundColor;
  final BorderRadiusGeometry borderRadius;
  final String txt;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: Text(
          txt,
          style: style,
        ),
      ),
    );
  }
}
