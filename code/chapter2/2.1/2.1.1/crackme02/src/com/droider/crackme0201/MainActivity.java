package com.droider.crackme0201;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import android.support.v4.app.NavUtils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MainActivity extends Activity {
    private EditText edit_userName;
    private EditText edit_sn;
    private Button btn_register; 
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle(R.string.unregister);  //模拟程序未注册
        edit_userName = (EditText) findViewById(R.id.edit_username);
        edit_sn = (EditText) findViewById(R.id.edit_sn);
        btn_register = (Button) findViewById(R.id.button_register);
        btn_register.setOnClickListener(new OnClickListener() {
            
            public void onClick(View v) {
                if (!checkSN(edit_userName.getText().toString().trim(), 
                        edit_sn.getText().toString().trim())) {
                    Toast.makeText(MainActivity.this,       //弹出无效用户名或注册码提示
                            R.string.unsuccessed, Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(MainActivity.this,       //弹出注册成功提示
                            R.string.successed, Toast.LENGTH_SHORT).show();
                    btn_register.setEnabled(false);
                    setTitle(R.string.registered);  //模拟程序已注册
                }                
            }
        });    
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }

    private boolean checkSN(String userName, String sn) {
        try {
            if ((userName == null) || (userName.length() == 0))
                return false;
            if ((sn == null) || (sn.length() != 16))
                return false;
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.reset();
            digest.update(userName.getBytes());
            byte[] bytes = digest.digest();     //采用MD5对用户名进行Hash
            String hexstr = toHexString(bytes, ""); //将计算结果转化成字符串
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hexstr.length(); i += 2) {
                sb.append(hexstr.charAt(i));
            }
            String userSN = sb.toString(); //计算出的SN        
            //Log.d("crackme", hexstr);
            //Log.d("crackme", userSN);
            if (!userSN.equalsIgnoreCase(sn))   //比较注册码是否正确
                return false;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return false;
        }        
        return true;
    }
    
    private static String toHexString(byte[] bytes, String separator) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xFF & b);
            if(hex.length() == 1){
                hexString.append('0');
            }
            hexString.append(hex).append(separator);
        }
        return hexString.toString();
    }
    
}
