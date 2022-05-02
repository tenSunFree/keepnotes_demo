import 'package:flutter/material.dart';
import 'package:keepnotes_demo/common/widget/base_scaffold_widget.dart';
import 'package:keepnotes_demo/common/widget/double_back_close_widget.dart';
import 'package:keepnotes_demo/home/widget/home_export_widget.dart';

class HomeScreen extends BaseScaffoldWidget {
  const HomeScreen({final Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(final BuildContext context) => null;

  @override
  Widget body(final BuildContext context) => const HomeBodyWidget();

  @override
  Widget? floatingActionButton(final BuildContext context) {
    return const HomeFloatingActionButtonWidget(onFabTap: onFabTap);
  }

  @override
  FloatingActionButtonLocation? floatingActionButtonLocation() {
    return FloatingActionButtonLocation.centerFloat;
  }

  @override
  BackPress? backPress() => null;
}
