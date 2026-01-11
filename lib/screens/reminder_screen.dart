import 'package:flutter/material.dart';
import 'package:secondbrain/components/material/ElevatedBtn.dart';
import 'package:secondbrain/components/reminder_screen/ReminderTile.dart';
import 'package:secondbrain/screens/select_reminder_screen.dart';
import 'package:secondbrain/theme/app_text.dart';
import 'package:secondbrain/theme/theme_extensions.dart';
import 'package:secondbrain/utils/animations/TapColorAnimation.dart';
import 'package:secondbrain/utils/animations/ScaleAnimation.dart';

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
            backgroundColor: context.nt.neutral200,
            surfaceTintColor: context.nt.neutral200,
            expandedHeight: 115.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/icon.png', width: 50),
                    SizedBox(height: 10),
                    Text(
                      "Tue, Jan 6, 12:14 PM",
                      style: TextStyle(
                        fontSize: context.text.base,
                        fontWeight: context.font.semibold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),


          // 2. Search Input (Floating: uncollapses on scroll up)
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: context.nt.neutral200,
            surfaceTintColor: context.nt.neutral200,
            pinned: false,
            floating: true,
            snap: true,
            expandedHeight: 70, // Height of your search bar
            flexibleSpace: FlexibleSpaceBar(
              // The 'background' property fades out automatically as the bar collapses
              background: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search reminders...',
                    hintStyle: TextStyle(color: context.nt.neutral400, fontSize: 16),
                    prefixIcon: Icon(Icons.search, color: context.nt.neutral400),
                    filled: true,
                    fillColor: context.nt.neutral50, // The light grey from your image
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Perfect pill shape
                      borderSide: BorderSide.none, // No visible outline
                    ),
                  ),
                ),
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
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 23),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reminders',
                        style: TextStyle(fontWeight: context.font.semibold, fontSize: context.text.xl3 - 2),
                      ),
                      IconButton.filled(
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const SelectReminderScreen()
                            ),
                          );
                        },
                        icon: Icon(Icons.add)
                      )
                    ],
                  ),

                  SizedBox(height: 10),
                  ShaderMask(
                    shaderCallback: (Rect rect) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.black, Colors.transparent],
                        stops: [0.75, 1.0], // The fade starts at 80% of the width
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstIn,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(right: 60),
                      child: Row(
                        children: [
                          FilledButton(onPressed: () {}, child: Text("All")),
                          const SizedBox(width: 12),
                          ElevatedBtn(
                            onPressed: () {},
                            icon: const Icon(Icons.location_on_outlined, color: Color(0xFFfe9a00)),
                            label: const Text("Context-aware"),
                          ),
                          const SizedBox(width: 12),
                          ElevatedBtn(
                            onPressed: () {},
                            icon: const Icon(Icons.history, color: Color(0xFF00c951)),
                            label: const Text("Repeating"),
                          ),
                          const SizedBox(width: 12),
                          ElevatedBtn(
                            onPressed: () {},
                            icon: const Icon(Icons.event, color: Color(0xFF00a6f4)),
                            label: const Text("One-time"),
                          ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),



          // 4. The List of Reminders
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => TapColorAnimation(
                color: context.nt.neutral200,
                child: ReminderTile(
                  title: 'Reminder Item $index',
                  subtitle: 'Context aware',
                  isActive: true
                ),
              ),
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
