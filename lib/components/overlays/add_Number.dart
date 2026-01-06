import 'package:flutter/material.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';
import 'package:taxiflutter/components/labels/push2Pay.dart';
import 'package:taxiflutter/components/text_fields/input_Text_field.dart';

class AddNumber extends StatelessWidget {
  final String title;
  final String buttonText;
  final String hintText;
  final String initialCountryCode;
  final VoidCallback? onClose;
  final TextEditingController controller;
  final Function(String countryCode, String phoneNumber)? onSendRequest;

  const AddNumber({
    super.key,
    this.title = 'Add number',
    this.buttonText = 'Send payment request',
    this.hintText = 'Write in number..',
    this.initialCountryCode = '+47',
    this.onClose,
    this.onSendRequest,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // The unused 'phoneController' has been removed.

    // Wrap the widget with Material to provide a canvas for Material Design
    // widgets like TextField and prevent the 'No Material widget found' error.
    // Setting the color to transparent makes the underlying screen visible.
    return Material(
      color: Colors.black.withOpacity(0.5), // Semi-transparent background
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24), // Prevents touching screen edges
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1B2D4A), // Dark blue background
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Fit content vertically
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row with Badge and Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Push2pay(onTap: () {}),
                  GestureDetector(
                    onTap: onClose ?? () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFF142136),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Title
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),

              // Input Field Box
              Row(
                children: [
                  DropdownButton<String>(
                    value: initialCountryCode,
                    underline: const SizedBox(),
                    dropdownColor: const Color(0xFF1B2D4A),
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    items: [initialCountryCode].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  const SizedBox(width: 8), // Add some spacing
                  // FIX: Wrap the InputTextField with Expanded
                  Expanded(
                    child: InputTextField(
                      hint: hintText,
                      keyboardType: TextInputType.phone,
                      enableBorderColor: const Color(0xFF086CBF),
                      fillColor: const Color(0xFF0E192B),
                      focusedBorderColor: Colors.white,
                      controller: controller,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Action Button
              Center(
                child: NormalButton(
                  text: 'Send Payment Request',
                  textColor: Colors.white,
                  color: const Color(0xFF086CBF),
                  strokeColor: const Color(0xFF086CBF),
                  strokeWidth: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
