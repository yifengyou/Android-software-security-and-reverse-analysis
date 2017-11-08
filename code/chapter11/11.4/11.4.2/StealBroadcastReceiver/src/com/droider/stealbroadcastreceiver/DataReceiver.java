package com.droider.stealbroadcastreceiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.widget.Toast;

public class DataReceiver extends BroadcastReceiver{
	@Override
    public void onReceive(Context context, Intent intent) {//重写onReceive方法
    	Log.d("com.droider.broadcastreceiver", "偷窃到广播");
        double data = intent.getDoubleExtra("data", 0);
        Toast.makeText(context, "偷窃到的数据:" + data, Toast.LENGTH_SHORT).show();
    }  
}
