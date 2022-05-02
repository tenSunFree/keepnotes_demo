import 'package:flutter/material.dart';

const String assetsImages = 'assets/images/';
const String homeEmpty = '${assetsImages}icon_home_empty.png';
const String homeTopBar = '${assetsImages}icon_home_top_bar.png';
const String homeBottomBar = '${assetsImages}icon_home_bottom_bar.png';
const pageLimit = 15;
const dbVersion = 1;
const exitTimeInMillis = 1500;

Icon addIcon = const Icon(
  Icons.add_outlined,
  size: 30,
);

AppBarTheme getAppBarTheme(final Color primary) {
  return AppBarTheme(
    elevation: 0,
    color: primary,
    foregroundColor: primary == Colors.white ? Colors.grey.shade900 : null,
  );
}

typedef OnTap = void Function();
typedef OnFabTap = void Function(BuildContext context);

Color defaultPrimary = Colors.deepPurple;
Color defaultAccent = Colors.deepPurpleAccent;
Color greyColor = const Color(0xFFEAEAEA);

enum AppTheme { dark, black, light }
