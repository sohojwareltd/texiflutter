import 'package:flutter/material.dart';
import 'package:taxiflutter/components/labels/qr_Payment.dart';

import '../buttons/normal_Button.dart';
import '../text_fields/input_Text_field.dart';

class CurrentFare extends StatelessWidget {
  final String currentFareAmount;
  final VoidCallback? onCurrentFarePressed;
  final VoidCallback? onEditFarePressed;

  const CurrentFare({
    super.key,
    required this.currentFareAmount,
    this.onCurrentFarePressed,
    this.onEditFarePressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFareZero =
        currentFareAmount.isEmpty || double.tryParse(currentFareAmount) == 0;

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF0F253D)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Current Fare:',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    '\$$currentFareAmount',
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
              Divider(color: const Color(0xFF0F253D), thickness: 1),
              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: NormalButton(
                      text: 'Edit Fare',
                      textColor: Colors.white,
                      color: const Color(0xFF0C8CE9),
                      strokeColor: const Color(0xFF0C8CE9),
                      strokeWidth: 0,
                      onPressed: onEditFarePressed,
                    ),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: NormalButton(
                      text: 'Current Fare',
                      onPressed: isFareZero ? null : onCurrentFarePressed,
                      // Disable if fare is zero
                      color: Colors.transparent,
                      textColor: isFareZero
                          ? Colors.grey.shade800
                          : Colors.grey,
                      strokeColor: isFareZero
                          ? const Color(0xFF3F6280)
                          : const Color(0xFF086CBF),
                      strokeWidth: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
