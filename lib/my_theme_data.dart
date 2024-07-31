import 'package:flutter/material.dart';
import 'package:untitled40/appcolor.dart';

class MyThemeData {
  static ThemeData get lihgtMode => ThemeData(
        canvasColor: AppColors.primaryLightColor,
        primaryColor: AppColors.primaryLightColor,
        scaffoldBackgroundColor: Colors.transparent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          //backgroundColor: AppColors.primaryLightColor
          selectedItemColor: AppColors.blackColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: AppColors.blackColor,
          ),
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: AppColors.blackColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: AppColors.blackColor,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: TextStyle(
            color: AppColors.blackColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  static ThemeData get darkMode => ThemeData(
        canvasColor: AppColors.primaryDarkColor,
        primaryColor: AppColors.primaryDarkColor,
        scaffoldBackgroundColor: Colors.transparent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          //backgroundColor: AppColors.primaryLightColor
          selectedItemColor: AppColors.yellowColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: AppColors.whiteColor,
          ),
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
