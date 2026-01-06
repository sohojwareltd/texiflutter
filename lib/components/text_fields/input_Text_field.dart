import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  String hint;
  TextEditingController controller;
  final Color fillColor;
  final Color enableBorderColor;
  final Color focusedBorderColor;
  late final keyboardType;

  InputTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.fillColor,
    required this.enableBorderColor,
    required this.focusedBorderColor,
    required this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: enableBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
    );
  }
}
