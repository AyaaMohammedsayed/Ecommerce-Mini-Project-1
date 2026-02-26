import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryWhite = Colors.white;
  static const Color tealAccent = Color(0xFF00897B);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: tealAccent,
    drawerTheme: DrawerThemeData(backgroundColor: primaryWhite),
    scaffoldBackgroundColor: primaryWhite,
    
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryWhite,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: tealAccent),
      titleTextStyle: TextStyle(
        color: tealAccent,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),

    textTheme: TextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: tealAccent,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: tealAccent, width: 1.5),
      ),
    ),
  );
}
