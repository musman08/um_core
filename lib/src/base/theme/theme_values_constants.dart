import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get data => _data;

  static final _data = ThemeData(
    primaryColor: AppColors.secondaryColor,
    primarySwatch: Colors.blue,
    useMaterial3: true,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    buttonTheme: ButtonThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      buttonColor: AppColors.primaryColor
    ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all<Size>(Size.zero),

        ),
      ),

    tabBarTheme: TabBarTheme(
      labelColor: AppColors.secondaryColor,
      overlayColor: MaterialStateProperty.all<Color>(AppColors.secondaryColor.withOpacity(0.1)),
      indicatorColor: AppColors.secondaryColor,
      unselectedLabelColor: AppColors.secondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
    ),

    indicatorColor: AppColors.secondaryColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primaryColor)
  );
}


class AppColors {
  static const Color secondaryColor = Colors.black54;
  // static const Color secondaryColor = Color.fromARGB(255, 48, 150, 51);
  static const Color babyPowder = Color(0xFFF8F8FF);
  static const Color borderColorWhite = Color.fromARGB(255, 224, 224, 234);
  static const Color eggPlant = Color.fromARGB(255, 39, 37, 52);
  static const Color blackCoffee = Color(0xFF38354A);
  static const Color activeWeek = Color(0xFFEDEDED);
  static const Color primaryColor = Color.fromARGB(255, 48, 150, 51);
  static const Color backgroundColorWhite = Colors.white70;
  static const Color textSubLow = Colors.black54;
}

class DatePickerTheme {
  static ThemeData datePickerTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
    ),
    dialogBackgroundColor: Colors.white,
  );
}
