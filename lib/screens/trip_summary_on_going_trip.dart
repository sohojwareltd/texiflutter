import 'package:flutter/material.dart';
import 'package:taxiflutter/components/labels/tags.dart';
import 'package:taxiflutter/components/menu_items_Navigation/action_row.dart'; // Fixed casing
import 'package:taxiflutter/components/menu_items_Navigation/nav_manu.dart';
import 'package:taxiflutter/components/overlays/current_trip.dart';

class TripSummaryOnGoingTrip extends StatefulWidget {
  final bool currentTrip; // Changed to non-nullable with a default

  const TripSummaryOnGoingTrip({
    super.key,
    this.currentTrip = false, // Default value avoids null issues
  });

  @override
  State<TripSummaryOnGoingTrip> createState() => _TripSummaryOnGoingTripState();
}

class _TripSummaryOnGoingTripState extends State<TripSummaryOnGoingTrip> {
  // Move controller here so it's only created once
  late TextEditingController _tripController;

  @override
  void initState() {
    super.initState();
    _tripController = TextEditingController();
  }

  @override
  void dispose() {
    _tripController.dispose(); // Always dispose controllers to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B2D4A),
      // SafeArea prevents content from going under the status bar/notch
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeaderMini(title: 'Trip history'),
                const SizedBox(height: 12), // Spacing between header and content

                if (widget.currentTrip)
                  CurrentTrip(
                    title: 'Current trip',
                    startedTitle: 'Started',
                    startedAmount: '18.21',
                    currentFareTitle: 'Current fare',
                    currentAmount: '\$200',
                    buttonText: 'Other payments',
                    informationText: 'Information text',
                    controller: _tripController,
                  ),

                const SizedBox(height: 48),
                const Tags(label: 'My orders'),
                const SizedBox(height: 12),

                // Grouping ActionRows
                ..._buildActionRows(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildActionRows() {
    return List.generate(5, (index) => const Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: ActionRow(
        title: '#1526',
        description: '\$100',
        statusLabel: 'Completed',
      ),
    ))..add(const ActionRow(
      title: '#1526',
      description: '\$100',
      statusLabel: 'Canceled',
    ));
  }
}