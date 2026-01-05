import 'package:flutter/material.dart';
import 'package:taxiflutter/components/feedback/description.dart';
import 'package:taxiflutter/components/feedback/error_Message.dart';
import 'components/buttons/medium_Button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ErrorMessage(text: 'Error', icon: Icons.error_outline, backgroundColor: Colors.red.withOpacity(0.1), contentColor: Colors.red)
    );
  }
}
