import 'package:flutter/material.dart';
import 'package:secondbrain/components/material/switch.dart';
import 'package:secondbrain/theme/app_text.dart';
import 'package:secondbrain/theme/theme_extensions.dart';
import 'package:secondbrain/utils/date_time_pickers.dart';

class OneTimeReminderScreen extends StatefulWidget {
  final bool isEdit;

  const OneTimeReminderScreen({super.key, this.isEdit = false});

  @override
  State<OneTimeReminderScreen> createState() => _OneTimeReminderScreenState();
  
}

class _OneTimeReminderScreenState extends State<OneTimeReminderScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    // Possible hints
    final List<String> hints = [
      'e.g. Take medication',
      'e.g. Call Mom this evening',
      'e.g. Meeting with Sarah',
      'e.g. Pick up cloths',
    ];

    // Show any hint from the lsit
    String randomHint = (hints..shuffle()).first;

    // Using your theme extensions or standard colors
    final backgroundColor = context.nt.neutral200; // Dark navy from image

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(
            widget.isEdit ? Icons.chevron_left : Icons.close, size: 28
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: widget.isEdit ? [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: QSwitch(isActive: false, size: 'md', onChanged: (_){}),
          )
        ] : null,
        title: Text(
          widget.isEdit ? 'Edit Reminder' : 'Create Reminder',
          style: TextStyle(
            fontWeight: context.font.semibold,
            color: context.nt.neutral800,
            fontSize: context.text.lg
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: context.nt.neutral300, height: 1.0,
          ),
        ),
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),

              // Reminder indicator
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: context.nt.neutral300
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.event, color: Color(0xFF00a6f4)),
                      SizedBox(width: 6),
                      Text('ONE-TIME REMINDER', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),


              // Input : Name of reminder
              SizedBox(height: 30),
              Text('What do you want to remember', style: TextStyle(
                fontWeight: context.font.semibold,
                fontSize: context.text.base,
                color: context.nt.neutral700
              )),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: randomHint,
                  hintStyle: TextStyle(color: context.nt.neutral400, fontSize: 16),
                  filled: true,
                  fillColor: context.nt.neutral100, // The light grey from your image
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), // Perfect pill shape
                    borderSide: BorderSide.none, // No visible outline
                  ),
                ),
              ),


              // Select date and time
              SizedBox(height: 30),
              Text('When do you want this to happen', style: TextStyle(
                fontWeight: context.font.semibold,
                fontSize: context.text.base,
                color: context.nt.neutral700
              )),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  final picked = await pickDate(context: context, initialDate: _selectedDate );

                  if (picked != null) { setState(() => _selectedDate = picked); }
                },
                child: Container(width: 50, height: 50, color: Colors.amber,)
              ),
              GestureDetector(
                onTap: () async {
                  final picked = await pickTime(context: context, initialTime: _selectedTime );

                  if (picked != null) { setState(() => _selectedTime = picked); }
                },
                child: Container(width: 50, height: 50, color: Colors.amber,)
              )
            ],
          ),
        ),
      ),
    );
  }
}