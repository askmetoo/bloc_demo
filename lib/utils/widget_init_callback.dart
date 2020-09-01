import 'package:flutter/widgets.dart';

void onWidgetDidBuild(callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}
