import 'package:flutter/material.dart';
import 'neutral_palette.dart';

extension ThemeX on BuildContext {
  NeutralPalette get nt =>
      Theme.of(this).extension<NeutralPalette>()!;
}
