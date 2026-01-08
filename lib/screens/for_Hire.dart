import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxiflutter/components/Payment_Components/current_Fare.dart';
import 'package:taxiflutter/components/Payment_Components/hire.dart';
import 'package:taxiflutter/components/Payment_Components/payments.dart';
import 'package:taxiflutter/components/feedback/custom_SnackBar.dart';
import 'package:taxiflutter/components/labels/bt_Status.dart';
import 'package:taxiflutter/components/labels/push2Pay.dart';
import 'package:taxiflutter/components/menu_items_Navigation/appBar.dart';
import 'package:taxiflutter/components/overlays/add_Number.dart';
import 'package:taxiflutter/components/overlays/pay_Amount.dart';
import 'package:taxiflutter/components/overlays/scan_and_Pay.dart';

class ForHire extends StatefulWidget {
  const ForHire({super.key});

  @override
  State<ForHire> createState() => _ForHireState();
}

class _ForHireState extends State<ForHire> {
  String _currentFareAmount = '0.00';

  @override
  Widget build(BuildContext context) {
    bool isTripOngoing =
        double.tryParse(_currentFareAmount) != null &&
        double.parse(_currentFareAmount) > 0;

    return Scaffold(
      backgroundColor: const Color(0xFF081524),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 59, left: 24, right: 24),
          child: Column(
            children: [
              const CustomHeader(title: '2iZiitaxi'),
              const SizedBox(height: 40),
              CurrentFare(
                currentFareAmount: _currentFareAmount,
                onEditFarePressed: () async {
                  final newAmount = await showDialog<String>(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.5),
                    builder: (BuildContext context) {
                      return PayAmount(
                        onAmountAdded: (amount) {
                          Navigator.of(context).pop(amount);
                        },
                      );
                    },
                  );

                  if (newAmount != null && newAmount.isNotEmpty) {
                    setState(() {
                      _currentFareAmount = newAmount;
                    });
                  }
                },
              ),
              const SizedBox(height: 40),

              // --- Corrected Hire Button Logic ---
              Hire(
                mainText: isTripOngoing ? 'HIRE' : 'FOR HIRE',
                subText: isTripOngoing ? 'Ongoing trip' : 'Press to start ride',
                backgroundColor: isTripOngoing ? Colors.red : Colors.green,
                onTap: () {
                  // This is where the logic happens
                  if (!isTripOngoing) {
                    // If the trip is NOT ongoing, show a message
                    CustomSnackBar.show(
                      context,
                      'You have to add an amount first.',
                    );
                  } else {
                    // Handle logic for an ongoing trip (e.g., end trip)
                    print("Trip is ongoing. Handle action...");
                  }
                },
              ),
              const SizedBox(height: 64),
              const Text(
                'Payments Methods',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // --- Corrected Conditional Payment Methods ---
              Column(
                children: [
                  Payments(
                    title: 'Card',
                    backgroundColor: const Color(0xFF1E3A5F).withOpacity(0.8),
                    contentColor: Colors.white,
                    leading: const Icon(
                      Icons.credit_card_rounded,
                      color: Colors.white,
                    ),
                    strokeColor: const Color(0xFF3D5A80),
                    onPressed: () {
                      if (!isTripOngoing) {
                        CustomSnackBar.show(
                          context,
                          'You have to add an amount first.',
                        );
                        return; // Stop execution
                      }
                      // Add card payment logic here
                      print("Card payment selected.");
                    },
                  ),
                  const SizedBox(height: 16),
                  Payments(
                    title: 'QR',
                    backgroundColor: const Color(0xFF1E3A5F).withOpacity(0.3),
                    contentColor: Colors.white,
                    leading: const Icon(
                      Icons.qr_code_2_rounded,
                      color: Colors.white,
                    ),
                    strokeColor: const Color(0xFF3D5A80),
                    onPressed: () async {
                      if (!isTripOngoing) {
                        CustomSnackBar.show(
                          context,
                          'You have to add an amount first.',
                        );
                        return;
                      }
                      // --- QR Logic ---
                      await showDialog(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.5),
                        builder: (BuildContext context) {
                          return const ScanAndPay();
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Payments(
                    title: 'Push2Pay',
                    backgroundColor: Colors.transparent,
                    contentColor: Colors.white,
                    leading: const Icon(Icons.chat, color: Colors.white),
                    strokeColor: const Color(0xFF3D5A80),
                    onPressed: () async {
                      if (!isTripOngoing) {
                        // Add this inside the show() method before showSnackBar

                        CustomSnackBar.show(
                          context,
                          'You have to add an amount first.',
                        );
                        return;
                      }
                      await showDialog(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.5),
                      builder: (BuildContext context) {
                        return  AddNumber(controller: TextEditingController());
                      },
                      );
                      // Add Push2Pay logic here
                      print("Push2Pay payment selected.");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 65),
              const BtStatus(isActive: true, label: 'Taximeter'),
            ],
          ),
        ),
      ),
    );
  }
}
