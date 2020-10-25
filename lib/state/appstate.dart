import 'package:flutter/material.dart';

class AppState {
  AppState(
      {this.showReaderOptions,
      this.pathData,
      this.pathFilePrefix,
      this.pathTitle,
      this.statusTime,
      this.batteryPerc,
      this.pathId});

  final bool showReaderOptions;
  final String pathData;
  final String pathFilePrefix;
  final String pathTitle;
  final String statusTime;
  final int batteryPerc;
  final int pathId;

  factory AppState.initial() => AppState(
        showReaderOptions: false,
        pathData: "",
        pathFilePrefix: "",
        pathTitle: "",
        statusTime: "",
        batteryPerc: 0,
        pathId: 1, // default to Japji Sahib Ji path.
      );

  AppState copyWith({
    bool showReaderOptions,
    String pathData,
    String pathFilePrefix,
    String pathTitle,
    double scrollPerc,
    String statusTime,
    int batteryPerc,
    int pathId,
  }) {
    return AppState(
      showReaderOptions: showReaderOptions ?? this.showReaderOptions,
      pathData: pathData ?? this.pathData,
      pathFilePrefix: pathFilePrefix ?? this.pathFilePrefix,
      pathTitle: pathTitle ?? this.pathTitle,
      statusTime: statusTime ?? this.statusTime,
      batteryPerc: batteryPerc ?? this.batteryPerc,
      pathId: pathId ?? this.pathId,
    );
  }

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    final AppState typedOther = other;
    return showReaderOptions == typedOther.showReaderOptions &&
        pathData == typedOther.pathData &&
        pathFilePrefix == typedOther.pathFilePrefix &&
        pathTitle == typedOther.pathTitle &&
        statusTime == typedOther.statusTime &&
        batteryPerc == typedOther.batteryPerc &&
        pathId == typedOther.pathId;
  }

  @override
  int get hashCode => hashValues(
        showReaderOptions,
        pathData,
        pathFilePrefix,
        pathTitle,
        statusTime,
        batteryPerc,
        pathId,
      );

  @override
  String toString() {
    return 'AppState{readeropts: $showReaderOptions, filepfx: $pathFilePrefix, title: $pathTitle, time: $statusTime, battery: $batteryPerc, id: $pathId }';
  }
}
