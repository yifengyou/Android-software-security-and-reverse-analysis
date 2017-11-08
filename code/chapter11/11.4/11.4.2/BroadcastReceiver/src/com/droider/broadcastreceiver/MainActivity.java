package com.droider.broadcastreceiver;

import android.os.Bundle;
import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity {
	private Button btn1;
	private Button btn2;
	private TextView tv;
	private boolean working = false;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        setTitle("正常广播接收者程序");
        btn1 = (Button) findViewById(R.id.button1);
        btn1.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				working = true;
				work();	//开始发广播
				btn1.setEnabled(false);
				btn2.setEnabled(true);
			}
		});
        
        btn2 = (Button) findViewById(R.id.button2);
        btn2.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				working = false;		//停止线程
				btn1.setEnabled(true);
				btn2.setEnabled(false);
			}
		});
    }

    private void work(){
		new Thread(){
			@Override
			public void run() {
				while(working) {	//循环工作
					Log.d("com.droider.broadcastreceiver", "发送广播");
			        Intent intent = new Intent();//创建Intent对象
			        intent.setAction("com.droider.workbroadcast");
			        //intent.setClass(MainActivity.this, DataReceiver.class);	//明确指令要发送的目的地
			        intent.putExtra("data", Math.random());	//使用随机值模拟后台软件数据
			        sendBroadcast(intent);	//发送广播
					try {
		                Thread.sleep(5000);	//睡眠3秒
			        } catch(Exception e){
			        	e.printStackTrace();
			        }
				}
				Log.d("com.droider.broadcastreceiver", "广播停止");
			}
		}.start();
	}    

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
}
