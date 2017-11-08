package com.droider.sn;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends Activity {
	private EditText edt_userName;
	private EditText edt_sn;
	private Button btn_register;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        setTitle("×¢²áÂëÑÝÊ¾³ÌÐò");
        edt_userName = (EditText) findViewById(R.id.edit_username);
        edt_sn = (EditText) findViewById(R.id.edit_sn);
        btn_register = (Button) findViewById(R.id.button_register);
        
        btn_register.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				String strUserName = edt_userName.getText().toString().trim();
				String strPassword = edt_sn.getText().toString().trim();
				if (strUserName.length() == 0 || strPassword.length() == 0) {
					Toast.makeText(MainActivity.this, "ÇëÊäÈëÓÃ»§ÃûÓë×¢²áÂë", Toast.LENGTH_SHORT).show();
					return;
				}
				String realSN = calcSN(strUserName);
				if (strPassword.equalsIgnoreCase(realSN)) {
					Toast.makeText(MainActivity.this, "×¢²áÂëÕýÈ·", Toast.LENGTH_SHORT).show();
				} else {
					Toast.makeText(MainActivity.this, "×¢²áÂë´íÎó", Toast.LENGTH_SHORT).show();
				}
			}
		});
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
    
    private String calcSN(String userName) { 
    	if (userName == null || userName.length() == 0) return null;    	 
    	return md5(userName);
    }
    
    private String md5(String string) {
        byte[] hash;
        try {
            hash = MessageDigest.getInstance("MD5").digest(string.getBytes("UTF-8"));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Huh, MD5 should be supported?", e);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("Huh, UTF-8 should be supported?", e);
        }

        StringBuilder hex = new StringBuilder(hash.length * 2);
        for (byte b : hash) {
            if ((b & 0xFF) < 0x10) hex.append("0");
            hex.append(Integer.toHexString(b & 0xFF));
        }
        return hex.toString();
    }
    
}
