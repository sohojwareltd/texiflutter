import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';
import 'package:taxiflutter/components/labels/push2Pay.dart';
import 'package:taxiflutter/components/text_fields/input_Text_field.dart';

class ReceiptOptionsSmsEpost extends StatelessWidget {
  final String sendType;
  final String title;
  final String buttonText;
  final String hintText;
  final String initialCountryCode;
  final String onCloseText;
  final VoidCallback? onClose;
  final TextEditingController controller;
  final Function(String countryCode, String phoneNumber, String email)? onSendRequest;

  const ReceiptOptionsSmsEpost({
    this.sendType = 'sms',
    super.key,
    this.title = 'Add number',
    this.buttonText = 'Send payment request',
    this.hintText = 'Write in number..',
    this.initialCountryCode = '+47',
    this.onCloseText = 'No receipt needed',
    this.onClose,
    this.onSendRequest,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // Prevents touching screen edges
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 140),
        decoration: BoxDecoration(
          color: const Color(0xFF1B2D4A).withOpacity(0.6),
          // Dark blue background
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.5, color: Colors.blue),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Fit content vertically
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row with Badge and Close Button
            const SizedBox(height: 30),
            Center(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),

            // Input Field Box
            Row(
              children: [
                if(sendType == 'sms')
                DropdownButton<String>(
                  value: initialCountryCode,
                  underline: const SizedBox(),
                  dropdownColor: const Color(0xFF1B2D4A),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  items: [initialCountryCode].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
                const SizedBox(width: 8), // Add some spacing
                // FIX: Wrap the InputTextField with Expanded
                Expanded(
                  child: InputTextField(
                    hint: hintText,
                    keyboardType: TextInputType.phone,
                    enableBorderColor: const Color(0xFF086CBF),
                    fillColor: const Color(0xFF0E192B),
                    focusedBorderColor: Colors.white,
                    controller: controller,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Action Button
            Center(
              child: NormalButton(
                text: 'Send Payment Request',
                textColor: Colors.white,
                color: const Color(0xFF086CBF),
                strokeColor: const Color(0xFF086CBF),
                strokeWidth: 0,
                onPressed: () {
                  onSendRequest?.call(initialCountryCode, controller.text,sendType);
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  onClose?.call();
                },
                child: Text(
                  onCloseText,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.5,
                    decorationColor: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
