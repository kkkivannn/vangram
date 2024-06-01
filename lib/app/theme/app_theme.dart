import 'package:flutter/material.dart';
import 'package:vangram/app/theme/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get theme => _theme;

  static final ThemeData _theme = ThemeData(
    scaffoldBackgroundColor: AppColors.kWhiteColor,
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.kWhiteColor,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.kWhiteColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.kBlackColor,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.kBlackColor,
        fontSize: 18,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.kPrimaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.kPrimaryColor),
        elevation: const WidgetStatePropertyAll(0),
        minimumSize: const WidgetStatePropertyAll(
          Size(double.infinity, 60),
        ),
      ),
    ),
  );
}
