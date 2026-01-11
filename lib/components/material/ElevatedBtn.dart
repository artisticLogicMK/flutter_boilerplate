import 'package:flutter/material.dart';
import 'package:secondbrain/theme/theme_extensions.dart';

class ElevatedBtn extends StatelessWidget {
  const ElevatedBtn({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.color
  });

  final VoidCallback onPressed;
  final Widget label;
  final Icon? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: context.nt.neutral100
      ),
      icon: icon,
      label: label,
    );
  }
}
