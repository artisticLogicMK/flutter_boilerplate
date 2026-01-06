import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secondbrain/screens/reminder_screen.dart';
import 'package:secondbrain/sliver.dart';
import 'package:secondbrain/theme_playground.dart';
import 'package:secondbrain/utils/PageTransitionSwitcher.dart';
import 'theme/theme_extensions.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int selectedIndex = 0;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {

    List screens = [
      ReminderScreen(key: ValueKey('ReminderScreen')),
      ThemePreviewScreen(key: ValueKey('ThemePreviewScreen')),
      Sliver(key: ValueKey('Sliver'))
    ];

    // Determine if we are on a large screen
    bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: context.neutrals.neutral100,
      // Bottom Bar only shows on small screens
      bottomNavigationBar: isLargeScreen 
        ? null 
      : BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int index) => setState(() => selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Reminder'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),

      body: SafeArea(
        child: Row(
          children: [
            // Navigation Rail only shows on large screens
            if (isLargeScreen)
              NavigationRail(
                minExtendedWidth: 150,
                selectedIndex: selectedIndex,
                onDestinationSelected: (int index) => setState(() => selectedIndex = index),
                // labelType: NavigationRailLabelType.all,
                extended: _isExpanded,
                leading: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: FlutterLogo(),
                ),
                trailing: IconButton(
                  icon: Icon(_isExpanded ? Icons.menu_open : Icons.menu),
                  onPressed: () => setState(() => _isExpanded = !_isExpanded),
                  padding: EdgeInsets.only(top: 30),
                ),
                destinations: const [
                  NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                  NavigationRailDestination(icon: Icon(Icons.search), label: Text('Search')),
                  NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings')),
                ],
              ),
            
            // Your main Sliver content goes here
            Expanded(
              child: PageTransitionSwitcher(
                child: screens[selectedIndex]
              )
            ),
          ],
        ),
      ),
    );
  }
}
