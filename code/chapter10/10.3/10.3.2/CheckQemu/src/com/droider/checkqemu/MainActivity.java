package com.droider.checkqemu;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Method;

import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.util.Log;
import android.view.Menu;
import android.widget.TextView;

public class MainActivity extends Activity {
	private TextView text_info;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        setTitle("模拟器检测演示程序");
        text_info = (TextView) findViewById(R.id.textView1);
        if (isRunningInEmualtor()) {	//检测模拟器
        	text_info.setTextColor(Color.RED);
        	text_info.setText("程序运行在模拟器中！");
        } else {
        	text_info.setTextColor(Color.GREEN);
        	text_info.setText("程序运行在真实设备中！");
        }
    }

    boolean isRunningInEmualtor() {
    	boolean qemuKernel = false;
    	Process process = null;
        DataOutputStream os = null;
        try{  
            process = Runtime.getRuntime().exec("getprop ro.kernel.qemu");  
            os = new DataOutputStream(process.getOutputStream());
            BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream(),"GBK"));
            os.writeBytes("exit\n");  
            os.flush();
            process.waitFor();
            qemuKernel = (Integer.valueOf(in.readLine()) == 1);
            Log.d("com.droider.checkqemu", "检测到模拟器:" + qemuKernel);             
        } catch (Exception e){  
        	qemuKernel = false;
            Log.d("com.droider.checkqemu", "run failed" + e.getMessage()); 
        } finally {
            try{  
                if (os != null) {  
                    os.close();  
                }  
                process.destroy();  
            } catch (Exception e) {
            	
            }  
            Log.d("com.droider.checkqemu", "run finally"); 
        }
        return qemuKernel;
    }
    
    public static String getProp(Context context, String property) {
    	try {
    		ClassLoader cl = context.getClassLoader();
    		Class SystemProperties = cl.loadClass("android.os.SystemProperties");
    		Method method = SystemProperties.getMethod("get", String.class);
    		Object[] params = new Object[1];
    		params[0] = new String(property);
    		return (String)method.invoke(SystemProperties, params);
    	} catch (Exception e) {
    		return null;
    	}
    }
    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
}
