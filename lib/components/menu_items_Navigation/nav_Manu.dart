import 'package:flutter/material.dart';

class CustomHeaderMini extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final Color contentColor;

  const CustomHeaderMini({
    super.key,
    required this.title,
    this.onBackPressed,
    this.contentColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox(
        height: 56.0, // Standard AppBar height
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: contentColor),
                onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
              ),
            ),
            // Title
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: contentColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}