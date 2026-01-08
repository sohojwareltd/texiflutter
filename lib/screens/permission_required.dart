import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';
import 'package:taxiflutter/components/feedback/location_Access.dart';
import 'package:taxiflutter/screens/qr_scan_screen.dart';

import '../handel_permission/permission_hande.dart';

class PermissionRequired extends StatefulWidget {
  const PermissionRequired({super.key});

  @override
  State<PermissionRequired> createState() => _PermissionRequiredState();
}

class _PermissionRequiredState extends State<PermissionRequired> {
  PermissionHande permissionHande = PermissionHande();

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  void _checkPermissions() async {
    PermissionStatus locationStatus = await Permission.location.status;
    if (locationStatus.isGranted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => QrScanScreen()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF081524),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsetsGeometry.only(
              top: 112,
              right: 26,
              left: 26,
              bottom: 70,
            ),
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(height: 48),
                Text(
                  'Permissions Required',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(text: 'The app needs access to '),
                      TextSpan(
                        text: 'Location and Nearby\nDevice functions.',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: ' This is a one-time setup.'),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'You will see 3 pop-ups. Tap these options:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    LocationAccess(
                      title: 'LOCATION ACCESS',
                      backgroundColor: Color(0xFF60A5FA).withOpacity(0.1),
                      contentColor: Colors.white,
                      subtitle: 'Select While using the app',
                      leading: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    LocationAccess(
                      title: 'PRECISE LOCATION',
                      backgroundColor: Color(0xFF60A5FA).withOpacity(0.1),
                      contentColor: Colors.white,
                      subtitle: 'Select Change to precise location',
                      leading: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Center(
                          child: Text(
                            '2',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    LocationAccess(
                      title: 'NEARBY DEVICE',
                      backgroundColor: Color(0xFF60A5FA).withOpacity(0.1),
                      contentColor: Colors.white,
                      subtitle: 'Select Allow',
                      leading: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Center(
                          child: Text(
                            '3',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 68,
                        vertical: 60,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                          children: [
                            const TextSpan(
                              text:
                                  'If you select the wrong option, you will need to restart the setup',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 31),
                      child: NormalButton(
                        text: 'Continue',
                        textColor: Colors.white,
                        color: Colors.blue,
                        strokeColor: Colors.blue,
                        strokeWidth: 0,
                          onPressed: () async {
                            bool request = await permissionHande.handlePreciseLocation(context);
                            if (request) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => QrScanScreen()),
                              );
                            }
                          }
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
