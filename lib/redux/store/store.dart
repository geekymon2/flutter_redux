import 'package:reduxdemoapp/redux/middleware/middleware.dart';
import 'package:reduxdemoapp/redux/reducers/app_state_reducer.dart';
import 'package:reduxdemoapp/state/appstate.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: new AppState.initial(),
    middleware: [storeOptionsMiddleware],
  );
}
