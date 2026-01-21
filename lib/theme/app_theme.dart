import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Vibrant gradient colors - Enhanced
  static const Color primaryColor = Color(0xFFFF4757); // Vibrant Red-Orange
  static const Color secondaryColor = Color(0xFFFF6348); // Coral Orange
  static const Color accentColor = Color(0xFF1E90FF); // Dodger Blue
  static const Color backgroundColor = Color(0xFF0D0D1E); // Deeper Navy
  static const Color surfaceColor = Color(0xFF1C1C3A); // Rich Purple-Blue
  static const Color cardColor = Color(0xFF2A2D4A); // Enhanced Card

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
