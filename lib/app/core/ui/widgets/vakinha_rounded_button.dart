import 'package:flutter/material.dart';

class VakinhaRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double fontSize;

  const VakinhaRoundedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.fontSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(shape: CircleBorder(), backgroundColor: Colors.white),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
