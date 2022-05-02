import 'dart:async';
import 'package:flutter/material.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';
import 'package:keepnotes_demo/util/toast_util.dart';

typedef BackPress = Future<bool> Function();

class DoubleBackCloseWidget extends StatefulWidget {
  const DoubleBackCloseWidget({
    required this.child,
    final Key? key,
    final this.backPress,
  }) : super(key: key);

  final Widget child;
  final BackPress? backPress;

  @override
  _DoubleBackCloseWidgetState createState() => _DoubleBackCloseWidgetState();
}

class _DoubleBackCloseWidgetState extends State<DoubleBackCloseWidget> {
  int _lastTimeBackButtonWasTapped = 0;

  @override
  Widget build(final BuildContext context) {
    final _isAndroid = Theme.of(context).platform == TargetPlatform.android;
    if (_isAndroid) {
      return WillPopScope(
        onWillPop: widget.backPress ?? doubleBackPress,
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }

  Future<bool> doubleBackPress() async {
    if (!mounted) {
      return true;
    }
    final _currentTime = DateTime.now().millisecondsSinceEpoch;
    if ((_currentTime - _lastTimeBackButtonWasTapped) < exitTimeInMillis) {
      return Future.value(true);
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
      toast('再點一下返回離開');
      return Future.value(false);
    }
  }
}
