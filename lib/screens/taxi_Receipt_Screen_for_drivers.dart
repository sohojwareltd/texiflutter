import 'package:flutter/material.dart';
import 'package:taxiflutter/components/buttons/normal_Button.dart';
import 'package:taxiflutter/components/menu_items_Navigation/nav_Manu.dart';

void main() => runApp(const MaterialApp(home: TaxiReceiptScreenForDrivers()));

class TaxiReceiptScreenForDrivers extends StatelessWidget {
  final bool isCancelled;

  const TaxiReceiptScreenForDrivers({super.key, this.isCancelled = false});

  @override
  Widget build(BuildContext context) {
    // Custom dark blue color from the design
    const Color bgColor = Color(0xFF1A2E4F);
    const Color cardColor = Color(0xFF21375A);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomHeaderMini(title: 'Order #1526'),
              const SizedBox(height: 68),
              // Checkmark Icon
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: cardColor,
                  shape: BoxShape.circle,
                ),
                child: isCancelled
                    ? Icon(Icons.cancel_outlined, color: Colors.red, size: 40)
                    : Icon(Icons.check, color: Colors.blue, size: 40),
              ),
              const SizedBox(height: 24),

              // Header Text
              const Text(
                'Trip completed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Thank you for choosing 2iZii Taxi',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 28),

              // Trip Info
              const Text(
                'Trip : #1526',
                style: TextStyle(color: Color(0xFF88BCFB), fontSize: 18),
              ),
              const SizedBox(height: 30),

              // Fare Details Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildRow('Trip fare:', '\$190'),
                    const Divider(color: Colors.white12, height: 30),
                    _buildRow('Fee:', '\$10'),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Total Fare Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total fare:',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    Text(
                      '\$200',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.white12,
                height: 28,
                indent: 25,
                endIndent: 25,
              ),
              const SizedBox(height: 23),

              // Payment Method Card
              if (!isCancelled)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment method',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(
                            Icons.credit_card,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'MasterCard*000',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30.0, top: 4),
                        child: Text(
                          '20.12.25 - 12.32',
                          style: TextStyle(color: Colors.white38, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 100),
              if(!isCancelled)
              NormalButton(
                text: 'Send recept',
                textColor: Colors.white,
                color: Colors.transparent,
                strokeColor: Colors.blue,
                strokeWidth: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
