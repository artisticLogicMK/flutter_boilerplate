import 'package:flutter/material.dart';
import 'package:secondbrain/theme/app_text.dart';
import 'package:secondbrain/theme/theme_extensions.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
          slivers: [
            // 1. Logo and Countdown (Disappears first)
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: context.neutrals.neutral100,
              surfaceTintColor: context.neutrals.neutral100,
              expandedHeight: 120.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 40, width: 40, color: Colors.amber),
                    Text("Reminder in 23 hours, 30 minutes"),
                    Text(
                      "Tue, Jan 6, 12:14 PM",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
        
        
            // 2. Search Input (Floating: uncollapses on scroll up)
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: context.neutrals.neutral100,
              surfaceTintColor: context.neutrals.neutral100,
              pinned: false,
              floating: true,
              snap: true,
              expandedHeight: 80, // Height of your search bar
              flexibleSpace: FlexibleSpaceBar(
                // The 'background' property fades out automatically as the bar collapses
                background: Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search reminders...',
                      iconColor: context.neutrals.neutral700,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: Colors.transparent,
                      filled: true,
                    ),
                  ),
                ),
              ),
            ),
        
        
            // 3. Reminder Title & Buttons (Stays pinned at the top)
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: context.neutrals.neutral100,
              surfaceTintColor: context.neutrals.neutral100,
              pinned: true,
              toolbarHeight: 100.0, // Adjusted for the Column height
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reminders',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Row(
                    children: [
                      TextButton(onPressed: () {}, child: Text("All")),
                      TextButton(onPressed: () {}, child: Text("Completed", style: TextStyle(fontSize: context.text.x3l))),
                    ],
                  ),
                ],
              ),
            ),
        
        
            // 4. The List of Reminders
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Text('Reminder Item $index'),
                  subtitle: Text('Details for this reminder'),
                ),
                childCount: 50,
              ),
            ),
          ],
        ),
      );
    
  }
}
