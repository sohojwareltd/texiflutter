import 'package:flutter/material.dart';

class Payments extends StatelessWidget {
  // Text Content
  final String title;
  final String? subtitle;
  final String? trailingText;

  // Visuals
  final Widget? leading;
  final Widget? trailing;
  final Color backgroundColor;
  final Color contentColor;
  final Color? strokeColor;
  final double strokeWidth;

  // Shape
  final double borderRadius;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const Payments({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.contentColor,
    this.subtitle,
    this.trailingText,
    this.leading,
    this.trailing,
    this.strokeColor,
    this.strokeWidth = 1.5,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.symmetric(vertical: 22,horizontal: 40),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: strokeColor != null
              ? Border.all(color: strokeColor!, width: strokeWidth)
              : null,
        ),
        child: Row(
          crossAxisAlignment: subtitle != null
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: contentColor,
                      fontSize: subtitle != null ? 14 : 18 ,
                      fontWeight: subtitle != null ? FontWeight.bold : FontWeight.w400,
                      letterSpacing: subtitle != null ? 1.1 : null,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: contentColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailingText != null)
              Text(
                trailingText!,
                style: TextStyle(color: contentColor, fontSize: 14),
              ),
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: trailing!,
              ),
          ],
        ),
      ),
    );
  }
}