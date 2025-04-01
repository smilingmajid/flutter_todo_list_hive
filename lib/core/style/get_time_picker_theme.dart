import 'package:flutter/material.dart';

ThemeData getTimePickerTheme(BuildContext context) {
  return Theme.of(context).copyWith(
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      dayPeriodColor: Colors.white,
      dayPeriodTextColor: Colors.black,
      hourMinuteColor: Colors.white,
      hourMinuteTextColor: Colors.black,
      dialHandColor: Colors.black,
      dialBackgroundColor: Colors.grey.shade200,
      hourMinuteTextStyle: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        fontFamily: 'ClashDisplayMedium',
      ),
      dayPeriodTextStyle: const TextStyle(
        fontSize: 16,
        fontFamily: 'ClashDisplayRegular',
      ),
      helpTextStyle: const TextStyle(
        fontSize: 16,
        fontFamily: 'ClashDisplayMedium',
        color: Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 16,
          fontFamily: 'ClashDisplayRegular',
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}