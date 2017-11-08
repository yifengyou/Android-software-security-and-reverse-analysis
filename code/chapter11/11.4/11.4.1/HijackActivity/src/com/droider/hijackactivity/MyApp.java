package com.droider.hijackactivity;

import java.util.ArrayList;
import java.util.List;

import android.app.Application;

public class MyApp extends Application{
	List<String> hijackingList;

	@Override
	public void onCreate() {
		hijackingList = new ArrayList<String>();
		hijackingList.add("com.android.music");
		hijackingList.add("com.android.browser");	//要劫持的进程
		super.onCreate();
	}	
	
}
