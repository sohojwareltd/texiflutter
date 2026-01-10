import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Material;

import '../color_Theme/color_theme.dart';
import '../components/menu_items_Navigation/dropdown_menu.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: ColorTheme.calmProfessional,
        child: Column(
          children: [
            SizedBox(height: 100),
            DropdownMenu(
              index: selectedIndex,
              vehicle: 'Car',
              onChanged: (i) {
                setState(() {
                  selectedIndex = i;
                });
              },
            ),
          ],
        )
      ),
    );
  }
}
