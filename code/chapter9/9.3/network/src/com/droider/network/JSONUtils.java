package com.droider.network;

import org.json.JSONObject;

public class JSONUtils {
	public static MSGInfo getInfoFromString(String str){
		MSGInfo info = null;
        try {
            JSONObject jsonObject = new JSONObject(str).getJSONObject("info");
            info = new MSGInfo(); 
            info.setDecryptKey(jsonObject.getString("key")); 
            info.setMsg(jsonObject.getString("msg"));      
        } catch (Exception e) {
            e.printStackTrace();
        }
        return info;
    }
}
