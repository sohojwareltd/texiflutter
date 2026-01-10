import 'package:flutter/material.dart';
import 'package:taxiflutter/color_Theme/color_theme.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';


class ReceiptOptionsQr extends StatelessWidget {
  final VoidCallback onClose;

  const ReceiptOptionsQr({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 140),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue, width: 0.5),
        color: const Color(0xFF142541).withOpacity(0.6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Scan to get your receipt',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 26,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 38),

          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/images/qrcode.png'),
          ),
          const SizedBox(height: 30),

          Text(
            'No receipt needed',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
              decoration: TextDecoration.underline,
              decorationThickness: 1.5,
              decorationColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
