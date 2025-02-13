import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const primarycolorlight = Color(0xFFF2FEFF);
  static const secondaryColorLightdark = Color(0xFF5669FF);
  static const primaryColordark = Color(0xFF101127);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primarycolorlight,
      scaffoldBackgroundColor: primarycolorlight,
      appBarTheme: const AppBarTheme(
          elevation: 0, backgroundColor: Colors.transparent, centerTitle: true),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: primarycolorlight,
        unselectedItemColor: secondaryColorLightdark,
        type: BottomNavigationBarType.fixed,
      ),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.inter(
            color: secondaryColorLightdark,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: secondaryColorLightdark,
          ),
          titleSmall: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          )));

  static ThemeData darkTheme = ThemeData(
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
              color: secondaryColorLightdark),
          titleMedium: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: secondaryColorLightdark),
          titleSmall: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: secondaryColorLightdark)));
}
