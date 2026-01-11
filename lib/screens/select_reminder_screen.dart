import 'package:flutter/material.dart';
import 'package:secondbrain/components/select_reminder_screen/select_tile.dart';
import 'package:secondbrain/screens/one_time_reminder/one_time_reminder_screen.dart';
import 'package:secondbrain/theme/app_text.dart';
import 'package:secondbrain/theme/theme_extensions.dart';


class SelectReminderScreen extends StatelessWidget {
  const SelectReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using your theme extensions or standard colors
    final backgroundColor = context.nt.neutral200; // Dark navy from image

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 32),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Select Reminder',
          style: TextStyle(
            fontWeight: context.font.semibold,
            color: context.nt.neutral800,
            fontSize: context.text.lg
          ),
        ),
        centerTitle: true,
      ),


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How do you want to be reminded?',
                style: TextStyle(
                  color: context.nt.neutral800,
                  fontSize: context.text.xl3 - 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Choose the trigger that best fits your memory needs.',
                style: TextStyle(
                  color: context.nt.neutral600,
                  fontSize: context.text.lg - 1,
                ),
              ),
              const SizedBox(height: 0),
              
        
              Expanded(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent, // Top is transparent (hidden)
                        Colors.black,       // Bottom is solid (visible)
                      ],
                      // The fade happens in the first 10% of the container height
                      stops: [0.0, 0.07], 
                    ).createShader(bounds);
                  },
                  // This mode ensures the transparency in our gradient masks the content
                  blendMode: BlendMode.dstIn,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 28),
                        SelectReminderTile(
                          name: 'One-time',
                          description: 'Set a specific date and time. Perfect for appointments, one-off tasks, or quick nudges today.',
                          icon: Icons.history,
                          color: Color(0xFF00a6f4),
                          screen: OneTimeReminderScreen(isEdit: false)
                        ),
                  
                        SizedBox(height: 15),
                        SelectReminderTile(
                          name: 'Context-aware',
                          description: 'Get notified based on location, or when something happens. Remind me to buy milk when am in the store.',
                          icon: Icons.location_on_outlined,
                          color: Color(0xFFfe9a00),
                          screen: OneTimeReminderScreen()
                        ),
                  
                        SizedBox(height: 15),
                        SelectReminderTile(
                          name: 'Repeating',
                          description: 'Build habits or manage recurring tasks. Choose daily, weekly, monthly or custom patterns that fit your life.',
                          icon: Icons.event,
                          color: Color(0xFF00c951),
                          screen: OneTimeReminderScreen()
                        ),
                      ],
                    ),
                  ),
                ),
              )    
            ],
          ),
        ),
      ),
    );
  }
}