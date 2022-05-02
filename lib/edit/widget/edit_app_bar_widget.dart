import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';
import 'package:keepnotes_demo/edit/viewModel/edit_title_notifier.dart';
import 'package:provider/provider.dart';

class EditAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const EditAppBarWidget({
    required this.note,
    required this.saveNote,
    required this.node,
    final Key? key,
  }) : super(key: key);
  final Note note;
  final Future<bool> Function() saveNote;
  final FocusNode node;

  @override
  Widget build(final BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: const Color(0xFF272727),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            if (node.hasFocus) {
              node.unfocus();
              unawaited(saveNote());
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
        title: Consumer<EditTitleNotifier>(
          builder: (final _, final charCount, final __) {
            return Text(
              charCount.title,
            );
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(47);
}
