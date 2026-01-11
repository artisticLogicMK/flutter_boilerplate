import 'package:flutter/material.dart';

Future<DateTime?> pickDate({
  required BuildContext context,
  DateTime? initialDate,
}) {
  return showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: const Color(0xFF00a6f4),
            onSurface: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        child: child!,
      );
    },
  );
}

Future<TimeOfDay?> pickTime({
  required BuildContext context,
  TimeOfDay? initialTime,
}) {
  return showTimePicker(
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
  );
}
