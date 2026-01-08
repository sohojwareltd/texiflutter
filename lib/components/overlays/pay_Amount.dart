// 1. Import dart:ui to get access to ImageFilter
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';
import 'package:taxiflutter/components/text_fields/input_Text_field.dart';

class PayAmount extends StatelessWidget {
  final VoidCallback? onClose;

  const PayAmount({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.3), // A semi-transparent color as a backdrop tint
      child: BackdropFilter( // 2. Wrap the content with BackdropFilter
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4), // 3. Apply the blur effect
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              // The dialog's own color can also be slightly transparent
              color: const Color(0xFF142541).withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Fit content vertically
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row with Close Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: onClose ?? () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E2F4D), // A slightly different dark blue for contrast
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
                const SizedBox(height: 16),

                const Text(
                  'Payment',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold, // Added bold for emphasis
                  ),
                ),
                const SizedBox(height: 16),
                InputTextField(
                  hint: 'Enter amount', // Changed hint for clarity
                  controller: TextEditingController(),
                  fillColor: const Color(0xFF0E192B),
                  enableBorderColor: Colors.blue, // Cleaner look
                  focusedBorderColor: Colors.blue,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true), // Better keyboard for amounts
                ),
                const SizedBox(height: 24),
                NormalButton(
                  text: 'Add Amount',
                  textColor: Colors.white,
                  color: Colors.blue,
                  strokeColor: Colors.blue,
                  strokeWidth: 0,
                  onPressed: () {
                    // Example action: close the dialog
                    Navigator.of(context).pop();
                  },
                ),
                // The last SizedBox is often not needed when using MainAxisSize.min
              ],
            ),
          ),
        ),
      ),
    );
  }
}
