import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Vibrant gradient colors
  static const Color primaryColor = Color(0xFFFF6B35); // Vibrant Orange
  static const Color secondaryColor = Color(0xFFF7931E); // Golden Orange
  static const Color accentColor = Color(0xFF00D9FF); // Electric Cyan
  static const Color backgroundColor = Color(0xFF0A0E27); // Deep Navy
  static const Color surfaceColor = Color(0xFF1A1F3A); // Dark Purple-Blue
  static const Color cardColor = Color(0xFF252B48); // Elevated Card

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColor,
      onSurface: Colors.white,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.grey[400],
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
