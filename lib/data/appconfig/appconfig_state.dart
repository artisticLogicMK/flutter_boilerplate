import 'package:flutter/material.dart';

class AppConfigState {
  final ThemeMode themeMode;
  final Locale? locale; // null = system
  final Map<String, bool> flags;

  const AppConfigState({
    required this.themeMode,
    this.locale,
    this.flags = const {},
  });

  bool isEnabled(String flag) =>
      flags[flag] ?? false;

  AppConfigState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    Map<String, bool>? flags,
  }) {
    return AppConfigState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      flags: flags ?? this.flags,
    );
  }
}
