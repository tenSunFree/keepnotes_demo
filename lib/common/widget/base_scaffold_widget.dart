import 'package:flutter/material.dart';
import 'package:keepnotes_demo/common/widget/double_back_close_widget.dart';

abstract class BaseScaffoldWidget extends StatefulWidget {
  const BaseScaffoldWidget({
    final Key? key,
  }) : super(key: key);

  BackPress? backPress();

  Widget? body(final BuildContext context);

  PreferredSizeWidget? appBar(final BuildContext context);

  Widget? floatingActionButton(final BuildContext context);

  FloatingActionButtonLocation? floatingActionButtonLocation();

  @override
  _BaseScaffoldWidgetState createState() => _BaseScaffoldWidgetState();
}

class _BaseScaffoldWidgetState extends State<BaseScaffoldWidget> {
  @override
  Widget build(final BuildContext context) {
    return DoubleBackCloseWidget(
      backPress: widget.backPress(),
      child: Scaffold(
        appBar: widget.appBar(context),
        body: widget.body(context),
        floatingActionButton: widget.floatingActionButton(context),
        floatingActionButtonLocation: widget.floatingActionButtonLocation(),
      ),
    );
  }
}
