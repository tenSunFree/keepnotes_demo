import 'package:flutter/material.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';
import 'package:keepnotes_demo/common/theme/export_theme.dart';

ThemeData lightTheme(final Color primary, final Color secondary) {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    appBarTheme: getAppBarTheme(primary),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData().copyWith(color: Colors.black),
    colorScheme: ColorScheme.light(
      primary: primary,
      secondary: secondary,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: secondary,
      actionTextColor: greyColor,
      contentTextStyle: TextStyle(color: greyColor),
      behavior: SnackBarBehavior.fixed,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),
    cardColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    dividerColor: Colors.white,
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle().copyWith(color: Colors.black),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: lighten(secondary, 30),
      cursorColor: lighten(secondary, 20),
      selectionHandleColor: lighten(secondary),
    ),
  );
}
