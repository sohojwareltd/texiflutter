import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
      BuildContext context,
      String message, {
        IconData icon = Icons.warning_amber_rounded,
        Color iconColor = Colors.red,
      }) {
    // This removes the current SnackBar immediately if a new one is triggered
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF081524),
        elevation: 4,
        margin: const EdgeInsets.all(20), // Adds space around the floating bar
        shape: const StadiumBorder(
          side: BorderSide(color: Colors.blue, width: 1.5),
        ),
        content: Row(
          mainAxisSize: MainAxisSize.min, // Shrinks the row to fit content
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 12), // Space between icon and text
            Flexible(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white, // White text is usually more readable on dark bg
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}