import 'package:flutter/material.dart';
import 'package:food_pos/core/constants/text_styles.dart';
import 'package:food_pos/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
        backgroundColor: const Color(0xff252836),
        textTheme: GoogleFonts.barlowTextTheme()
            .apply(displayColor: Colors.white, bodyColor: Colors.white)
            .merge(TextTheme(
                headline1: TextStyles.h1,
                headline2: TextStyles.h1.copyWith(fontSize: 20))),
        scaffoldBackgroundColor: AppColors.background);
  }

  static ThemeData get lightTheme {
    return ThemeData(
        primarySwatch: Colors.blue, backgroundColor: AppColors.background);
  }
}
