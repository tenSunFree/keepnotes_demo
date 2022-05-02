import 'package:flutter/material.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';
import 'package:keepnotes_demo/common/route/route.dart';
import 'package:keepnotes_demo/common/theme/export_theme.dart';
import 'package:provider/provider.dart';

final RouteObserver<Route> routeObserver = RouteObserver<Route>();

class App extends StatefulWidget {
  const App({
    final Key? key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteNotifier>(
          create: (final context) => NoteNotifier(),
        ),
      ],
      child: Builder(
        builder: (final context) {
          const initRoute = RouteName.homeScreen;
          return MaterialApp(
            restorationScopeId: 'keepnotes_demo',
            theme: getThemeData(),
            title: 'keepnotes_demo',
            initialRoute: initRoute,
            navigatorObservers: [routeObserver],
            onGenerateRoute: generateRoute,
          );
        },
      ),
    );
  }
}
