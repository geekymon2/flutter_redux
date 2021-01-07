import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxdemoapp/model/usermodel.dart';
import 'package:reduxdemoapp/redux/selectors/selectors.dart';
import 'package:reduxdemoapp/state/appstate.dart';

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        Widget body;

        body = ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: vm.userList.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, i) {
            User user = vm.userList[i];

            return ListTile(
              leading: new CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(user.thumbnail),
                backgroundColor: Colors.transparent,
              ),
              subtitle: Text(user.location),
              title: Text(
                user.name + " (" + user.email + ")",
              ),
              onTap: () {},
            );
          },
        );

        return Scaffold(
          appBar: AppBar(
            title: Text('Users list'),
          ),
          body: body,
        );
      },
    );
  }
}

class _ViewModel {
  final List<User> userList;

  _ViewModel({@required this.userList});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      userList: userListSelector(store.state),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          userList == other.userList;

  @override
  int get hashCode => runtimeType.hashCode ^ userList.hashCode;
}
