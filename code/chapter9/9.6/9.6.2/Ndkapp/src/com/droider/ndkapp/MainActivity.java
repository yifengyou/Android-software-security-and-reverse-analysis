package com.droider.ndkapp;

import android.os.Bundle;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.DialogInterface;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends Activity {
	private Button btn1;
	private static String workString;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        String str1 = "NDK保护与重启验证演示程序";
        String str2;
        int m = ((MyApp)getApplication()).m;
        if (m == 0) {
        	str2 = "-未注册";
		} else if (m == 1) {
			str2 = "-正式版";
		} else if (m == 2) {
			str2 = "-专业版";
		} else if (m == 3) {
			str2 = "-企业版";
		} else if (m == 4) {
			str2 = "-专供版";
		} else {
			str2 = "-未知版";
		}
        setTitle(str1 + str2);	//设置标题
        
        btn1 = (Button) findViewById(R.id.button1);
        btn1.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				int m = ((MyApp)getApplication()).m;
				if (m == 0 ) {					
					doRegister();	//提示注册
				} else {
					((MyApp)getApplication()).work();	//调用NDK函数执行函数功能，期间仍有注册检查
					Toast.makeText(getApplicationContext(), workString, Toast.LENGTH_SHORT).show();
				}
			}
		});
        
    }
    
    public void doRegister() {
    	new AlertDialog.Builder(MainActivity.this)
	        .setTitle("程序未注册")
	        .setMessage("请点击确定注册本程序或者点击取消退出程序！")
	        .setPositiveButton("确定", new DialogInterface.OnClickListener() {
				
				@Override
				public void onClick(DialogInterface dialog, int which) {
					Intent intent = new Intent();
					ComponentName cpname = new ComponentName("com.droider.ndkapp", 
						"com.droider.ndkapp.RegActivity");
					intent.setComponent(cpname);
					startActivity(intent);
					MainActivity.this.finish();
				}
			}).setNegativeButton("取消", new DialogInterface.OnClickListener() {
				
				@Override
				public void onClick(DialogInterface dialog, int which) {
					android.os.Process.killProcess(android.os.Process.myPid());							
				}
			}).show();
    }
    
    public void work(String str) {
    	workString = str;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
}
