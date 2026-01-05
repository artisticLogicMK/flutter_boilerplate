import 'package:flutter/material.dart';

@immutable
class NeutralPalette extends ThemeExtension<NeutralPalette> {
  final Color neutral50;
  final Color neutral100;
  final Color neutral150;
  final Color neutral200;
  final Color neutral250;
  final Color neutral300;
  final Color neutral350;
  final Color neutral400;
  final Color neutral450;
  final Color neutral500;
  final Color neutral550;
  final Color neutral600;
  final Color neutral650;
  final Color neutral700;
  final Color neutral750;
  final Color neutral800;
  final Color neutral850;
  final Color neutral900;
  final Color neutral950;
  final Color neutral1000;

  const NeutralPalette({
    required this.neutral50,
    required this.neutral100,
    required this.neutral150,
    required this.neutral200,
    required this.neutral250,
    required this.neutral300,
    required this.neutral350,
    required this.neutral400,
    required this.neutral450,
    required this.neutral500,
    required this.neutral550,
    required this.neutral600,
    required this.neutral650,
    required this.neutral700,
    required this.neutral750,
    required this.neutral800,
    required this.neutral850,
    required this.neutral900,
    required this.neutral950,
    required this.neutral1000,
  });

  @override
  NeutralPalette copyWith({
    Color? neutral50,
    Color? neutral100,
    Color? neutral150,
    Color? neutral200,
    Color? neutral250,
    Color? neutral300,
    Color? neutral350,
    Color? neutral400,
    Color? neutral450,
    Color? neutral500,
    Color? neutral550,
    Color? neutral600,
    Color? neutral650,
    Color? neutral700,
    Color? neutral750,
    Color? neutral800,
    Color? neutral850,
    Color? neutral900,
    Color? neutral950,
    Color? neutral1000,
  }) {
    return NeutralPalette(
      neutral50: neutral50 ?? this.neutral50,
      neutral100: neutral100 ?? this.neutral100,
      neutral150: neutral150 ?? this.neutral150,
      neutral200: neutral200 ?? this.neutral200,
      neutral250: neutral250 ?? this.neutral250,
      neutral300: neutral300 ?? this.neutral300,
      neutral350: neutral350 ?? this.neutral350,
      neutral400: neutral400 ?? this.neutral400,
      neutral450: neutral450 ?? this.neutral450,
      neutral500: neutral500 ?? this.neutral500,
      neutral550: neutral550 ?? this.neutral550,
      neutral600: neutral600 ?? this.neutral600,
      neutral650: neutral650 ?? this.neutral650,
      neutral700: neutral700 ?? this.neutral700,
      neutral750: neutral750 ?? this.neutral750,
      neutral800: neutral800 ?? this.neutral800,
      neutral850: neutral850 ?? this.neutral850,
      neutral900: neutral900 ?? this.neutral900,
      neutral950: neutral950 ?? this.neutral950,
      neutral1000: neutral1000 ?? this.neutral1000,
    );
  }

  @override
  NeutralPalette lerp(ThemeExtension<NeutralPalette>? other, double t) {
    if (other is! NeutralPalette) return this;
    return this; // simple for now
  }
}
