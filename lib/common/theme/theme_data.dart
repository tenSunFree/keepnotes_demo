import 'package:flutter/material.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';
import 'package:keepnotes_demo/common/theme/export_theme.dart';

Color darken(final Color c, [final int percent = 10]) {
  final f = 1 - percent / 100;
  return Color.fromARGB(
    c.alpha,
    (c.red * f).round(),
    (c.green * f).round(),
    (c.blue * f).round(),
  );
}

Color lighten(final Color c, [final int percent = 10]) {
  final p = percent / 100;
  return Color.fromARGB(
    c.alpha,
    c.red + ((255 - c.red) * p).round(),
    c.green + ((255 - c.green) * p).round(),
    c.blue + ((255 - c.blue) * p).round(),
  );
}

ThemeData getThemeData() {
  final primary = Color(defaultPrimary.value);
  final accent = Color(defaultAccent.value);
  final appTheme = AppTheme.values[AppTheme.black.index];
  switch (appTheme) {
    case AppTheme.dark:
    case AppTheme.black:
      return blackTheme(primary, accent);
    case AppTheme.light:
      return lightTheme(primary, accent);
  }
}
