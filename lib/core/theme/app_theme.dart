import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    scaffoldBackgroundColor: AppColors.primaryWhite,
    primaryColor: AppColors.primaryGreen,
    textTheme: GoogleFonts.interTextTheme(),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.primaryGreen),
      titleTextStyle: TextStyle(
        fontSize: 24,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryGreen,
    ).copyWith(surface: AppColors.primaryWhite),
  );
}
