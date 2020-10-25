import 'package:redux/redux.dart';
import 'package:reduxdemoapp/redux/actions/actions.dart';
import 'package:reduxdemoapp/state/appstate.dart';

void storeOptionsMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  AppState state = store.state;

  if (action is ToggleBoldAction) {
    state = state.copyWith(bold: action.isBold);
  }

  next(action);
}
