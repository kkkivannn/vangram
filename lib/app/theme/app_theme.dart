import 'package:flutter/material.dart';
import 'package:vangram/app/theme/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get theme => _theme;

  static final ThemeData _theme = ThemeData(
    scaffoldBackgroundColor: AppColors.kWhiteColor,
    useMaterial3: false,
  );
}
