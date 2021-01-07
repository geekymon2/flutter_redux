import 'package:redux/redux.dart';
import 'package:reduxdemoapp/model/usermodel.dart';
import 'package:reduxdemoapp/redux/actions/actions.dart';
import 'package:reduxdemoapp/state/appstate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String apiUrl = "https://randomuser.me/api/?results=10";

void storeOptionsMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  
  if (action is FetchAPIDataAction) {
    fetchUsers().then((value) {
      store.dispatch(APIDataLoadedAction(value));
    });
  }



  next(action);
}

Future<List<User>> fetchUsers() async {
  List<User> userList = List<User>();
  var result = await http.get(apiUrl);
  var userListRaw = json.decode(result.body)['results'];

  //covert JSON to strongly typed list
  for (var user in userListRaw) {
    userList.add(User(
        getName(user), getGender(user), getLocation(user), getEmail(user)));
  }

  return userList;
}

String getName(dynamic user) {
  return user['name']['title'] +
      " " +
      user['name']['first'] +
      " " +
      user['name']['last'];
}

String getLocation(dynamic user) {
  return user['location']['country'];
}

String getGender(dynamic user) {
  return user['gender'];
}

String getEmail(dynamic user) {
  return user['email'];
}
