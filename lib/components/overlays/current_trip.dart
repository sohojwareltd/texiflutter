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
  });

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.black.withOpacity(0.5), // Semi-transparent background
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          // Prevents touching screen edges
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1B2D4A), // Dark blue background
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Fit content vertically
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row with Badge and Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // Aligns child to the end (right)
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

              const SizedBox(height: 30),

              // Title
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
                backgroundColor: Color(0xFF485976),
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
      ),
    );
  }
}
