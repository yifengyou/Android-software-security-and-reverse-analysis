package com.droider.ndkapp;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class RegActivity extends Activity {
	private Button btn_reg;
	private EditText edit_sn;
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reg);
        
        btn_reg = (Button) findViewById(R.id.button1);
        edit_sn = (EditText) findViewById(R.id.editText1);
        
        btn_reg.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				String sn = edit_sn.getText().toString().trim();
				if ( sn == null || sn.length() == 0 ) {
					Toast.makeText(RegActivity.this, "请输入注册码", Toast.LENGTH_SHORT).show();
				} else {
					((MyApp)getApplication()).saveSN(sn);	//保存注册码
					new AlertDialog.Builder(RegActivity.this)
		                .setTitle("注册")
		                .setMessage("注册码已保存，点击确定后程序将退出，请手动重新启动本程序！")
		                .setPositiveButton("确定", new DialogInterface.OnClickListener() {
							
							@Override
							public void onClick(DialogInterface dialog, int which) {
								android.os.Process.killProcess(android.os.Process.myPid());
							}
						}).show();	
				}
			}
		});
    }
	
}
