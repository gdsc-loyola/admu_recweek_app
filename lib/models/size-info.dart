import 'package:admu_recweek_app/enums/device-screen-type.dart';
import 'package:flutter/material.dart';

class SizeInformation {
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size widgetSize;

  SizeInformation({
    this.orientation,
    this.deviceScreenType,
    this.screenSize,
    this.widgetSize,
  });

  @override
  String toString() {
    return 'Orientation: $orientation DeviceScreenType: $deviceScreenType Size: $screenSize Size: $widgetSize';
  }
}
