import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_demo2/flutter_plugin_demo2.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String message = '';
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }


  MethodChannel _channel;

  void onMyViewCreated(int id) {
    _channel = new MethodChannel('plugins.nightfarmer.top/myview_$id');
  }


  Future<void> setMyViewText(String text) async {
    assert(text != null);
    return _channel.invokeMethod('setText', text);
  }


  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterPluginDemo2.platformVersion;
      message = await FlutterPluginDemo2.getMessage;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      message = message;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              child: AndroidView(
                viewType: 'plugins.verqy.com/myview',
                creationParams: {
                  "myContent": "通过参数传入的文本内容$index:$_platformVersion",
                },
                creationParamsCodec: const StandardMessageCodec(),
              ),
              height: 100,
            );
          },
          itemCount: 100,
        ),
      ),
    );


//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('Plugin example app'),
//        ),
//        body: Center(
//          child: Text('Running on: $_platformVersion  消息:”$message  \n  '),
//        ),
//      ),
//    );
  }
}
