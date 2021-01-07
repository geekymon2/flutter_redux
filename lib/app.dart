import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxdemoapp/approute.dart';
import 'package:reduxdemoapp/home.dart';
import 'package:reduxdemoapp/state/appstate.dart';
import 'package:reduxdemoapp/users.dart';

class ReduxDemoApp extends StatelessWidget {
  final Store<AppState> store;
  ReduxDemoApp(this.store);

  @override
  Widget build(BuildContext context) {
    var result = StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, _ViewModel>(
            converter: _ViewModel.fromStore,
            builder: (context, vm) => MaterialApp(
                title: "Redux Demo App",
                routes: _buildRoutes(store),
                home: Home())));
    return result;
  }
}

Map<String, WidgetBuilder> _buildRoutes(Store store) {
  return Map<String, WidgetBuilder>.fromIterable(
    _getRoutes(store),
    key: (dynamic route) => '${route.routeName}',
    value: (dynamic route) => route.buildRoute,
  );
}

List<AppRoute> _getRoutes(Store store) {
  final List<AppRoute> routes = <AppRoute>[
    AppRoute(
      routeName: '/home',
      buildRoute: (BuildContext context) => Home(),
    ),
    AppRoute(
      routeName: '/users',
      buildRoute: (BuildContext context) => Users(),
    ),
  ];
  return routes;
}

class _ViewModel {
  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel();
  }
}
