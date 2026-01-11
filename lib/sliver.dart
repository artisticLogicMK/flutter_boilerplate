import 'package:flutter/material.dart';
import 'package:secondbrain/theme/theme_extensions.dart';

class Sliver extends StatelessWidget {
  const Sliver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 1. Logo and Countdown (Disappears first)
            SliverAppBar(
              automaticallyImplyLeading: false,
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
              pinned: false,
              floating: true,
              snap: true,
              expandedHeight: 80, // Height of your search bar
              flexibleSpace: FlexibleSpaceBar(
                // The 'background' property fades out automatically as the bar collapses
                background: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    // Centers the child horizontally
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 600,
                      ), // Max width of 600px
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search reminders...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 3. Reminder Title & Buttons (Stays pinned at the top)
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: context.nt.neutral100,
              surfaceTintColor: context.nt.neutral100,
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
                      FilledButton(onPressed: () {}, child: Text("All")),
                      TextButton(onPressed: () {}, child: Text("Completed")),
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
      ),
    );
  }
}
