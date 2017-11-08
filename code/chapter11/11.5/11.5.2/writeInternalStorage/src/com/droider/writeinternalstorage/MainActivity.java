package com.droider.writeinternalstorage;

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
        
        setTitle("内部存储演示程序");
        
        try {
    		FileOutputStream fos = openFileOutput("config.txt", MODE_WORLD_READABLE /*MODE_PRIVATE*/);
    		fos.write("Hello World".getBytes());
    		fos.close();
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
