import 'package:flutter/material.dart';

class PayAmountTipComp extends StatelessWidget {
  final List<String> options;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  final Color unselectedColor;
  final Color selectedColor; // The "deep" color
  final Color selectedStrokeColor; // The border color when selected
  final Color textColor;

  const PayAmountTipComp({
    Key? key,
    required this.options,
    required this.onSelected,
    this.selectedIndex,
    this.unselectedColor = const Color(0xFF223555),
    this.selectedColor = const Color(0xFF4167A5), // Deeper color
    this.selectedStrokeColor = const Color(0xFF60A5FA), // Light blue stroke
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 12, // Horizontal space
        mainAxisSpacing: 12, // Vertical space
        childAspectRatio: 2.2, // Width to Height ratio (Rectangle shape)
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () => onSelected(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: isSelected ? selectedColor : unselectedColor,
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(color: selectedStrokeColor, width: 2)
                  : Border.all(color: Colors.transparent, width: 2),
            ),
            child: Center(
              child: Text(
                options[index],
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}