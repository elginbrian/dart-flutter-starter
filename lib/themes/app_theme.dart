import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF000000),
    primaryColor: const Color(0xFF222222),
    hintColor: const Color(0xFFEAEAEA),
    textTheme: TextTheme(
      bodyLarge:
          GoogleFonts.inter(color: const Color(0xFFEAEAEA), fontSize: 16),
      bodyMedium:
          GoogleFonts.inter(color: const Color(0xFFBBBBBB), fontSize: 14),
      titleLarge: GoogleFonts.inter(
          color: const Color(0xFFFFFFFF),
          fontSize: 20,
          fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF000000),
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      iconTheme: const IconThemeData(color: Color(0xFFEAEAEA)),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF333333),
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF222222),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF111111),
      hintStyle: GoogleFonts.inter(color: const Color(0xFF888888)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF111111),
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
    ),
    dividerColor: const Color(0xFF222222),
  );
}
