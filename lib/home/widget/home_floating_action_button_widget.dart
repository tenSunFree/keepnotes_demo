import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';
import 'package:keepnotes_demo/common/route/route.dart';
import 'package:uuid/uuid.dart';

class HomeFloatingActionButtonWidget extends StatelessWidget {
  const HomeFloatingActionButtonWidget({
    required OnFabTap this.onFabTap,
    this.icon,
    final Key? key,
  }) : super(key: key);

  final Function(BuildContext context) onFabTap;
  final Icon? icon;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.vibrate();
          Scaffold.of(context).openDrawer();
        },
        child: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            onPressed: () => onFabTap(context),
            child: icon ?? addIcon,
          ),
        ),
      ),
    );
  }
}

Future<void> onFabTap(final BuildContext context) async {
  final emptyNote = Note(
    id: const Uuid().v4(),
    lastModify: DateTime.now(),
  );
  await Navigator.pushNamed(
    context,
    RouteName.editScreen,
    arguments: emptyNote,
  );
}
