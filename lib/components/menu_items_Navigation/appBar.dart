import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String menuText;
  final VoidCallback? onMenuTap;
  final Color? backgroundColor;
  final Color textColor;

  const CustomHeader({
    super.key,
    required this.title,
    this.menuText = 'menu',
    this.onMenuTap,
    this.backgroundColor = Colors.transparent, // The navy blue from your image
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      actions: [
        InkWell(
          onTap: onMenuTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  menuText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.menu,
                  color: textColor,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}