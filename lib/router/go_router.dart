import 'package:go_router/go_router.dart';
import 'package:taxiflutter/screens/for_Hire.dart';
import 'package:taxiflutter/screens/home_screen.dart';
import 'package:taxiflutter/screens/login_screens.dart';
import 'package:taxiflutter/screens/menu_screen.dart';
import 'package:taxiflutter/screens/permission_required.dart';
import 'package:taxiflutter/screens/qr_scan_screen.dart';
import 'package:taxiflutter/screens/taxi_Meter.dart';
import 'package:taxiflutter/screens/taxi_Receipt_Screen.dart';

class goRouter {
  static final GoRouter router = GoRouter(
      routes: [
        GoRoute(path: '/',
        builder: (context, state) {
          return LoginScreens();
        }),

        GoRoute(path: '/home',
            builder: (context, state) {
              return HomeScreen();
            }),
        GoRoute(path: '/menu',
            builder: (context, state) {
              return MenuScreen();
            }),
        GoRoute(path: '/for_hire',
            builder: (context, state) {
              return ForHire();
            }),
        GoRoute(path: '/permission_request',
            builder: (context, state) {
              return PermissionRequired();
            }),
        GoRoute(path: '/qr_scan',
            builder: (context, state) {
              return QrScanScreen();
            }),GoRoute(path: '/taxi_meter',
            builder: (context, state) {
              return TaxiMeter();
            }),
        GoRoute(path: '/taxi_receipt',
            builder: (context, state) {
              return TaxiReceiptScreen();
            }),



      ]
  );
}
