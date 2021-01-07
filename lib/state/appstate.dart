import 'package:flutter/material.dart';
import 'package:reduxdemoapp/model/usermodel.dart';

class AppState {
  AppState({this.bold, this.italic, this.fontSize, this.userList});

  final bool bold;
  final bool italic;
  final double fontSize;
  final List<User> userList;

  factory AppState.initial() => AppState(
      bold: false, italic: false, fontSize: 10.0, userList: List<User>());

  AppState copyWith({bool bold, bool italic, double fontSize}) {
    return AppState(
        bold: bold ?? this.bold,
        italic: italic ?? this.italic,
        fontSize: fontSize ?? this.fontSize,
        userList: userList ?? this.userList);
  }

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    final AppState typedOther = other;
    return bold == typedOther.bold &&
        italic == typedOther.italic &&
        fontSize == typedOther.fontSize &&
        userList == typedOther.userList;
  }

  @override
  int get hashCode => hashValues(bold, italic, fontSize, userList);

  @override
  String toString() {
    return 'AppState{bold: $bold, italic: $italic, size: $fontSize, users: ${userList.length}}';
  }
}
