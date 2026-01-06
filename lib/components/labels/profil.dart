import 'package:flutter/material.dart';

class ProfileBadge extends StatelessWidget {
  final String firstName;
  final String lastName;
  final int count;
  final IconData icon;
  final Color borderColor;
  final Color textColor;

  const ProfileBadge({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.count,
    this.icon = Icons.person_outline,
    this.borderColor = Colors.blueAccent,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor.withOpacity(0.5), width: 1),
        borderRadius: BorderRadius.circular(50), // Creates the pill shape
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: textColor, size: 28),
          const SizedBox(width: 16),
          Text(
            '$firstName $lastName $count',
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.w300, // Thin font weight as seen in image
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}