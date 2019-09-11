import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_plugin_demo4/flutter_plugin_demo4.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_plugin_demo4');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterPluginDemo4.platformVersion, '42');
  });
}
