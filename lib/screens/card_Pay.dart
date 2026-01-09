import 'package:flutter/material.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';
import 'package:taxiflutter/components/feedback/total_Fare.dart';
import 'package:taxiflutter/components/labels/card_Payment.dart';
import 'package:taxiflutter/components/selection_Buttons/pay_Amount_Tip_comp.dart';

class CardPay extends StatefulWidget {
  const CardPay({super.key});

  @override
  State<CardPay> createState() => _CardPayState();
}

class _CardPayState extends State<CardPay> {
  int? _selectedTipIndex;

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
              SizedBox(height: 24),
              TotalFare(
                title: 'Total :',
                backgroundColor: Color(0xFF081524),
                contentColor: Colors.white,
                contentColorTitle: Colors.grey,
                strokeGradient: [Color(0xFF152D56), Colors.blue],
                titleFontSize: 20,
                trailingText: '200',
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Would you like to add a tip ?',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              PayAmountTipComp(
                options: ['5%', '10%', '15%', '20%', 'Round up', 'No tip'],
                onSelected: (value) {
                  setState(() {
                    _selectedTipIndex = value;
                  });
                },
                selectedIndex: _selectedTipIndex,
              ),
              SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: NormalButton(
                  text: 'Button',
                  textColor: Colors.white,
                  color: Colors.blue,
                  strokeColor: Colors.blue,
                  strokeWidth: 0,
                ),
              ),
              SizedBox(height: 19),
              Text(
                'Cancel',
                style: TextStyle(color: Colors.grey, fontSize: 18, decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
