import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reorderable_todo_list/theme/colours.dart';

class BensTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColours.darkGrey,
    ),
    headline1: GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColours.darkGrey,
    ),
    headline2: GoogleFonts.poppins(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: AppColours.darkGrey,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColours.darkGrey,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: AppColours.darkGrey,
    ),
    headline5: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColours.darkGrey,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: AppColours.darkGrey,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
              (states) {
            return AppColours.darkGrey;
          },
        ),
      ),
      textTheme: lightTextTheme,
    );
  }
}