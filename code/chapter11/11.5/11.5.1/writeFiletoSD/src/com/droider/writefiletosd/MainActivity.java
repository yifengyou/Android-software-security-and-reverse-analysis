package com.droider.writefiletosd;

import java.io.File;
import java.io.FileOutputStream;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.Toast;

public class MainActivity extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        setTitle("外部存储演示程序");
        
        File configFile = new File("/sdcard/config.txt");
    	FileOutputStream os;
		try {
			os = new FileOutputStream(configFile);
			os.write("Hello World".getBytes());
			os.close();
			Toast.makeText(MainActivity.this, "config.txt创建成功", Toast.LENGTH_SHORT).show();
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
}
