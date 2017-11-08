package com.droider.antidebug;

import android.os.Bundle;
import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.util.Log;
import android.view.Menu;
import android.widget.Toast;

public class MainActivity extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        setTitle("反调试演示程序");
        if ((getApplicationInfo().flags &= 
        		ApplicationInfo.FLAG_DEBUGGABLE) != 0){
        	Log.e("com.droider.antidebug", "程序被修改为可调试状态");
        	android.os.Process.killProcess(android.os.Process.myPid());
        }  
        if (android.os.Debug.isDebuggerConnected()) {	//检测调试器
        	Log.e("com.droider.antidebug", "检测到测试器");
        	android.os.Process.killProcess(android.os.Process.myPid());
        }       
    }   

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
}
