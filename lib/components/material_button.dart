import 'package:flutter/material.dart';
import 'package:secondbrain/theme/app_colors.dart';
import 'package:secondbrain/theme/theme_extensions.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? background;
  final Color? foreground;

  const AppButton({
    required this.label,
    required this.onPressed,
    this.background,
    this.foreground,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: background ?? context.neutrals.neutral900,
        foregroundColor: foreground ?? Colors.white,
        padding: const EdgeInsets.symmetric(
            vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(label),
    );
  }
}
