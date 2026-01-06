import 'package:flutter/material.dart';

enum BluetoothState { disconnected, connectToVehicle, connecting }

class BluetoothStatusCard extends StatelessWidget {
  final BluetoothState state;
  final VoidCallback? onTap;

  const BluetoothStatusCard({
    super.key,
    required this.state,
    this.onTap,
  });



  @override
  Widget build(BuildContext context) {
    final String title;
    final String subtitle;
    final Color statusColor;
    final Color iconBgColor;
    final Color iconColor;
    final bool isConnecting;

    switch (state) {
      case BluetoothState.disconnected:
        title = "Disconnected";
        subtitle = "Off";
        statusColor = Colors.grey;
        iconBgColor = const Color(0xFFB0B8C4);
        iconColor = const Color(0xFF334155);
        isConnecting = false;
        break;
      case BluetoothState.connectToVehicle:
        title = "Connect to vehicle";
        subtitle = "On";
        statusColor = const Color(0xFF10B981);
        iconBgColor = const Color(0xFF0073CF);
        iconColor = Colors.white;
        isConnecting = false;
        break;
      case BluetoothState.connecting:
        title = "Connecting to vehicle";
        subtitle = "Connecting...";
        statusColor = const Color(0xFF0073CF);
        iconBgColor = const Color(0xFF0061AF);
        iconColor = const Color(0xFF1E293B);
        isConnecting = true;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2F4D),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withOpacity(0.1),width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: isConnecting
                  ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: iconColor.withOpacity(0.5),
                ),
              )
                  : Icon(Icons.bluetooth, color: iconColor, size: 28),
            ),
            const SizedBox(width: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}