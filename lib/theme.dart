import 'package:flutter/material.dart';

ThemeData buildTheme() {
  const white = Color(0xFFFFFFFF);
  const black = Color(0xFF000000);
  const darkGrey = Color(0xFF262626);
  const recordRed = Color(0xFFFA3532);
  final textTheme = const TextTheme().copyWith(
    displayLarge: const TextStyle(
      fontFamily: 'SF Pro',
      fontWeight: FontWeight.w700,
      fontSize: 77.5,
      height: 1.193359375,
      color: white,
    ),
    displayMedium: const TextStyle(
      fontFamily: 'SF Pro',
      fontWeight: FontWeight.w600,
      fontSize: 145.3125,
      height: 1.193359375,
      color: white,
    ),
    headlineMedium: const TextStyle(
      fontFamily: 'SF Pro',
      fontWeight: FontWeight.w100,
      fontSize: 48,
      height: 1.193359375,
      color: white,
    ),
  );
  return ThemeData(
    scaffoldBackgroundColor: black,
    colorScheme: ColorScheme.fromSeed(seedColor: recordRed).copyWith(
      surface: black,
      onSurface: white,
      primary: recordRed,
      onPrimary: white,
      secondary: darkGrey,
    ),
    textTheme: textTheme,
    useMaterial3: true,
  );
}
