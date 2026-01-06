import 'package:flutter/material.dart';

class BtStatus extends StatelessWidget {
  final String label;
  final Color statusColor;
  final TextStyle? textStyle;
  final double dotSize;
  final double spacing;

  const BtStatus({
    super.key,
    required this.label,
    this.statusColor = const Color(0xFF008955),
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
            color: statusColor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: spacing),
        Text(
          label,
          style: textStyle ??
              const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}