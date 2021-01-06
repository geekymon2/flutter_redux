import 'package:redux/redux.dart';
import 'package:reduxdemoapp/redux/actions/actions.dart';

final boldReducer = combineReducers<bool>([
  TypedReducer<bool, ToggleBoldAction>(_activeBoldReducer),
]);

bool _activeBoldReducer(bool bold, ToggleBoldAction action) {
  return action.isBold;
}
