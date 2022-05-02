import 'package:intl/intl.dart';

class Note implements Comparable<Note> {
  Note({
    required this.lastModify,
    required this.id,
    this.title = '',
    this.content = '',
  });

  String id;
  String title;
  String content;
  DateTime lastModify;

  Note copyWith({
    required final String id,
    final String? title,
    final String? content,
    final DateTime? lastModify,
  }) =>
      Note(
        id: id,
        title: title ?? this.title,
        lastModify: lastModify ?? this.lastModify,
        content: content ?? this.content,
      );

  @override
  String toString() => 'Object is $id $title $content $lastModify';

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'lastModify': lastModify.millisecondsSinceEpoch,
    };
    return data;
  }

  String get strLastModifiedDate =>
      DateFormat.yMd().add_jm().format(lastModify);

  @override
  int compareTo(final Note other) {
    return other.lastModify.compareTo(lastModify);
  }
}
