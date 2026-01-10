import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide DropdownMenu;
import 'package:taxiflutter/components/selection_Buttons/bluetooth.dart';

import '../color_Theme/color_theme.dart' show ColorTheme;
import '../components/menu_items_Navigation/dropdown_menu.dart'
    show DropdownMenu;

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorTheme.driverBase),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 23,
            bottom: 20,
          ),
          decoration: BoxDecoration(
            color: ColorTheme.surfaceBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.clear, color: ColorTheme.platinum),
                ),
              ),

              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    minimumSize: Size.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: BorderSide(color: Color(0XFF274577), width: 1.5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.person, color: Colors.white),
                      const SizedBox(width: 8),
                      const Text(
                        'Fornavn etternavn 12',
                        style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 18,
                          color: Color(0xffF5F7FA),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 50),

              DropdownMenu(
                index: currentIndex,
                vehicle: "Bike",
                onChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
              ),

              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 25,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: ColorTheme.driverBase,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select with QR-code',
                        style: TextStyle(
                          color: ColorTheme.platinum,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: ColorTheme.platinum),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 48),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0XFF274577),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'View your trip history',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 25,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: ColorTheme.driverBase,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trip History',
                        style: TextStyle(
                          color: ColorTheme.platinum,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: ColorTheme.platinum),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 48),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0XFF274577),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Taximeter connection',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              BluetoothStatusCard(
                  state: BluetoothState.disconnected),

              const SizedBox(height: 12),

              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 25,

                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                      color: Color(0xFF1E2F4D)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Connected to vehicle: Toyota #63891',
                        style: TextStyle(
                          color: ColorTheme.platinum,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(Icons.done, color: Color(0XFF10B981)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 63),
              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    minimumSize: Size.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: BorderSide(color: Color(0XFF274577), width: 1.5),
                  ),
                  child: const Text(
                        'Log out',
                        style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 18,
                          color: Color(0xffCACACA),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),

              const SizedBox(height: 12),
              Center(
                child: const Text(
                  'Version',
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 12,
                    color: Color(0xffCACACA),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
