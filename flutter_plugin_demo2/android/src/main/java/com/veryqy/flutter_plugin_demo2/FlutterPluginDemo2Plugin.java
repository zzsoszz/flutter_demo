package com.veryqy.flutter_plugin_demo2;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterPluginDemo2Plugin */
public class FlutterPluginDemo2Plugin implements MethodCallHandler {


  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_plugin_demo2");
    channel.setMethodCallHandler(new FlutterPluginDemo2Plugin());

    registrar.platformViewRegistry().registerViewFactory("plugins.verqy.com/myview", new MyViewFactory(registrar.messenger()));
  }


  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }else if (call.method.equals("getMessage")) {
      result.success("hello message 33333");
    }else {
      result.notImplemented();
    }
  }

}
