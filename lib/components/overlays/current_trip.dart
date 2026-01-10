import 'package:flutter/material.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';
import 'package:taxiflutter/components/feedback/information_Text.dart';
import 'package:taxiflutter/components/labels/push2Pay.dart';
import 'package:taxiflutter/components/text_fields/input_Text_field.dart';

class CurrentTrip extends StatelessWidget {
  final String title;
  final String startedTitle;
  final String startedAmount;
  final String currentFareTitle;
  final String currentAmount;
  final String buttonText;
  final String informationText;
  final VoidCallback? onClose;
  final TextEditingController controller;
  final Function(String countryCode, String phoneNumber)? onSendRequest;

  // 1. Added boolean flag
  final bool showCloseButton;

  const CurrentTrip({
    super.key,
    required this.title,
    required this.startedTitle,
    required this.startedAmount,
    required this.currentFareTitle,
    required this.currentAmount,
    required this.buttonText,
    required this.informationText,
    this.onClose,
    this.onSendRequest,
    required this.controller,
    this.showCloseButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32.5, vertical: 39),
        decoration: BoxDecoration(
            color: const Color(0xFF1B2D4A),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.5, color: Colors.blue)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 3. Conditional rendering of the Top Row
            if (showCloseButton)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: onClose ?? () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFF142136),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),

            // Adjust spacing based on whether the button exists
            SizedBox(height: showCloseButton ? 30 : 0),

            // ... rest of your code ...
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),

            Row(
              children: [
                Text(
                  startedTitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  startedAmount,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Text(
                  currentFareTitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Text(
                  currentAmount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Divider(color: Colors.blue,thickness: 0.5,),
            const SizedBox(height: 20),

            InformationText(
              text: informationText,
              icon: Icons.error,
              backgroundColor: Color(0xFF60A5FA).withOpacity(0.1),
              contentColor: Colors.white,
            ),

            // Input Field Box
            const SizedBox(width: 8), // Add some spacing
            // FIX: Wrap the InputTextField with Expande
            const SizedBox(height: 30),

            // Action Button
            Center(
              child: NormalButton(
                text: 'Other payment',
                textColor: Colors.white,
                color: const Color(0xFF086CBF),
                strokeColor: const Color(0xFF086CBF),
                strokeWidth: 0,
              ),
            ),
            SizedBox(height: 12,),
            Center(
              child: NormalButton(
                text: 'Cancel trip',
                textColor: Colors.white,
                color: Colors.redAccent.withOpacity(0.7),
                strokeColor: Colors.red,
                strokeWidth: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
