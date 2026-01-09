import 'package:flutter/material.dart';

class AskingForRecipt extends StatelessWidget {
  final VoidCallback onSmsPressed;
  final VoidCallback onEmailPressed;
  final VoidCallback onQrPressed;
  final VoidCallback onCancelPressed;

  const AskingForRecipt({
    super.key,
    required this.onSmsPressed,
    required this.onEmailPressed,
    required this.onQrPressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Styling constants to match the image
    final Color backgroundColor = Color(0xFF1D2D44);
    final Color buttonColor = Color(0xFF263A56);
    final double buttonWidth = double.infinity;
    final double buttonHeight = 80.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 137),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue,width: 0.5),

      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'How would you like your receipt?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 32),

          // SMS Button
          _buildActionButton(label: 'SMS', color: buttonColor, height: buttonHeight, width: buttonWidth, onTap: onSmsPressed),
          const SizedBox(height: 16),

          // Email Button
          _buildActionButton(label: 'Email', color: buttonColor, height: buttonHeight, width: buttonWidth, onTap: onEmailPressed),
          const SizedBox(height: 16),

          // QR Button
          _buildActionButton(label: 'QR', color: buttonColor, height: buttonHeight, width: buttonWidth, onTap: onQrPressed),
          const SizedBox(height: 24),

          // Cancel Text Button
          TextButton(
            onPressed: onCancelPressed,
            child: const Text(
              'No receipt needed',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color color,
    required double height,
    required double width,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}