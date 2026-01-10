import 'package:flutter/material.dart';
import 'package:taxiflutter/components/receipts_Components/asking_for_Recipt.dart';
import 'package:taxiflutter/components/receipts_Components/receipt_Options_sms_epost.dart';
import 'package:taxiflutter/components/receipts_Components/receipt_Sent.dart';

import '../components/receipts_Components/receipt_Options_QR.dart';

class Qr extends StatelessWidget {
  const Qr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF081524),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 59,
            left: 24,
            right: 24,
            top: 62,
          ),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),

              SizedBox(height: 64),


              ReceiptOptionsQr(onClose: () {},)

            ],
          ),
        ),
      ),
    );
  }
}
