package com.veryqy.flutter_plugin_demo2;

/**
 * https://www.jianshu.com/p/bba0f615d59c
 * Flutter之在Flutter布局中嵌入原生组件Android篇
 */

import android.content.Context;
import android.view.View;
import android.widget.TextView;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

public class MyView implements PlatformView, MethodChannel.MethodCallHandler {

    private final TextView myNativeView;

    MyView(Context context, BinaryMessenger messenger, int id, Map<String, Object> params) {
        TextView myNativeView = new TextView(context);
        myNativeView.setText("我是来自Android的原生TextView:"+id);
        this.myNativeView = myNativeView;
        MethodChannel methodChannel = new MethodChannel(messenger, "plugins.verqy.com/myview" + id);
        methodChannel.setMethodCallHandler(this);
    }


    @Override
    public View getView() {
        return myNativeView;
    }

    @Override
    public void dispose() {

    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else {
            result.notImplemented();
        }
    }

}
