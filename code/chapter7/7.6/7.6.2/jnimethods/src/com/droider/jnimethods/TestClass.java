package com.droider.jnimethods;

import android.util.Log;

public class TestClass {
    protected static final String TAG = "com.droider.jnimethods";
    
    public int getIntField() {
        return aIntField;
    }
    public void setIntField(int aIntField) {
        this.aIntField = aIntField;
    }
    public String getStringField() {
        return aStringField;
    }
    public void setStringField(String aStringField) {
        this.aStringField = aStringField;
    }

    
    private int aIntField;
    private String aStringField;
    
    public TestClass(){
        aIntField = 0;
        aStringField = "abc";
    }
    
    public String getChineseString(){
        return "ÄãºÃ£¬°²×¿£¡";
    }
    
    public void aVoidMethod(){
        Log.v(TAG, "jni test a void method£¬ this run in java");
    }
    
    public static void aStaticMethod(String str){
        Log.v(TAG, "jni test a static Method -->" + str);
    }
    
    public static int sqrt(int x){
        return x * x;
    }
}
