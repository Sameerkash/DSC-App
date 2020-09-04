import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.deepPurple[700],
      iconTheme: IconThemeData(),
      textTheme: TextTheme(
          headline1: GoogleFonts.openSans(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700)),
    ),
    primaryColor: Colors.deepPurple[700],
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey[50],
    accentColor: Colors.green,
    cardColor: Colors.white,
    textTheme: TextTheme(
      headline1: GoogleFonts.openSans(color: Colors.white, fontSize: 30),
      headline2: GoogleFonts.openSans(color: Colors.white, fontSize: 22),
      bodyText1: GoogleFonts.openSans(color: Colors.black, fontSize: 16),
      subtitle1: GoogleFonts.openSans(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      bodyText2: GoogleFonts.openSans(color: Colors.black, fontSize: 20),
      headline3: GoogleFonts.openSans(
          color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.grey,
      iconTheme: IconThemeData(),
      textTheme: TextTheme(
          headline1: GoogleFonts.openSans(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600)),
    ),
    cardColor: Colors.white,
    primaryColor: Colors.deepPurple,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    accentColor: Colors.green,
    textTheme: TextTheme(
      headline1: GoogleFonts.openSans(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
      headline2: GoogleFonts.openSans(color: Colors.white, fontSize: 22,),
      bodyText1: GoogleFonts.openSans(color: Colors.white, fontSize: 16),
      subtitle1: GoogleFonts.openSans(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      bodyText2: GoogleFonts.openSans(color: Colors.white, fontSize: 20),
      headline3: GoogleFonts.openSans(
          color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}
