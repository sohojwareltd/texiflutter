import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxiflutter/color_Theme/color_theme.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';
import 'package:taxiflutter/components/menu_items_Navigation/nav_Manu.dart';
import 'package:taxiflutter/handel_permission/permission_hande.dart';
import 'package:taxiflutter/screens/qr_scanner_view.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  PermissionHande permissionHande = PermissionHande();
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
                CustomHeaderMini(title: 'Connect to vehicle'),
                const SizedBox(height: 104),
                Image.asset('assets/images/qrframe.png'),
                const SizedBox(height: 78.88),
                NormalButton(text: 'Scan with QR-code',
                    textColor: Color(0XFF0E192B),
                    color: ColorTheme.platinum,
                    strokeColor: ColorTheme.platinum,
                    strokeWidth:0.0,
                    onPressed: () async {
                      bool isAllow =
                      await permissionHande.handleCameraPermission(context);

                      if (isAllow) {
                        final result = await showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (_) => const QrScannerDialog(),
                        );
                        if (result != null) {
                          print("QR RESULT: $result");
                        }
                      }
                    }


                ),
                const SizedBox(height: 21),
                NormalButton(text: 'Scan with QR-code',
                  textColor: ColorTheme.platinum,
                  color:Color(0XFF142541) ,
                  strokeColor:ColorTheme.confidentReliable,
                  strokeWidth:4,
                  onPressed: (){
                  },
                ),

              ])),
    );
  }
}
