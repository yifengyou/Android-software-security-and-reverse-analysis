package com.droider.jnimethods;

import android.app.Activity;
import android.os.Bundle;

public class JnimethodsActivity extends Activity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        TestJniMethods methods = new TestJniMethods();        
        //android.os.Debug.waitForDebugger();
        methods.test();
        setTitle(methods.nativeMethod());
        methods.newJniThreads(5);    //创建5个线程
        Object obj = methods.allocNativeBuffer(16L); //分配字节缓冲区
        methods.freeNativeBuffer(obj);  //释放字节缓冲区
    }
     
}