import 'package:flutter/material.dart';

class EditTitleNotifier extends ChangeNotifier {
  EditTitleNotifier(this.title);

  String title;

  void setTitle(final String title) {
    this.title = title;
    notifyListeners();
  }
}
