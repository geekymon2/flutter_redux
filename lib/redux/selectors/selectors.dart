//AppState Persistent Options
import 'package:reduxdemoapp/model/usermodel.dart';
import 'package:reduxdemoapp/state/appstate.dart';

bool boldSelector(AppState state) => (state != null) ? state.bold : false;
bool italicSelector(AppState state) => (state != null) ? state.italic : false;
double fontSizeSelector(AppState state) =>
    (state != null) ? state.fontSize : 10.0;
List<User> userListSelector(AppState state) =>
    (state != null) ? state.userList : List<User>();
