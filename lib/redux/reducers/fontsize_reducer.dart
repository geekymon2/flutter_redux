import 'package:redux/redux.dart';
import 'package:reduxdemoapp/redux/actions/actions.dart';

final fontSizeReducer = combineReducers<double>([
  TypedReducer<double, SetFontSizeAction>(_activeFontSizeReducer),
]);

double _activeFontSizeReducer(double size, SetFontSizeAction action) {
  return action.fontSize;
}
