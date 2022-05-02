import 'package:flutter/material.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';
import 'package:keepnotes_demo/common/route/route.dart';
import 'package:keepnotes_demo/home/widget/home_list_item_widget.dart';

class HomeListWidget extends StatefulWidget {
  const HomeListWidget({
    required this.notifier,
    final Key? key,
  }) : super(key: key);

  final NoteNotifier notifier;

  @override
  _HomeListWidgetState createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends State<HomeListWidget> {
  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.notifier.mainNotes.length,
        shrinkWrap: true,
        itemBuilder: (final context, final index) {
          final item = widget.notifier.mainNotes.elementAt(index);
          return HomeListItemWidget(
            item: item,
            onTap: () => _onTap(item, index),
          );
        },
      ),
    );
  }

  Future<void> _onTap(final Note item, final int index) async {
    await Navigator.pushNamed(
      context,
      RouteName.editScreen,
      arguments: item,
    );
  }
}
