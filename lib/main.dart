import 'package:flutter/material.dart';
import 'package:taxiflutter/components/overlays/add_Number.dart';
import 'package:taxiflutter/screens/login_screens.dart';
import 'components/buttons/medium_Button.dart';
import 'components/feedback/location_Access.dart';
import 'components/feedback/total_Fare.dart';
import 'components/labels/bt_Status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AddNumber(controller: TextEditingController())
    );
  }
}
