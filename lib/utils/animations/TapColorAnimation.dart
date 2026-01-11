import 'dart:ui';

import 'package:flutter/material.dart';

class TapColorAnimation extends StatefulWidget {
  final Color color; // decoration while pressed
  final int duration;
  final Widget child;

  const TapColorAnimation({
    super.key,
    required this.color,
    this.duration = 170,
    required this.child,
  });

  @override
  State<TapColorAnimation> createState() => _TapColorAnimationState();
}

class _TapColorAnimationState extends State<TapColorAnimation> {
  bool _isPressed = false;

  void _pointerDown() async {
    _isPressed = true;
    setState(() {});

    // wait for the animation to finish
    await Future.delayed(Duration(milliseconds: widget.duration));

    // stay pressed while finger is down
    while (_isPressed) {
      await Future.delayed(const Duration(milliseconds: 16));
    }

    // release → automatically animates back
    if (mounted) setState(() {});
  }

  void _pointerUp() {
    _isPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        final isMobile = Theme.of(context).platform == TargetPlatform.iOS ||
      Theme.of(context).platform == TargetPlatform.android;

  if (isMobile && event.kind == PointerDeviceKind.touch) {
          _pointerDown();
        }
      },
      onPointerUp: (_) => _pointerUp(),
      onPointerCancel: (_) => _pointerUp(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.duration),
        curve: Curves.easeOut,
        decoration: BoxDecoration(color: _isPressed ? widget.color : null),
        child: widget.child,
      ),
    );
  }
}
