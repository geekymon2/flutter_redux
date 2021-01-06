import 'package:reduxdemoapp/model/usermodel.dart';

class ToggleBoldAction {
  final bool isBold;
  ToggleBoldAction(this.isBold);
}

class ToggleItalicsAction {
  final bool isItalic;
  ToggleItalicsAction(this.isItalic);
}

class SetFontSizeAction {
  final double fontSize;
  SetFontSizeAction(this.fontSize);
}

class FetchAPIDataAction {}

class APIDataLoadedAction {
  final List<User> userList;
  APIDataLoadedAction(this.userList);
}
