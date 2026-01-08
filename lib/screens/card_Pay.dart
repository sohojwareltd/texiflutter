import 'package:flutter/material.dart';
import 'package:taxiflutter/components/feedback/total_Fare.dart';
import 'package:taxiflutter/components/labels/card_Payment.dart';
import 'package:taxiflutter/components/selection_Buttons/pay_Amount_Tip_comp.dart';

class CardPay extends StatelessWidget {
  const CardPay({super.key});

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
              SizedBox(height: 40),
              Align(
                alignment: Alignment.topLeft,
                child: CardPayment(
                  label: 'Card payment',
                  icon: Icons.credit_card,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 24,),
              TotalFare(
                title: 'Total :',
                backgroundColor: Color(0xFF081524),
                contentColor: Colors.white,
                contentColorTitle: Colors.grey,
                strokeGradient: [Color(0xFF152D56), Colors.blue],
                titleFontSize: 20,
                trailingText: '200',
              ),
              PayAmountTipComp(options: ['1','2','3','4','5','6'], onSelected: (value) {

              },)
            ],
          ),
        ),
      ),
    );
  }
}
