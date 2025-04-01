  import 'package:flutter/material.dart';

ThemeData getDatePickerTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      colorScheme: const ColorScheme.light(
        primary: Colors.black,
        onPrimary: Colors.white,
        onSurface: Colors.black,
        surface: Colors.white,
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
      dialogBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        labelLarge: TextStyle(
          fontSize: 14,
          fontFamily: 'ClashDisplayBold',
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontFamily: 'ClashDisplayBold',
        ),
        headlineLarge: TextStyle(
          fontSize: 16,
          fontFamily: 'ClashDisplayMedium',
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          fontFamily: 'ClashDisplayMedium',
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          fontFamily: 'ClashDisplayMedium',
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontFamily: 'ClashDisplayMedium',
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontFamily: 'ClashDisplayMedium',
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          fontFamily: 'ClashDisplayMedium',
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontFamily: 'ClashDisplayRegular',
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontFamily: 'ClashDisplayRegular',
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontFamily: 'ClashDisplayRegular',
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 8,
      ),
    );
  }