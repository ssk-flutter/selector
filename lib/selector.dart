
import 'dart:async';

import 'package:flutter/services.dart';

class Selector {
  static const MethodChannel _channel =
      const MethodChannel('selector');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
