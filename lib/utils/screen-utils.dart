import 'package:admu_recweek_app/enums/device-screen-type.dart';
import 'package:flutter/widgets.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQueryData) {
  var orientation = mediaQueryData.orientation;
  double deviceSize = 0;

  switch (orientation) {
    case Orientation.landscape:
      deviceSize = mediaQueryData.size.height;
      break;
    default:
      deviceSize = mediaQueryData.size.width;
      break;
  }

  if (deviceSize > 600) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}
