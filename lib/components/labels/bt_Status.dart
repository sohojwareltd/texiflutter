import 'package:flutter/material.dart';

class BtStatus extends StatelessWidget {
  final bool isActive;
  final String label;
  final Color statusColor;
  final Color activeColor;
  final TextStyle? textStyle;
  final double dotSize;
  final double spacing;

  const BtStatus({
    // Initial value is handled by the parent widget passing 'false'
    required this.isActive,
    super.key,
    this.label = 'Taximeter', // Base label name
    this.statusColor = Colors.grey,
    this.activeColor = const Color(0xFF008955),
    this.textStyle,
    this.dotSize = 12.0,
    this.spacing = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: isActive ? activeColor : statusColor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: spacing),
        Text(
          // FIX: Removed 'label:' prefix. Position 1 must be the String.
          isActive ? '$label On' : '$label Off',
          style: textStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}