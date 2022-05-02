import 'package:flutter/material.dart';
import 'package:keepnotes_demo/edit/view/edit_screen.dart';
import 'package:keepnotes_demo/home/home_screen.dart';

class RouteName {
  static const homeScreen = '/';
  static const editScreen = 'edit';
}

Route<dynamic> generateRoute(final RouteSettings settings) {
  switch (settings.name) {
    case RouteName.homeScreen:
      return MaterialPageRoute(
        settings: settings,
        builder: (final context) => const HomeScreen(),
      );
    case RouteName.editScreen:
      return MaterialPageRoute(
        settings: settings,
        builder: (final context) => const EditScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (final context) => const HomeScreen(),
      );
  }
}
