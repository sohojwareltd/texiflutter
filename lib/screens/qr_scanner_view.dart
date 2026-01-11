import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerDialog extends StatefulWidget {
  const QrScannerDialog({super.key});

  @override
  State<QrScannerDialog> createState() => _QrScannerDialogState();
}

class _QrScannerDialogState extends State<QrScannerDialog> {
  final MobileScannerController controller = MobileScannerController();
  bool scanned = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            MobileScanner(
              controller: controller,
              onDetect: (capture) {
                if (!scanned) {
                  scanned = true;
                  final code = capture.barcodes.first.rawValue;
                  if (code != null) {
                    controller.stop();
                    Navigator.pop(context, code);
                  }
                }
              },
            ),
            Center(
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
