package com.droider.stealbroadcastreceiver;

import android.app.Service;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.IBinder;

public class StealService extends Service{
	private DataReceiver dReceiver;
	
	@Override
	public IBinder onBind(Intent intent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void onCreate() {
		dReceiver = new DataReceiver();
		super.onCreate();
	}

	@Override
	public void onDestroy() {
		unregisterReceiver(dReceiver);			//取消注册广播接收者
		super.onDestroy();
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		IntentFilter filter = new IntentFilter();		//创建IntentFilter对象
        filter.addAction("com.droider.workbroadcast");
        filter.setPriority(1000);						//最高优先级
        registerReceiver(dReceiver, filter);			//注册广播接收者
        
		return super.onStartCommand(intent, flags, startId);
	}
	
	

}
