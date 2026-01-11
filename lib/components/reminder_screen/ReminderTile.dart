import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:secondbrain/components/material/switch.dart';
import 'package:secondbrain/theme/app_text.dart';
import 'package:secondbrain/theme/theme_extensions.dart';

class ReminderTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;

  const ReminderTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: context.nt.neutral100, // Light grey background from your image
        borderRadius: BorderRadius.circular(28),
      ),
      child: ClipRRect(
        // Slidable pane for delete action
        child: Slidable(
          endActionPane: ActionPane(
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                onPressed: (_) { print('Delete'); },
                icon: Icons.delete,
                label: 'Delete',
                backgroundColor: isDark ? Colors.red.shade300.withAlpha(70) : Colors.red.shade200,
                borderRadius: BorderRadius.circular(28),
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              children: [
                // Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tilte
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: context.font.semibold,
                          fontSize: context.text.lg,
                        ),
                        maxLines: 1, // limit to 1 line
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: 5),

                      // Subtitle
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: context.text.base - 1,
                            color: context.nt.neutral500,
                          ),
                          SizedBox(width: 3),
                          Text(
                            subtitle,
                            style: TextStyle(
                              color: context.nt.neutral500,
                              fontSize: context.text.base - 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // The Custom Switch
                QSwitch(isActive: isActive, onChanged: (_){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
