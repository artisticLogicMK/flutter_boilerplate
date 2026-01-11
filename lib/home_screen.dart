import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secondbrain/components/home_screen/bottom_navbar.dart';
import 'package:secondbrain/components/home_screen/navigation_rail.dart';
import 'package:secondbrain/home_screen_.dart';
import 'package:secondbrain/screens/reminder_screen.dart';
import 'package:secondbrain/theme/app_text.dart';
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
  

  void changeIndex (index) {
    setState(() {
      selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    List screens = [
      ReminderScreen(key: ValueKey('ReminderScreen')),
      ThemePreviewScreen(key: ValueKey('ThemePreviewScreen')),
      Boiler(key: ValueKey('Boiler'))
    ];

    // Determine if we are on a large screen
    bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: context.nt.neutral200,
      extendBody: true,
      
      // Bottom Bar only shows on small screens
      // bottomNavigationBar: isLargeScreen 
      //   ? null 
      // : BottomNavigationBar(
      //   backgroundColor: context.nt.neutral200,
      //   currentIndex: selectedIndex,
      //   onTap: (int index) => setState(() => selectedIndex = index),
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Reminder'),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Settings'),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      //   ],
      // ),
      
      bottomNavigationBar: isLargeScreen 
        ? null : BottomNavBar(onTabChange: (index) => changeIndex(index)),

      body: SafeArea(
        child: Row(
          children: [
            // Navigation Rail only shows on large screens
            if (isLargeScreen) NavRail(selectedIndex: selectedIndex, changeIndex: changeIndex),
            
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
