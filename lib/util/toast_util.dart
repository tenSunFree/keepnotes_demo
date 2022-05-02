import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(final String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16,
  );
}
