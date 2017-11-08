package com.droider.free;

import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends Activity {
	/**
	 * free = 0x7f040001
	 * advanced = 0x7f040002
	 * pro = 0x7f040003
	 */
	private Button btn_free;
	private Button btn_advanced;
	private Button btn_pro;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        int resID = 0;
        if (!checkappKey()) {
        	resID = R.string.free;
        } else {
        	resID = decryptAppKey(getAppKey(2130903041));	//解密resID
        	if (resID == 0)
        		resID = R.string.free;;
        }
        String titleString = getString(resID);	//获取字符串
        setTitle(titleString);					//设置标题
        btn_free = (Button) findViewById(R.id.button_free);
        btn_advanced = (Button) findViewById(R.id.button_advanced);
        btn_pro = (Button) findViewById(R.id.button_pro);
        /*
        try {
			Log.v("com.droider.free", crypt.encrypt("droider", String.valueOf(R.string.advanced)));
			Log.v("com.droider.free", crypt.decrypt("droider", "EE8A8F8B470B82A413AB0F47FF069199"));
			Log.v("com.droider.free", crypt.encrypt("droider", String.valueOf(R.string.pro)));
			Log.v("com.droider.free", crypt.decrypt("droider", "C99AFF21804BB1DED102FDE29F619566"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
        if (resID == R.string.advanced) {	//模拟开启高级版本功能
        	btn_advanced.setVisibility(View.VISIBLE);
        } else if (resID == R.string.pro) {	//模拟开启专业版本功能
        	btn_advanced.setVisibility(View.VISIBLE);
        	btn_pro.setVisibility(View.VISIBLE);
        }
        
        btn_free.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Toast.makeText(MainActivity.this, "free version!", Toast.LENGTH_SHORT).show();
				// ...
			}
		});        
        
        btn_advanced.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				if (checkappKey()) {
					Toast.makeText(MainActivity.this, "advanced version!", Toast.LENGTH_SHORT).show();
					// ...
		        }
			}
		});
        btn_pro.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				if (checkappKey()) {
					Toast.makeText(MainActivity.this, "pro version!", Toast.LENGTH_SHORT).show();
					// ...
		        }
			}
		});   
    }

    private boolean checkappKey() {
    	String appKey = getAppKey(2130903041);	//获取程序授权加密KEY
        if (appKey == null || appKey.length() == 0) {
        	return false;
        } 
        return true;
    }
    private String getAppKey(int resId) {
    	String result = "";
    	try {
    		Context context = MainActivity.this.createPackageContext("com.droider.appkey", 
    				Context.CONTEXT_IGNORE_SECURITY);
    		result = context.getString(resId);
    	} catch (Exception e) {
    		e.printStackTrace();
    		result = "";
    	}
    	return result;
    }
    
    private int decryptAppKey(String appKey) {
    	String str = "";
    	int resID = 0;
    	try {
    		str = crypt.decrypt("droider", appKey);
    		resID = Integer.parseInt(str);
		} catch (Exception e) {
			e.printStackTrace();
			resID = 0;
		}
    	return resID;
    }
    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
}
