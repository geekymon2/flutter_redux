import 'package:flutter/material.dart';
import 'package:reduxdemoapp/app.dart';
import 'package:reduxdemoapp/redux/store/store.dart';

void main() async {
  var store = await createStore();
  runApp(ReduxDemoApp(store));
}
