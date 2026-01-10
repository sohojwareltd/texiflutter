import 'package:flutter/material.dart';
import 'package:taxiflutter/components/receipts_Components/payment_Completed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
      ),
      body: PaymentCompleted(
        amount: "200",
        isPayment: true,
        tripId: '122',
      ),
    );
  }
}
