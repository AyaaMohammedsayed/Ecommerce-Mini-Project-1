import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.white;
    static ThemeData lightTheme = ThemeData(
    drawerTheme: DrawerThemeData(backgroundColor: primary),
    scaffoldBackgroundColor: primary.withValues(alpha: 0.1),
    textTheme: TextTheme(
     
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
  
    ),
    inputDecorationTheme: InputDecorationTheme(
    )
  );

}
