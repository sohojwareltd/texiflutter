import 'package:flutter/material.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';
import 'package:taxiflutter/components/text_fields/input_Text_field.dart';

class PayAmount extends StatelessWidget {
  final VoidCallback? onClose;

  const PayAmount({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5), // Semi-transparent background
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          // Prevents touching screen edges
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
                mainAxisAlignment: MainAxisAlignment.end,
                // Aligns child to the end (right)
                children: [
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

              const SizedBox(height: 24),

              Text('Payment', style: TextStyle(color: Colors.white,fontSize: 26)),
              const SizedBox(height: 16),
              InputTextField(
                hint: 'Write somthing',
                controller: TextEditingController(),
                fillColor: Color(0xFF0E192B),
                enableBorderColor: Colors.blue,
                focusedBorderColor: Colors.blue,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              NormalButton(
                text: 'Add Amount',
                textColor: Colors.white,
                color: Colors.blue,
                strokeColor: Colors.blue,
                strokeWidth: 0,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
