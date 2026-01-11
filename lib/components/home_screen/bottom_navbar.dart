import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:secondbrain/theme/theme_extensions.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;

   const BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: GNav(
        tabBackgroundColor: context.nt.neutral300,
        color: context.nt.neutral400,
        activeColor: context.nt.neutral900,
        mainAxisAlignment: MainAxisAlignment.center,
        gap: 6,
        iconSize: 24,
        textSize: 16,
        tabMargin: const EdgeInsets.symmetric(horizontal: 10),
        duration: Duration(milliseconds: 300),
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          const GButton(
            icon: Icons.access_time_filled,
            text: 'Reminders',
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          ),
          const GButton(
            icon: Icons.settings,
            text: 'Settings',
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          )
        ]
      ),
    );
  }
}