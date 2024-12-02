import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ThemeStyles {


  static const Color primary = Color(0xFF3078a6);
  static const Color primaryAccentColor = Color(0xFF70CFFF);
  static const Color primaryTextColor = Color(0xFF3D3D3D);
  static const Color secondaryTextColor = Color(0xFF6C6C6C);
  static const Color bulletColor = Color(0xFFD8A000);
  static const Color redColor = Color(0xFFE83E08);
  static const Color yellowColor = Color(0xfae6ff02);
  static const Color greenColor = Color(0xFF00AD48);
  static const Color yellowColorAccent = Color(0xFFFFF1A7);
  static const Color redColorAccent = Color(0xFFFFA7A7);
  static const Color orangeColorAccent = Color(0xFFFFDCA1);
  static const Color purpleColor = Colors.purple;
  static const Color disabledColor = Colors.black38;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;




  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: GoogleFonts.poppins().fontFamily,
      visualDensity: VisualDensity.comfortable,
      //for Testing
      primaryColor: ThemeStyles.primary,
      hintColor: ThemeStyles.whiteColor,
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: ThemeStyles.primary,
          contentTextStyle: TextStyle(
              color: ThemeStyles.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 24,
            color: ThemeStyles.fontColorBlack,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            fontSize: 16,
            color: ThemeStyles.fontColorBlack,
            fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
            fontSize: 14,
            color: ThemeStyles.fontColorBlack,
            fontWeight: FontWeight.w600),
      ),
      useMaterial3: false);



  /// font Colors
  static const Color fontColorWhite = Colors.white;
  static const Color fontColorBlack = Colors.black;

  /// font Size
  static const double fontSize = 16.0;

}
