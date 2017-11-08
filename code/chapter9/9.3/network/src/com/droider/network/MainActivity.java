package com.droider.network;

import android.net.ConnectivityManager;
import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity {
	private Button btn_work;
	private TextView txt_info;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("网络验证演示程序");        
        
        btn_work = (Button) findViewById(R.id.button1);
    	txt_info = (TextView) findViewById(R.id.text_info);
    	
    	btn_work.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				if (!CheckNetworkState()) {
		        	txt_info.setTextColor(Color.RED);
		        	txt_info.setText("该功能只能在网络状态下使用！");
		        } else {
		            getData();
		        }				
			}
		});
    }
    
	private void getData() {
		String result = HttpUtils.getStringFromURL("http://com-droider-network.googlecode.com/svn/info.txt");
        if (result == null || result.length() == 0) {	//从网络下载数据
        	txt_info.setTextColor(Color.RED);
        	txt_info.setText("获取网络数据出错！");
        } else {
        	MSGInfo info = JSONUtils.getInfoFromString(result);	//解析JSON格式的数据
        	try {
				String str = Crypt.decrypt(info.getDecryptKey(), info.getMsg());	//解密从网络获取的数据
	        	txt_info.setTextColor(Color.GREEN);
	        	txt_info.setText(str);	//显示解密的数据
			} catch (Exception e) {
			}
        }
    }
    
    /**
     * 检查网络状态
     * @return
     */
    private boolean CheckNetworkState() {
        boolean flag = false;
        ConnectivityManager manager = (ConnectivityManager)getSystemService(
                Context.CONNECTIVITY_SERVICE);
        if(manager.getActiveNetworkInfo() != null) {
            flag = manager.getActiveNetworkInfo().isAvailable();
        }
        return flag;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
}
