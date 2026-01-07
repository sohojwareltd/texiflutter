import 'package:flutter/cupertino.dart';
import 'package:taxiflutter/color_Theme/color_theme.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorTheme.calmProfessional
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFF142541),
          borderRadius: BorderRadius.circular(10)
        ),
        margin: const EdgeInsets.only(
          top: 66,
          left: 24,
          right: 24,
          bottom: 26
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          child: Column(
              children: [

              ])),
    );
  }
}
