import 'package:flutter/material.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';
import 'package:keepnotes_demo/common/theme/export_theme.dart';

ThemeData blackTheme(final Color primary, final Color secondary) {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    canvasColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: secondary,
    ),
    iconTheme: const IconThemeData().copyWith(color: Colors.white),
    colorScheme: ColorScheme.dark(primary: primary, secondary: secondary),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: secondary,
      actionTextColor: greyColor,
      contentTextStyle: TextStyle(color: greyColor),
      behavior: SnackBarBehavior.fixed,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.black,
    ),
    cardColor: Colors.black,
    dialogBackgroundColor: Colors.black,
    dividerColor: Colors.black,
    dialogTheme: DialogTheme(
      backgroundColor: Colors.black,
      titleTextStyle: const TextStyle().copyWith(color: Colors.white),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: lighten(secondary, 30),
      cursorColor: lighten(secondary, 20),
      selectionHandleColor: lighten(secondary),
    ),
  );
}
