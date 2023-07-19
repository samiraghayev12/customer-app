import 'package:flutter/material.dart';

class DatePicker {
  static show(context, {int? firstDate, DateTime? selectedDate, DateTime? lastDate}) async {
    return await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(firstDate ?? 1900),
      lastDate: lastDate ?? DateTime(2100),
      confirmText: 'confirm',
      cancelText: 'cancel',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            shadowColor: Colors.white,
            colorScheme: const ColorScheme.light(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              surface: Colors.deepPurple,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
          ),
          child: Container(
            child: child,
          ),
        );
      },
    );
  }
}
