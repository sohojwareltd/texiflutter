import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';
import 'package:taxiflutter/components/labels/tags.dart';
import 'package:taxiflutter/components/menu_items_Navigation/nav_Manu.dart';

import '../components/overlays/qr_Scanner_Overlay_Painter.dart';

class QrScannerDialog extends StatefulWidget {
  const QrScannerDialog({super.key});

  @override
  State<QrScannerDialog> createState() => _QrScannerDialogState();
}

class _QrScannerDialogState extends State<QrScannerDialog> {
  final MobileScannerController controller = MobileScannerController();
  bool scanned = false;
  bool isFlashOn = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 20,
            children: [


              // 1. Header Area
              CustomHeaderMini(title: 'Vehicle QR-code'),

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Camera Layer
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

                      // Instructional Text
                      Positioned(
                        top: 40,
                        child: Tags(label: 'Place QR-code in the frame')
                      ),

                      // The Corner Frame
                      CustomPaint(
                        size: const Size(260, 260),
                        painter:
                            QRScannerOverlayPainter(), // Your existing painter
                      ),

                      // Bottom Action Button
                      Positioned(
                        bottom: 40,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 55,
                          child: NormalButton(
                            text: 'Scan QR-code',
                            textColor: Colors.black,
                            color: Colors.white,
                            strokeColor: Colors.white,
                            strokeWidth: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 3. Flashlight Button Footer
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isFlashOn = !isFlashOn;
                      controller.toggleTorch();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1E3A8A),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFlashOn
                          ? Icons.flashlight_on
                          : Icons.flashlight_off_rounded,
                      color: Colors.blueAccent,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Simple Painter to "punch a hole" in the dark overlay
class ColorPainter extends ColorFilter {
  ColorPainter() : super.mode(Colors.black.withOpacity(0.5), BlendMode.dstOut);
}
