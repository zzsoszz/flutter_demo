import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginDemo2 {

  static const MethodChannel _channel = const MethodChannel('flutter_plugin_demo2');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get getMessage async {
    final String version = await _channel.invokeMethod('getMessage');
    return version;
  }

}
