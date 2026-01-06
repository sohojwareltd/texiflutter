import 'package:flutter/material.dart';

class Tip extends StatelessWidget {
  /// The percentage text to display (e.g., "5%")
  final String label;

  /// Condition to determine the design state (Active vs Inactive)
  final bool isSelected;

  /// Function to handle the click
  final VoidCallback? onTap;

  /// Optional: Width and Height customization
  final double width;
  final double height;

  const Tip({
    Key? key,
    required this.label,
    required this.isSelected,
    this.onTap,
    this.width = 200, // Default width based on image aspect ratio
    this.height = 120, // Default height based on image aspect ratio
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1. Define Colors based on the Image
    // Inactive (Top)
    const Color inactiveColor = Color(0xFF1E2B45);
    // Active (Bottom)
    const Color activeColor = Color(0xFF3F6296);
    // Active Border
    const Color activeBorderColor = Color(0xFF5C9DFF);

    return GestureDetector(
      onTap: onTap,
      // Using AnimatedContainer for a smooth transition between states
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height,
        decoration: BoxDecoration(
          // CONDITIONAL COLOR: Lighter if selected, Darker if not
          color: isSelected ? activeColor : inactiveColor,

          borderRadius: BorderRadius.circular(12),

          // CONDITIONAL BORDER: Blue border if selected, Transparent if not
          border: Border.all(
            color: isSelected ? activeBorderColor : Colors.transparent,
            width: 2.5, // Matches the thickness in the image
          ),

          // Optional: Add shadow if needed to match the depth
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32, // Large font size to match image
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}