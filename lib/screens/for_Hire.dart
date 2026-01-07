import 'package:flutter/material.dart';
import 'package:taxiflutter/components/Payment_Components/current_Fare.dart';
import 'package:taxiflutter/components/Payment_Components/hire.dart';
import 'package:taxiflutter/components/Payment_Components/payments.dart';
import 'package:taxiflutter/components/labels/bt_Status.dart';
import 'package:taxiflutter/components/menu_items_Navigation/appBar.dart';

class ForHire extends StatelessWidget {
  const ForHire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF081524),
      body: Container(
        padding: EdgeInsets.only(bottom: 59, left: 24, right: 24),
        child: Column(
          children: [
            CustomHeader(title: '2iZiitaxi'),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  CurrentFare(currentFareAmount: '0.00'),
                  SizedBox(height: 40),
                  Hire(
                    mainText: 'FOR HIRE',
                    subText: 'Press to start ride',
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(height: 64),
                  Payments(
                    title: 'Card',
                    backgroundColor: Color(0xFF1E3A5F).withOpacity(0.8),
                    contentColor: Colors.white,
                    leading: Icon(Icons.credit_card_rounded, color: Colors.white),
                    strokeColor: Color(0xFF3D5A80),
                  ),
                  SizedBox(height: 16),
                  Payments(
                    title: 'QR',
                    backgroundColor: Color(0xFF1E3A5F).withOpacity(0.3),
                    contentColor: Colors.white,
                    leading: Icon(Icons.qr_code_2_rounded, color: Colors.white),
                    strokeColor: Color(0xFF3D5A80),
                  ),
                  SizedBox(height: 16),
                  Payments(
                    title: 'QR',
                    backgroundColor: Color(0xFF1E3A5F).withOpacity(0.0),
                    contentColor: Colors.white,
                    leading: Icon(Icons.qr_code_2_rounded, color: Colors.white),
                    strokeColor: Color(0xFF3D5A80),
                  ),
                ],
              ),
            ),
            SizedBox(height: 65),
            BtStatus(isActive: true, label: 'Taximeter')
          ],
        ),
      ),
    );
  }
}
