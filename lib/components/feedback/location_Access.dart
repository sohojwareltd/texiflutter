import 'package:flutter/material.dart';

class LocationAccess extends StatelessWidget {
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

  // Shape
  final double borderRadius;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const LocationAccess({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.contentColor,
    this.subtitle,
    this.trailingText,
    this.leading,
    this.trailing,
    this.strokeColor,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.all(20.0),
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
              ? Border.all(color: strokeColor!, width: 1.5)
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
                      fontSize: subtitle != null ? 12 : 14,
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