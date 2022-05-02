import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepnotes_demo/edit/viewModel/edit_title_notifier.dart';
import 'package:provider/provider.dart';

class EditBody extends StatefulWidget {
  const EditBody({
    required this.autofocus,
    required this.contentController,
    required this.node,
    final Key? key,
  }) : super(key: key);

  final bool autofocus;
  final TextEditingController contentController;
  final FocusNode node;

  @override
  State<EditBody> createState() => _EditBodyState();
}

class _EditBodyState extends State<EditBody> {
  String backgroundText =
      '                                                                        '
      '                           \n';
  final TextEditingController _backgroundController = TextEditingController();

  @override
  void initState() {
    super.initState();
    createBackgroundText().then(
      (final value) => {
        _backgroundController.text = value,
      },
    );
  }

  Future<String> createBackgroundText() {
    final buffer = StringBuffer();
    for (var i = 0; i < 1000; i++) {
      buffer.write(backgroundText);
    }
    return Future.value(buffer.toString());
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            bottom: kBottomNavigationBarHeight,
            left: 10,
            right: 10,
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Stack(
              children: <Widget>[
                buildBackgroundTextField(),
                buildContentTextField(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextField buildContentTextField(final BuildContext context) {
    return TextField(
      onChanged: (final str) {
        var title = widget.contentController.text.trim();
        if (title.contains('\n')) {
          title = title.substring(0, title.indexOf('\n'));
        }
        if (title.length > 10) {
          title = '${title.substring(0, 10)}...';
        }
        Provider.of<EditTitleNotifier>(context, listen: false).setTitle(title);
      },
      autofocus: widget.autofocus,
      controller: widget.contentController,
      focusNode: widget.node,
      maxLines: null,
      showCursor: true,
      style: GoogleFonts.openSans(
        textStyle: const TextStyle(
          height: 1.7,
          fontSize: 18,
          color: Colors.white,
          decorationThickness: 1.2,
        ),
      ),
      decoration: const InputDecoration(
        hintText: '編輯中...',
        border: InputBorder.none,
      ),
    );
  }

  TextField buildBackgroundTextField() {
    return TextField(
      controller: _backgroundController,
      readOnly: true,
      maxLines: null,
      style: GoogleFonts.openSans(
        textStyle: const TextStyle(
          height: 1.7,
          fontSize: 18,
          color: Colors.white,
          decoration: TextDecoration.underline,
          decorationColor: Color(0x60808080),
        ),
      ),
    );
  }
}
