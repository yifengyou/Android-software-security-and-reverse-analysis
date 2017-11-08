package com.droider.permission;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.TextView;

public class MainActivity extends Activity {
	private TextView tv;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("low-level Permission");
        
        tv = (TextView) findViewById(R.id.tv);
        tv.setText("本程序用户信息：" + getMyID());        
    }

    private String getMyID() {
    	String str = null;
    	try {
    		java.lang.Process process=Runtime.getRuntime().exec("id");
    		InputStream input = process.getInputStream();
    		BufferedReader in = new BufferedReader(
    				new InputStreamReader(process.getInputStream(),"GBK"));
    		str = in.readLine();
    		input.close();
    	} catch (IOException e) {
    		e.printStackTrace();
    	}
    	return str;
    }
    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
}
