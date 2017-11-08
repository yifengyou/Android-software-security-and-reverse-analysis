package com.droider.debugjniso;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class DebugjnisoActivity extends Activity {
	private Button btn1;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        btn1 = (Button) findViewById(R.id.button1);
        btn1.setOnClickListener(new OnClickListener() {
			
			public void onClick(View v) {
				TestJniMethods methods = new TestJniMethods(); 
		        String str = methods.jniString();
		        setTitle(str);  
			}
		});              
    }     
}