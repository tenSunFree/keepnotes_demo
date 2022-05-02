import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';
import 'package:keepnotes_demo/home/widget/home_export_widget.dart';
import 'package:keepnotes_demo/home/widget/home_list_widget.dart';
import 'package:provider/provider.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({final Key? key}) : super(key: key);

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  late Future _future;

  @override
  void initState() {
    super.initState();
    _future = Provider.of<NoteNotifier>(context, listen: false).getAllNotes();
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Image.asset(homeTopBar),
        _buildContentWidget(),
        Image.asset(homeBottomBar),
      ],
    );
  }

  Widget _buildContentWidget() {
    return Expanded(
      child: FutureBuilder(
        future: _future,
        builder: (final context, final snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Consumer<NoteNotifier>(
              builder: (final context, final notifier, final _) {
                if (notifier.mainNotes.isEmpty) {
                  return const HomeEmptyWidget();
                } else {
                  return HomeListWidget(notifier: notifier);
                }
              },
            );
          } else {
            final circle = SpinKitCircle(
              color: Theme.of(context).colorScheme.secondary,
              size: MediaQuery.of(context).size.height * 0.1,
            );
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(child: circle),
            );
          }
        },
      ),
    );
  }
}
