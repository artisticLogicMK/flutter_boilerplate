import 'package:flutter/material.dart';
import 'package:secondbrain/screens/create_reminder_screen.dart';
import 'package:secondbrain/theme/app_text.dart';
import 'package:secondbrain/theme/theme_extensions.dart';

class SelectReminderTile extends StatelessWidget {
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final Widget screen;

  const SelectReminderTile({
    super.key,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = context.nt.neutral100; // Slightly lighter for the card

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        highlightColor: context.nt.neutral350,
        splashColor: context.nt.neutral300,
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => screen
            ),
          );
        },
        child: Ink(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: context.nt.neutral50),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Icon Container
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(icon, color: color),
                        ),
                        SizedBox(width: 7),
                        Text(
                          name,
                          style: TextStyle(
                            color: context.nt.neutral800,
                            fontSize: context.text.xl - 1,
                            fontWeight: context.font.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        color: context.nt.neutral550,
                        fontSize: context.text.base,
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(width: 2),
              // Chevron
              Icon(Icons.chevron_right, color: context.nt.neutral600),
            ],
          ),
        ),
      ),
    );
  }
}
