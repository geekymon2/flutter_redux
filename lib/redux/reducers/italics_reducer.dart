import 'package:redux/redux.dart';
import 'package:reduxdemoapp/redux/actions/actions.dart';

final italicsReducer = combineReducers<bool>([
  TypedReducer<bool, ToggleItalicsAction>(_activeItalicsReducer),
]);

bool _activeItalicsReducer(bool bold, ToggleItalicsAction action) {
  return action.isItalic;
}
