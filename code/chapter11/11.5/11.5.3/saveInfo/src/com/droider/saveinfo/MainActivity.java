package com.droider.saveinfo;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;

public class MainActivity extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        Intent intent = new Intent();				//创建Intent对象
        intent.setAction("com.droider.saveinfo");	//Action
        intent.putExtra("username", "droider");		//用户名
        intent.putExtra("password", "123456");		//密码
        startService(intent);		//启动服务处理用户名与密码
        sendBroadcast(intent);		//发送广播处理用户名与密码
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
}
