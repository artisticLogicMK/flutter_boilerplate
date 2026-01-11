import 'package:flutter/material.dart';
import 'package:secondbrain/theme/app_text.dart';

class NavRail extends StatefulWidget {
  final int selectedIndex;
  final Function changeIndex;

  const NavRail({
    super.key,
    required this.selectedIndex,
    required this.changeIndex,
  });

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      minExtendedWidth: 162,
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: (int index) => widget.changeIndex(index),
      // labelType: NavigationRailLabelType.all,
      extended: _isExpanded,
      leading: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: IconButton(
          icon: Icon(_isExpanded ? Icons.menu_open : Icons.menu),
          onPressed: () => setState(() => _isExpanded = !_isExpanded),
        ),
      ),
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.circle_notifications),
          label: Text('Reminder', style: TextStyle(fontSize: context.text.sm)),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          label: Text('Settings', style: TextStyle(fontSize: context.text.sm)),
        ),
      ],
    );
  }
}
