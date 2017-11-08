package com.droider.readotherinternalstorage;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;

import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager.NameNotFoundException;
import android.view.Menu;
import android.widget.Toast;

public class MainActivity extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        try {
			Context context = createPackageContext("com.droider.writeinternalstorage", 
			        Context.CONTEXT_IGNORE_SECURITY);
			FileInputStream fis = context.openFileInput("config.txt");
			StringBuffer sb=new StringBuffer(); 
			BufferedReader br = new BufferedReader(new InputStreamReader(fis));
			String data = null;  
			while((data = br.readLine()) != null) {
				sb.append(data);
			}
			fis.close();
			Toast.makeText(MainActivity.this, sb.toString(), Toast.LENGTH_SHORT).show();
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
