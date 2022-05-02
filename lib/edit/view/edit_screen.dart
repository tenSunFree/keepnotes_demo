import 'package:flutter/material.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';
import 'package:keepnotes_demo/edit/viewModel/edit_title_notifier.dart';
import 'package:keepnotes_demo/edit/widget/edit_app_bar_widget.dart';
import 'package:keepnotes_demo/edit/widget/edit_body_widget.dart';
import 'package:keepnotes_demo/util/toast_util.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({
    final Key? key,
  }) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late Note _currentNote;
  late Note _editingNote;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _node = FocusNode();
  late String _currentTitle;
  late String _currentContent;

  @override
  Widget build(final BuildContext context) {
    _currentNote = ModalRoute.of(context)!.settings.arguments! as Note;
    _editingNote = _currentNote;
    _controller.text = _editingNote.content;
    _currentTitle = _currentNote.title;
    _currentContent = _currentNote.content;
    return ChangeNotifierProvider<EditTitleNotifier>(
      create: (final _) => EditTitleNotifier(_currentTitle),
      child: WillPopScope(
        onWillPop: onBackPress,
        child: Scaffold(
          appBar: EditAppBarWidget(
            note: _editingNote,
            saveNote: _saveNote,
            node: _node,
          ),
          body: EditBody(
            contentController: _controller,
            node: _node,
            autofocus: _currentTitle.isEmpty && _currentContent.isEmpty,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _node.dispose();
  }

  Future<bool> onBackPress() async {
    if (_node.hasFocus) {
      _node.unfocus();
      await _saveNote();
      return false;
    }
    return true;
  }

  Future<bool> _saveNote() async {
    final isEdited = _updateNote();
    if (isEdited) {
      await Provider.of<NoteNotifier>(context, listen: false)
          .insert(_editingNote);
      toast('saved');
    }
    return true;
  }

  bool _updateNote() {
    var title = _controller.text.trim();
    if (title.contains('\n')) {
      title = title.substring(0, title.indexOf('\n'));
    }
    if (title.length > 10) {
      title = '${title.substring(0, 10)}...';
    }
    _editingNote
      ..title = title
      ..content = _controller.text.trim();
    if (!(_editingNote.content == _currentContent)) {
      _editingNote.lastModify = DateTime.now();
      return true;
    }
    return false;
  }
}
