import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/style/app_text_style.dart';
import 'package:flutter_interview/style/colors.dart';

class AppTheme {
  final theme = ThemeData(
    primaryColor: AppColors.primaryColor,
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: AppColors.primaryColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: AppColors.primaryColor,
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor,
    ),
    colorScheme: const ColorScheme.light(
      secondary: AppColors.white,
      primary: AppColors.primaryColor,
      surface: AppColors.primaryColor,
    ),
    fontFamily: Platform.isAndroid
        ? AppTextStyle.fontFamilyAndroid
        : AppTextStyle.fontFamilyIos,
    scaffoldBackgroundColor: AppColors.white,
  );
}
