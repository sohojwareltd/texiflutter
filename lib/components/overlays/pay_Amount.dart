// In lib/components/overlays/pay_Amount.dart

import 'dart:ui';
import 'package:flutter/material.dart';

import '../buttons/normal_Button.dart';
import '../text_fields/input_Text_field.dart';
// ... other imports

class PayAmount extends StatelessWidget {
  final VoidCallback? onClose;
  // This function will be called with the new amount
  final ValueChanged<String>? onAmountAdded;

  // Controller to get the text from the InputTextField
  final TextEditingController _amountController = TextEditingController();

  PayAmount({
    super.key,
    this.onClose,
    this.onAmountAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.3),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Center(
          child: Container(
            // ... your container styling ...
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF142541).withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.withOpacity(0.5),width: 0.5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: onClose ?? () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E2F4D),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.close, color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Payment', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                InputTextField(
                  hint: 'Enter amount',
                  controller: _amountController, // Use the controller
                  fillColor: const Color(0xFF0E192B),
                  enableBorderColor: Colors.transparent,
                  focusedBorderColor: Colors.blue,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 24),
                NormalButton(
                  text: 'Add Amount',
                  onPressed: () {
                    final enteredAmount = _amountController.text;
                    // Check if the input is not empty
                    if (enteredAmount.isNotEmpty) {
                      // Call the function passed from ForHire
                      onAmountAdded?.call(enteredAmount);
                    }
                  },
                  textColor: Colors.white,
                  color: Colors.blue,
                  strokeColor: Colors.blue,
                  strokeWidth: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
