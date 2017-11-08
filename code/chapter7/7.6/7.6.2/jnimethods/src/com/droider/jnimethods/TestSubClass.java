package com.droider.jnimethods;

import android.util.Log;

public class TestSubClass extends TestClass{
    private static float subFloatField = 3.8f;
    private static String TAG="jnimethods";
    
    public void aVoidMethod(){
        Log.v(TAG, "jni test a void subclass method£¬ this run in java");
    }    
    
    public static void aStaticMethod(String str){
        Log.v(TAG, "jni test a static subclass Method -->" + str);
    }

    public static float getSubIntField() {
        return subFloatField;
    }

    public static void setSubIntField(float subIntField) {
        TestSubClass.subFloatField = subIntField;
    }

}
