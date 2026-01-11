import 'package:flutter/material.dart';
import 'package:secondbrain/components/material/ElevatedBtn.dart';
import 'package:secondbrain/components/reminder_screen/ReminderTile.dart';
import 'package:secondbrain/screens/create_reminder_screen.dart';
import 'package:secondbrain/theme/app_text.dart';
import 'package:secondbrain/theme/theme_extensions.dart';
import 'package:secondbrain/utils/animations/TapColorAnimation.dart';
import 'package:secondbrain/utils/animations/ScaleAnimation.dart';

class CreateReminderScreen extends StatelessWidget {
  final int initialTab;

  const CreateReminderScreen({super.key, this.initialTab = 1});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [

          // 2. Search Input (Floating: uncollapses on scroll up)
          SliverAppBar(
            backgroundColor: context.nt.neutral200,
            surfaceTintColor: context.nt.neutral200,
            pinned: false,
            floating: true,
            snap: true,
            expandedHeight: 70, // Height of your search bar
            flexibleSpace: FlexibleSpaceBar(
              // The 'background' property fades out automatically as the bar collapses
              background: Container(
                ),
            ),
          ),


          // 3. Reminder Title & Buttons (Stays pinned at the top)
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: context.nt.neutral200,
            surfaceTintColor: context.nt.neutral200,
            pinned: true,
            toolbarHeight: 135.0, // Adjusted for the Column height
            flexibleSpace: DefaultTabController(
              length: 2,
              initialIndex: initialTab,
              child: Builder(
                builder: (context) {
                  final TabController controller =
                      DefaultTabController.of(context);

                  return Column(
                    children: [
                      TabBar(
                        tabs: const [
                          Tab(text: 'Tab 1',icon: Icon(Icons.event),),
                          Tab(text: 'Tab 2'),
                        ],
                      ),

                      ElevatedButton(
                        onPressed: () {
                          controller.animateTo(1); // switch to Tab 2
                        },
                        child: const Text('Go to Tab 2'),
                      ),

                      Expanded(
                        child: TabBarView(
                          children: const [
                            Center(child: Text('Content 1')),
                            Center(child: Text('Content 2')),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ),



          // 4. The List of Reminders
          SliverFillRemaining(
            
          ),
        ],
      ),
    );
  }
}
