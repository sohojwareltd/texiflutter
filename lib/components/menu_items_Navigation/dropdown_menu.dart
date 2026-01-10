import 'package:flutter/material.dart';
import '../../color_Theme/color_theme.dart';

class DropdownMenu extends StatelessWidget {
  final int index;
  final String vehicle;
  final ValueChanged<int> onChanged;

  const DropdownMenu({
    super.key,
    required this.index,
    required this.vehicle,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.surfaceBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            decoration: BoxDecoration(
              color: Color(0XFF274577),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              vehicle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorTheme.surfaceBlue,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0XFF3D5A80)),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                leading: const Icon(Icons.directions_car, color: Colors.white),
                title: const Text(
                  'Select vehicle',
                  style: TextStyle(color: Colors.white),
                ),
                iconColor: Colors.white,
                collapsedIconColor: Colors.white,
                children: List.generate(3, (i) {
                  return ListTile(
                    title: Text(
                      'Vehicle #$i',
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Checkbox(
                      value: index == i,
                      onChanged: (_) => onChanged(i),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
