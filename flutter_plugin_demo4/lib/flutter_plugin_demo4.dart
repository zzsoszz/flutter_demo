import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginDemo4 {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_demo4');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
