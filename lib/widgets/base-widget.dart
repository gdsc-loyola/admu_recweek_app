import 'package:admu_recweek_app/models/size-info.dart';
import 'package:admu_recweek_app/utils/screen-utils.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SizeInformation sizeInformation,
  ) builder;

  const BaseWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, boxConstraints) {
        BoxConstraints _boxConstraints = boxConstraints;

        var sizeInfo = SizeInformation(
          orientation: Orientation.portrait,
          deviceScreenType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          widgetSize: Size(
            _boxConstraints.maxWidth,
            _boxConstraints.maxHeight,
          ),
        );

        return builder(context, sizeInfo);
      },
    );
  }
}
