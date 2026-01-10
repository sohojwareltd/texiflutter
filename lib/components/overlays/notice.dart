import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';

class Notice extends StatelessWidget {
  // Required fields
  final String title0;
  final String description;
  final String buttonText1;

  // Nullable/Optional fields
  final bool isNotice;
  final IconData? icon; // Changed to IconData for better flexibility
  final String? title;
  final String? time;
  final String? buttonText2;

  const Notice({
    super.key,
    required this.title0, // Required
    required this.description, // Required
    required this.buttonText1, // Required
    this.isNotice = false, // Default value provided
    this.icon, // Optional
    this.title, // Optional
    this.time, // Optional
    this.buttonText2, // Optional
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Dialog(
          backgroundColor: isNotice
              ? const Color(0xFF60A5FA).withOpacity(0.4)
              : const Color(0x14254166).withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Color(0xFF79BAF4).withOpacity(0.4), width: 1),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0x3321375A),
                    ),
                    child:  isNotice? Icon(icon, color: Colors.blue): Icon(icon, color: Colors.red),
                  ),
                const SizedBox(height: 24),

                // Only show title if it is not null
                if (title != null)
                  Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFFF5F7FA),
                    ),
                  ),

                const SizedBox(height: 32),
                Text(
                  title0,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFFF5F7FA),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFCCD6E5),
                  ),
                ),

                const SizedBox(height: 16),

                // Logic for Time display
                if (isNotice || time != null)
                  Text(
                    isNotice ? '' : time!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFFFFFFFF),
                    ),
                  ),

                const SizedBox(height: 24),
                NormalButton(
                  text: buttonText1,
                  textColor: const Color(0XFFFFFFFF),
                  color: isNotice? const Color(0XFF086CBF): Colors.red,
                  strokeColor: const Color(0XFF086CBF),
                  strokeWidth: 0.0,
                  onPressed: () => Navigator.pop(context),
                ),

                // The second button is now fully conditional
                if (buttonText2 != null) ...[
                  const SizedBox(height: 12),
                  NormalButton(
                    text: buttonText2!,
                    textColor: const Color(0XFFFFFFFF),
                    color: Colors.transparent,
                    strokeColor: const Color(0XFF60A5FA),
                    strokeWidth: 1,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
