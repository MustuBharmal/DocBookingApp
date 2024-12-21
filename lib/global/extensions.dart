import 'dart:async';

import 'package:flutter/material.dart';

extension ClickListener on Widget {
  Widget onClick(VoidCallback? clickHandler) {
    /// Log button click
    // FirebaseAnalyticsEvents.logButtonClicked(name);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // onTap: clickHandler,
      onTap: debounce(clickHandler),
      child: this,
    );
  }
}

VoidCallback debounce(Function? func, [int delay = 250]) {
  Timer? timer;
  return () {
    if (timer != null) {
      timer?.cancel();
    }
    timer = Timer(Duration(milliseconds: delay), () {
      if (func != null) {
        func();
      }
    });
  };
}
