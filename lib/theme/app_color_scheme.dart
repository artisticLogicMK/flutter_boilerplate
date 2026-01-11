import 'package:flutter/material.dart';
import 'app_colors.dart';


ColorScheme lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.neutral800,
  onPrimary: AppColors.neutral200,

  secondary: AppColors.neutral800,
  onSecondary: AppColors.neutral200,

  surface: AppColors.neutral300,
  onSurface: AppColors.neutral900,

  error: AppColors.error,
  onError: Colors.white,
);

ColorScheme darkColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.darkNeutral800,
  onPrimary: AppColors.darkNeutral200,

  secondary: AppColors.darkNeutral800,
  onSecondary: AppColors.darkNeutral200,

  surface: AppColors.darkNeutral300,
  onSurface: AppColors.darkNeutral900,

  error: AppColors.error,
  onError: Colors.black,
);
