import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxdemoapp/redux/actions/actions.dart';
import 'package:reduxdemoapp/redux/selectors/selectors.dart';
import 'package:reduxdemoapp/state/appstate.dart';

class Home extends StatelessWidget {
  Home({
    Key key,
  }) : super(key: key);

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    debugPrint('[BUILD] HomeScreen');

    var result = StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Redux Demo"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: [
                        Text("Font Size"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                              value: vm.fontSize,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Small"),
                                  value: 10.0,
                                ),
                                DropdownMenuItem(
                                  child: Text("Medium"),
                                  value: 20.0,
                                ),
                                DropdownMenuItem(
                                    child: Text("Large"), value: 30.0),
                                DropdownMenuItem(
                                    child: Text("Extra Large"), value: 40.0)
                              ],
                              onChanged: (value) {
                                StoreProvider.of<AppState>(context)
                                    .dispatch(SetFontSizeAction(value));
                              }),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Bold"),
                        Checkbox(
                            value: vm.isBold,
                            onChanged: (value) {
                              StoreProvider.of<AppState>(context)
                                  .dispatch(ToggleBoldAction(value));
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Italics"),
                        Checkbox(
                            value: vm.isItalic,
                            onChanged: (value) {
                              StoreProvider.of<AppState>(context)
                                  .dispatch(ToggleItalicsAction(value));
                            }),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        child: Text(
                          'Welcome to the Home Screen, We are using redux for state management',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: vm.fontSize,
                              fontWeight: vm.isBold
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontStyle: vm.isItalic
                                  ? FontStyle.italic
                                  : FontStyle.normal),
                        ),
                      ),
                    ),
                    FlatButton.icon(
                        onPressed: () {
                          StoreProvider.of<AppState>(context)
                              .dispatch(FetchAPIDataAction());

                          Navigator.pushNamed(context, '/users');
                        },
                        color: Colors.lightBlue,
                        icon: Icon(Icons.get_app),
                        label: Text("Load Users"),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(15))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        child: Text(
                          'Calls Random User Generator API = https://randomuser.me/ and loads a list of 10 users',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        });

    return result;
  }
}

class _ViewModel {
  final bool isBold;
  final bool isItalic;
  final double fontSize;

  _ViewModel({
    @required this.isBold,
    @required this.isItalic,
    @required this.fontSize,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isBold: boldSelector(store.state),
      isItalic: italicSelector(store.state),
      fontSize: fontSizeSelector(store.state),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          isBold == other.isBold &&
          isItalic == other.isItalic &&
          fontSize == other.fontSize;

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      isBold.hashCode ^
      isItalic.hashCode ^
      fontSize.hashCode;
}
