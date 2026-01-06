import 'package:flutter/material.dart';

class PageTransitionSwitcher extends StatelessWidget {
  final Widget child;

  const PageTransitionSwitcher({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      // Use a custom curve for a more "premium" feel
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (Widget child, Animation<double> animation) {
        // Combines Fade and Slide
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.02, 0), // Subtle slide from the right
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}