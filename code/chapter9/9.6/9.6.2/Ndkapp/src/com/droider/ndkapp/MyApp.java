package com.droider.ndkapp;

import android.app.Application;
import android.util.Log;

@SuppressWarnings("unused")
public class MyApp extends Application{
	public static int m = 0;	
	public native void initSN();
	public native void saveSN(String str);
	public native void work();
	
	static {
        System.loadLibrary("juan");
    }

	@Override
	public void onCreate() {
		initSN(); 	//¼ì²â×¢²áÐÅÏ¢
		//Log.d("com.droider.ndkapp m=", String.valueOf(m));
		super.onCreate();
	}
	
	
}
