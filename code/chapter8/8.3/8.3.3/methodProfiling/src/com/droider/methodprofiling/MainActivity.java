package com.droider.methodprofiling;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends Activity {
	private Button btn1;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        setTitle("Method ProfilingÑÝÊ¾ÊµÀý");
        btn1 = (Button) findViewById(R.id.button1);
        btn1.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				//android.os.Debug.startMethodTracing("123");
				a();
				//android.os.Debug.stopMethodTracing();
			}
		});
    }
    
    private void a() {
    	b();
    }
    
    private void b() {
    	c();
    }
    
    private void c() {
    	Toast.makeText(MainActivity.this, "who called me?", Toast.LENGTH_SHORT).show();
    	
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
}
