import 'package:flutter/material.dart';
import 'package:taxiflutter/components/Payment_Components/hire.dart';
import 'package:taxiflutter/components/Payment_Components/payments.dart';
import 'package:taxiflutter/components/overlays/add_Number.dart';
import 'package:taxiflutter/components/overlays/current_trip.dart';
import 'package:taxiflutter/components/overlays/pay_Amount.dart';
import 'package:taxiflutter/components/overlays/scan_and_Pay.dart';
import 'package:taxiflutter/components/selection_Buttons/bluetooth.dart';
import 'package:taxiflutter/components/selection_Buttons/pay_Amount_Tip_comp.dart';
import 'package:taxiflutter/screens/login_screens.dart';
import 'components/Payment_Components/current_Fare.dart';
import 'components/buttons/medium_Button.dart';
import 'components/feedback/location_Access.dart';
import 'components/feedback/total_Fare.dart';
import 'components/labels/bt_Status.dart';

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


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PayAmountTipComp(options: ['5','10','15','20','Round up','No Trip'],selectedIndex: _selectedTipIndex, onSelected: (int index) {
        // Use setState to rebuild the UI with the new selection
        setState(() {
          _selectedTipIndex = index;
        });
      },

    ));
  }
}
