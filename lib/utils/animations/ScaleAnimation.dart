import 'dart:ui';

import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  final double scale;
  final int duration;
  final Widget child;

  const ScaleAnimation({
    super.key,
    required this.scale,
    this.duration = 150,
    required this.child,
  });

  @override
  State<ScaleAnimation> createState() => _ScaleState();
}

class _ScaleState extends State<ScaleAnimation> {
  double _scale = 1.0;
  bool _isPressed = false;

  void _pointerDown() async {
    _isPressed = true;

    // scale down first
    setState(() => _scale = widget.scale);

    // wait for animation to finish
    await Future.delayed(Duration(milliseconds: widget.duration));

    // stay down while pressed
    while (_isPressed) {
      await Future.delayed(const Duration(milliseconds: 16));
    }

    // finger released → scale back up
    if (mounted) setState(() => _scale = 1.0);
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
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(milliseconds: widget.duration),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
