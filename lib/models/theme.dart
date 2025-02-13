import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const primarycolorlight = Color(0xFF5669FF);
  static const secondaryColorLightdark = Color(0xFFF2FEFF);
  static const primaryColordark = Color(0xFF101127);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primarycolorlight,
      focusColor: Colors.grey,
      scaffoldBackgroundColor: secondaryColorLightdark,
      appBarTheme: const AppBarTheme(
          elevation: 0, backgroundColor: Colors.transparent, centerTitle: true),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: secondaryColorLightdark,
        unselectedItemColor: primarycolorlight,
        type: BottomNavigationBarType.fixed,
      ),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.inter(
            color: primarycolorlight,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: primarycolorlight,
          ),
          titleSmall: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          )));

  static ThemeData darkTheme = ThemeData(
      focusColor: primarycolorlight,
      scaffoldBackgroundColor: primaryColordark,
      primaryColor: primaryColordark,
      appBarTheme: const AppBarTheme(
          centerTitle: true, elevation: 0, backgroundColor: Colors.transparent),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primaryColordark,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Color(0xFFF4EBDC),
          unselectedItemColor: primaryColordark,
          type: BottomNavigationBarType.fixed),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: primarycolorlight),
          titleMedium: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: primarycolorlight),
          titleSmall: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: primarycolorlight)));
}
