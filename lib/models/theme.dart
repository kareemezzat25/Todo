import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const primarycolorlight = Color(0xFF5669FF);
  static const secondaryColorLightdark = Color(0xFFF2FEFF);
  static const primaryColordark = Color(0xFF101127);
  static const secondaryColorDark = Color(0xFFF4EBDC);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primarycolorlight,
      focusColor: Colors.grey,
      scaffoldBackgroundColor: secondaryColorLightdark,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primarycolorlight,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34.r),
              borderSide: const BorderSide(color: Colors.white, width: 4))),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: primaryColordark),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: GoogleFonts.inter(
            fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.white),
        unselectedLabelStyle: GoogleFonts.inter(
            fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.white),
        backgroundColor: primarycolorlight,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white,
        selectedItemColor: secondaryColorLightdark,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        type: BottomNavigationBarType.fixed,
      ),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.inter(
            color: primarycolorlight,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: primarycolorlight,
          ),
          titleSmall: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white),
          bodySmall: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white)));

  static ThemeData darkTheme = ThemeData(
      focusColor: primarycolorlight,
      primaryColor: primaryColordark,
      scaffoldBackgroundColor: primaryColordark,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColordark,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34.r),
              borderSide:
                  const BorderSide(color: secondaryColorDark, width: 4))),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: primarycolorlight),
          titleTextStyle: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: primarycolorlight),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primaryColordark,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedIconTheme: const IconThemeData(color: secondaryColorDark),
          selectedLabelStyle: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: secondaryColorDark),
          unselectedLabelStyle: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: secondaryColorDark),
          selectedItemColor: secondaryColorDark,
          unselectedItemColor: secondaryColorDark,
          type: BottomNavigationBarType.fixed),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: primarycolorlight),
          titleMedium: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: primarycolorlight),
          titleSmall: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: primarycolorlight),
          bodyLarge: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white),
          bodySmall: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white)));
}
