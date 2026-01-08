import 'package:flutter/material.dart';

class TotalFare extends StatelessWidget {
  final String title;
  final String? trailingText;

  final Color backgroundColor;
  final Color contentColor;
  final Color contentColorTitle;
  final List<Color> strokeGradient;
  final double borderRadius;
  final double borderWidth;
  final double titleFontSize;
  final FontWeight titleFontWeight;

  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const TotalFare({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.contentColor,
    required this.contentColorTitle,
    required this.strokeGradient,
    this.trailingText,
    this.leading,
    this.trailing,
    this.borderRadius = 20,
    this.borderWidth = 1,
    this.titleFontSize = 16,
    this.titleFontWeight = FontWeight.w400,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 27),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: strokeGradient),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius - borderWidth),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: contentColorTitle,
                    fontSize: titleFontSize,
                    fontWeight: titleFontWeight,
                  ),
                ),
              ),
              if (trailingText != null)
                Text(
                  '\$${trailingText!}',
                  style: TextStyle(
                    color: contentColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
