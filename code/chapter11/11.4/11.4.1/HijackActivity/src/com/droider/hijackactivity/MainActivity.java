package com.droider.hijackactivity;

import java.util.Iterator;
import java.util.List;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends Activity {
	private TextView tv;
	private Button btn;
	private EditText txtProcess;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        setTitle("Activity劫持演示程序");
        
        tv = (TextView) findViewById(R.id.editInfo);
        tv.setTextColor(Color.BLUE);
        txtProcess = (EditText) findViewById(R.id.editText1);
        btn = (Button) findViewById(R.id.button1);
        btn.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				String str = txtProcess.getText().toString().trim();
				if (str == null || str.length() == 0) return;
				((MyApp)getApplication()).hijackingList.add(str);
				setHijackingText();
				txtProcess.setText("");	//清空进程输入框
			}
		});
        
        setHijackingText();
        
        Intent intent = new Intent(MainActivity.this, Hijacker.class);
        startService(intent);	//启动劫持服务
    }
    
    private void setHijackingText() {
    	StringBuilder sb = new StringBuilder("劫持的进程列表：\n");
        List<String> list = ((MyApp)getApplication()).hijackingList;
        Iterator<String> strs = list.iterator();
        while (strs.hasNext())
        	sb.append(strs.next() + '\n');	//获取所有劫持的进程
        tv.setText(sb.toString());	//显示劫持的进程列表
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
    
    
}
