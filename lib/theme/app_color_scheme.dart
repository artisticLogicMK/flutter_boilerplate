import 'package:flutter/material.dart';
import 'app_colors.dart';


ColorScheme lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.neutral900,
  onPrimary: AppColors.neutral200,

  secondary: AppColors.neutral900,
  onSecondary: AppColors.neutral200,

  surface: AppColors.neutral100,
  onSurface: AppColors.neutral900,

  error: AppColors.error,
  onError: Colors.white,
);

ColorScheme darkColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.neutral200,
  onPrimary: AppColors.neutral900,

  secondary: AppColors.neutral200,
  onSecondary: AppColors.neutral900,

  surface: AppColors.darkNeutral100,
  onSurface: AppColors.darkNeutral900,

  error: AppColors.error,
  onError: Colors.black,
);
