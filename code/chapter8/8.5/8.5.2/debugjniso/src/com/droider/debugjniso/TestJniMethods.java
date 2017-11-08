package com.droider.debugjniso;

public class TestJniMethods {
    public native String jniString();
    
    static {
        System.loadLibrary("debugjniso");
    }
}
