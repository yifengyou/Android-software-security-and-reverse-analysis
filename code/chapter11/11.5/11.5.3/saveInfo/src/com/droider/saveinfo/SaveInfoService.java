package com.droider.saveinfo;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

public class SaveInfoService extends Service {	 
	private static final String TAG = "com.droider.saveinfo";
	@Override
	public void onCreate() {
		// TODO Auto-generated method stub
		super.onCreate();
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		if (intent.getAction().equals("com.droider.saveinfo")) {
			String username = intent.getExtras().getString("username");
			String password = intent.getExtras().getString("password");
			Log.d(TAG, "SaveInfoService:" + username + " -> " + password);			
		}	
		return super.onStartCommand(intent, flags, startId);
	}

	@Override
	public IBinder onBind(Intent intent) {
		// TODO Auto-generated method stub
		return null;
	}

}