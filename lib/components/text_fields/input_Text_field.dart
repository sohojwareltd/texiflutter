import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Color fillColor;
  final Color enableBorderColor;
  final Color focusedBorderColor;
  final TextInputType keyboardType;

  // 1. Add new parameters for text colors
  final Color textColor;
  final Color hintColor;

  const InputTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.fillColor,
    required this.enableBorderColor,
    required this.focusedBorderColor,
    this.keyboardType = TextInputType.text, // Made keyboardType optional with a default

    // 2. Initialize new parameters with default values
    this.textColor = Colors.white, // Default text color is white
    this.hintColor = Colors.white54, // Default hint color is semi-transparent white
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,

      // 3. Apply the parameterized text color
      style: TextStyle(color: textColor),

      decoration: InputDecoration(
        hintText: hint,

        // 4. Apply the parameterized hint color
        hintStyle: TextStyle(color: hintColor),

        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: enableBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
    );
  }
}
