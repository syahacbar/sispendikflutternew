// lib/core/theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xFF002F6C); // Biru SatuDikti
  static const secondaryColor = Color(0xFF00B894); // Aksen tosca
  static const backgroundColor = Color(0xFFF5F7FA); // Latar abu terang

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      background: backgroundColor,
    ),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    ),

    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      color: Colors.white,
      shadowColor: Colors.black12,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: Colors.grey[600]),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        textStyle: const TextStyle(fontWeight: FontWeight.w500),
      ),
    ),

    textTheme: GoogleFonts.poppinsTextTheme(),

    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
