import 'package:care_plus/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static ThemeData get lightThemeData {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
        colorSchemeSeed: AppColors.themeColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          minimumSize: const Size(double.infinity, 50),
        )),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 18),
          hintStyle: const TextStyle(color: AppColors.secondaryTextColor),
        )
    );
  }

  static ThemeData get darkThemeData {
    return ThemeData();
  }
}
