import 'package:flutter/material.dart';
import 'package:taxiflutter/color_Theme/color_theme.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';

class ReceiptSent extends StatelessWidget {
  final bool isPayment;
  final VoidCallback onClose;
  final String tripId;
  final String amount;

  const ReceiptSent({
    super.key,
    required this.isPayment,
    required this.onClose,
    required this.tripId,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 140),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
        color: const Color(0xFF142541).withOpacity(0.6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0x3321375A),
            ),
            child: isPayment? Icon(Icons.check, color: Color(0XFF60A5FA)) : Icon(Icons.close_rounded, color: Colors.red),
          ),

          const SizedBox(height: 35),

          Text(
            isPayment ? 'Receipt sent!' : 'Payment failed!',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 28,
              color: isPayment ? Colors.white : Colors.red,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 12),

          Text(
            isPayment ? 'Thank you for choosing 2iZii Taxi' : 'Insufficient funds',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          Text(
            'Trip ID: $tripId',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff88BCFB),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Total amount: \$$amount',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff88BCFB),
            ),
          ),

          const SizedBox(height: 26),
          Divider(
            thickness: 1,
            color: Color(0XFF485976),
            endIndent: 20,
            indent: 20,
          ),
          const SizedBox(height: 36),
          NormalButton(
            text: isPayment ? 'Done' : 'Try again',
            textColor: Colors.white,
            color: isPayment? Colors.blue: Colors.transparent,
            strokeColor: Colors.blue,
            strokeWidth: isPayment? 0: 1,
            onPressed: isPayment? onClose: onClose,
          ),
        ],
      ),
    );
  }
}
