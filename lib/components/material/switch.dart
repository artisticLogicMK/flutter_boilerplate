import 'package:flutter/material.dart';
import 'package:secondbrain/theme/theme_extensions.dart';

class QSwitch extends StatelessWidget {
  final bool isActive;
  final String size;
  final void Function(bool)? onChanged;

  const QSwitch({
    super.key,
    required this.isActive,
    this.size = 'md',
    required this.onChanged 
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: size == 'sm' ? 0.8 : 1,
      child: Switch(
        padding: EdgeInsets.all(0),
        value: isActive,
        onChanged: onChanged,
        inactiveTrackColor: context.nt.neutral300,
        inactiveThumbColor: context.nt.neutral600,
        activeTrackColor: context.nt.neutral800,
        activeThumbColor: context.nt.neutral100,
        trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.transparent; // No border when ON
          }
          return context.nt.neutral400; // Border color when OFF
        }),
      ),
    );
  }
}