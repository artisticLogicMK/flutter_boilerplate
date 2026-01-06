import 'package:flutter/material.dart';
import 'neutral_palette.dart';
import 'app_colors.dart';
import 'app_color_scheme.dart';

const lightNeutralPalette = NeutralPalette(
  neutral50: AppColors.neutral50,
  neutral100: AppColors.neutral100,
  neutral150: AppColors.neutral150,
  neutral200: AppColors.neutral200,
  neutral250: AppColors.neutral250,
  neutral300: AppColors.neutral300,
  neutral350: AppColors.neutral350,
  neutral400: AppColors.neutral400,
  neutral450: AppColors.neutral450,
  neutral500: AppColors.neutral500,
  neutral550: AppColors.neutral550,
  neutral600: AppColors.neutral600,
  neutral650: AppColors.neutral650,
  neutral700: AppColors.neutral700,
  neutral750: AppColors.neutral750,
  neutral800: AppColors.neutral800,
  neutral850: AppColors.neutral850,
  neutral900: AppColors.neutral900,
  neutral950: AppColors.neutral950,
  neutral1000: AppColors.neutral1000,
);

const darkNeutralPalette = NeutralPalette(
  neutral50: AppColors.darkNeutral50,
  neutral100: AppColors.darkNeutral100,
  neutral150: AppColors.darkNeutral150,
  neutral200: AppColors.darkNeutral200,
  neutral250: AppColors.darkNeutral250,
  neutral300: AppColors.darkNeutral300,
  neutral350: AppColors.darkNeutral350,
  neutral400: AppColors.darkNeutral400,
  neutral450: AppColors.darkNeutral450,
  neutral500: AppColors.darkNeutral500,
  neutral550: AppColors.darkNeutral550,
  neutral600: AppColors.darkNeutral600,
  neutral650: AppColors.darkNeutral650,
  neutral700: AppColors.darkNeutral700,
  neutral750: AppColors.darkNeutral750,
  neutral800: AppColors.darkNeutral800,
  neutral850: AppColors.darkNeutral850,
  neutral900: AppColors.darkNeutral900,
  neutral950: AppColors.darkNeutral950,
  neutral1000: AppColors.darkNeutral1000,
);


ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: const [
    lightNeutralPalette,
  ],
  colorScheme: lightColorScheme,
  fontFamily: 'Poppins',
  // other theme config...
);


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  extensions: const [
    darkNeutralPalette,
  ],
  colorScheme: darkColorScheme,
  fontFamily: 'Poppins',
  // other theme config...
);
