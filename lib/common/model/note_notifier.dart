import 'dart:async';
import 'package:flutter/material.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';

class NoteNotifier with ChangeNotifier {
  List<Note> mainNotes = [];

  int _page = 1;
  bool isLastPage = false;
  bool isLoading = false;

  Future<void> insert(final Note note) async {
    final copiedNote = note.copyWith(id: note.id);
    mainNotes
      ..removeWhere((final element) {
        return element.id == note.id;
      })
      ..insert(0, note);
    unawaited(SqfliteDatabaseHelper.insert(copiedNote));
    notifyListeners();
  }

  Future getAllNotes() async {
    if (!isLastPage && !isLoading) {
      isLoading = true;
      final offSet = _page == 1 ? 0 : (_page - 1) * pageLimit;
      final notesList = await SqfliteDatabaseHelper.queryData(
        limit: pageLimit,
        offSet: offSet,
      );
      isLastPage = notesList.isEmpty || notesList.length < pageLimit;
      if (!isLastPage) {
        _page++;
      }
      isLoading = false;
      mainNotes = [
        ...mainNotes,
        ...List.from(
          notesList.map(
            (final itemVar) {
              final item = Note(
                id: itemVar['id'],
                title: itemVar['title'].toString(),
                content: itemVar['content'].toString(),
                lastModify: DateTime.fromMillisecondsSinceEpoch(
                  itemVar['lastModify'],
                ),
              );
              return item;
            },
          ).toList(),
        )
      ];
    }
  }
}
