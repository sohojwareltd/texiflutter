import 'package:flutter/material.dart';
import 'package:taxiflutter/components/receipts_Components/asking_for_Recipt.dart';
import 'package:taxiflutter/components/receipts_Components/receipt_Options_sms_epost.dart';
import 'package:taxiflutter/components/receipts_Components/receipt_Sent.dart';

class Email extends StatelessWidget {
  const Email({super.key});

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

              ReceiptOptionsSmsEpost(
                controller: TextEditingController(),
                onClose: () {},
                onSendRequest: (countryCode, phoneNumber, email) {},
                hintText: 'Write in email..',
                sendType: 'email',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
