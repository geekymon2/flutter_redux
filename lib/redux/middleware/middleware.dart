import 'package:redux/redux.dart';
import 'package:redux_api_middleware/redux_api_middleware.dart';
import 'package:reduxdemoapp/redux/actions/actions.dart';
import 'package:reduxdemoapp/state/appstate.dart';

void storeOptionsMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  if (action is FetchAPIDataAction) {
    var fetchDataAction = {
      RSAA: {
        'method': 'GET',
        'endpoint': 'http://url.com/api/test',
        'types': [
          'request',
          'success',
          'failure',
        ],
      },
    };

    store.dispatch(fetchDataAction);
  }

  next(action);
}
