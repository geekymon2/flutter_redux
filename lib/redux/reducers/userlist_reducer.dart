import 'package:redux/redux.dart';
import 'package:reduxdemoapp/model/usermodel.dart';
import 'package:reduxdemoapp/redux/actions/actions.dart';

final userListReducer = combineReducers<List<User>>([
  TypedReducer<List<User>, APIDataLoadedAction>(_activeUserListReducer),
]);

List<User> _activeUserListReducer(
    List<User> userList, APIDataLoadedAction action) {
  return action.userList;
}
