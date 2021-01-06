import 'package:flutter/material.dart';
import 'package:reduxdemoapp/redux/reducers/bold_reducer.dart';
import 'package:reduxdemoapp/redux/reducers/italics_reducer.dart';
import 'package:reduxdemoapp/state/appstate.dart';
import 'package:reduxdemoapp/redux/reducers/fontsize_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  AppState newState;

  debugPrint("[ACTION] ${action.runtimeType}");
  newState = AppState(
    bold: boldReducer(state.bold, action),
    italic: italicsReducer(state.italic, action),
    fontSize: fontSizeReducer(state.fontSize, action),
  );

  return newState;
}
