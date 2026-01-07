import 'package:flutter/material.dart';
import 'package:taxiflutter/color_Theme/color_theme.dart';

import '../buttons/medium_Button.dart';

class ReceiptSent extends StatelessWidget {
  const ReceiptSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF3C69A2).withOpacity(0.9),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: EdgeInsets.only(
        top: 95,
        left: 23,
        right: 17,
        bottom:160
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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
              child: Icon(Icons.check,
                color:Color(0XFF60A5FA),
              ),
            ),

            const SizedBox(height: 35),

            Text( 'Receipt sent!',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                  color:Color(0xffFFFFFF)
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

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
              'Trip ID: ',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff88BCFB),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Total amount: \$ 200',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff88BCFB),
              ),
            ),

            const SizedBox(height: 26),
             Divider(thickness: 1, color: Color(0XFF485976)),
            const SizedBox(height: 36),
            MediumButton(
              text:'Done',
              textColor: Color(0XFFFFFFFF),
              color:ColorTheme.coreBlue,
              strokeColor: ColorTheme.coreBlue,
              strokeWidth: 0.0,
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}