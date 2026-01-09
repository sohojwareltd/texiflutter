import 'package:flutter/material.dart';
import 'package:taxiflutter/components/buttons/medium_Button.dart';

class PaymentCompleted extends StatelessWidget {
  final bool isPayment;
  final String tripId;
  final String amount;

  const PaymentCompleted({
    super.key,
    required this.isPayment,
    required this.tripId,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 77),
      decoration: BoxDecoration(
          color: Color(0xFF142541).withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue,width: 0.5)
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
            child: Icon(
              isPayment ? Icons.check : Icons.close,
              color: isPayment ? const Color(0XFF60A5FA) : Color(0XFFFF4D3B),
              size: 30,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            isPayment ? 'Payment Completed' : 'Payment Failed',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 26,
              color: isPayment? const Color(0xffFFFFFF):Color(0XFFE74C3C)
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          Text(
            'Thank you for choosing 2iZii Taxi',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.white70,
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
          const SizedBox(height: 8),
          Text(
            'Total amount: \$$amount',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff88BCFB),
            ),
          ),

          const SizedBox(height: 24),
          const Divider(thickness: 1, color: Color(0XFF485976)),
          const SizedBox(height: 24),

          MediumButton(
            text: isPayment ? 'View Receipt' : 'Use different method',
            textColor: Colors.white,
            color: const Color(0XFF086CBF),
            strokeColor: const Color(0XFF086CBF),
            strokeWidth: 0.0,
            onPressed: () {
            },
          ),
          const SizedBox(height: 12),
          MediumButton(
            text: isPayment ? 'Send Receipt' : 'Try again',
            textColor: Colors.white,
            color: const Color(0xFF3C69A2).withOpacity(0.6),
            strokeColor: const Color(0XFF60A5FA),
            strokeWidth: 1,
            onPressed: () {

            },
          ),

          const SizedBox(height: 12),

          GestureDetector(
            onTap: () {
            },
            child: Text(
              isPayment?'No receipt needed':'',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0XFFABB3C0),
                decoration: TextDecoration.underline,
                decorationThickness: 1.5,
                decorationColor: Color(0XFFABB3C0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
