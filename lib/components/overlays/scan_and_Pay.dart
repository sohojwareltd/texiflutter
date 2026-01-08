import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:taxiflutter/components/labels/qr_Payment.dart';

import '../buttons/normal_Button.dart';
import '../text_fields/input_Text_field.dart';

class ScanAndPay extends StatelessWidget {
  final VoidCallback? onClose;

  const ScanAndPay({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5), // Semi-transparent background
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            // Prevents touching screen edges
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF142541).withOpacity(0.6), // Dark blue background
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue,width: 0.5)
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

                Center(
                  child: Text(
                    'Scan and Pay',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                    child: Image.asset('assets/images/qrcode.png')),

                const SizedBox(height: 24),

                Center(
                  child: QrPayment(
                    label: 'QR Payment',
                    icon: Icons.qr_code,
                    onPressed: () {},
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
