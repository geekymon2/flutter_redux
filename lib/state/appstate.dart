import 'package:flutter/material.dart';

class AppState {
  AppState({this.bold, this.italic, this.fontSize});

  final bool bold;
  final bool italic;
  final double fontSize;

  factory AppState.initial() =>
      AppState(bold: false, italic: false, fontSize: 10.0);

  AppState copyWith({bool bold, bool italic, double fontSize}) {
    return AppState(
        bold: bold ?? this.bold,
        italic: italic ?? this.italic,
        fontSize: fontSize ?? this.fontSize);
  }

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    final AppState typedOther = other;
    return bold == typedOther.bold &&
        italic == typedOther.italic &&
        fontSize == typedOther.fontSize;
  }

  @override
  int get hashCode => hashValues(
        bold,
        italic,
        fontSize
      );

  @override
  String toString() {
    return 'AppState{bold: $bold, italic: $italic, size: $fontSize}';
  }
}
