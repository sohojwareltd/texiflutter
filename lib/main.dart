import 'package:flutter/material.dart';
import 'package:taxiflutter/components/Payment_Components/hire.dart';
import 'package:taxiflutter/components/Payment_Components/payments.dart';
import 'package:taxiflutter/components/menu_items_Navigation/action_Row.dart';
import 'package:taxiflutter/components/overlays/add_Number.dart';
import 'package:taxiflutter/components/overlays/current_trip.dart';
import 'package:taxiflutter/components/overlays/pay_Amount.dart';
import 'package:taxiflutter/components/overlays/scan_and_Pay.dart';
import 'package:taxiflutter/components/selection_Buttons/bluetooth.dart';
import 'package:taxiflutter/components/selection_Buttons/pay_Amount_Tip_comp.dart';
import 'package:taxiflutter/screens/for_Hire.dart';
import 'package:taxiflutter/screens/login_screens.dart';
import 'package:taxiflutter/screens/permission_required.dart';
import 'package:taxiflutter/screens/taxi_Meter.dart';
import 'components/Payment_Components/current_Fare.dart';
import 'components/buttons/medium_Button.dart';
import 'components/feedback/location_Access.dart';
import 'components/feedback/total_Fare.dart';
import 'components/labels/bt_Status.dart';
import 'components/menu_items_Navigation/appBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? _selectedTipIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ForHire(),
    );
  }
}
