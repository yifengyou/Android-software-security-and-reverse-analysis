package com.droider.network;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
 
public class HttpUtils {    
    public static String getStringFromURL(String url){
        HttpGet httpGet = new HttpGet(url);
        HttpParams params = new BasicHttpParams();
        HttpProtocolParams.setVersion(params, HttpVersion.HTTP_1_1);
        HttpProtocolParams.setContentCharset(params, "utf-8");
        params.setBooleanParameter("http.protocol.expect-continue", false);
        String strResult = null;
        try {
            HttpClient httpClient = new DefaultHttpClient(params);
            int res = 0;
            res = httpClient.execute(httpGet).getStatusLine().getStatusCode(); 
            if (res == 200) { //返回码为200时，连接成功
                HttpResponse httpResponse = httpClient.execute(httpGet); 
                HttpEntity entity = httpResponse.getEntity();
                strResult = EntityUtils.toString(entity, HTTP.UTF_8);               
                //Log.d("com.droider.network", strResult.toString());
            }
        }catch (Exception e) {
            e.printStackTrace();    
        }
        return strResult;
    } 
    
}
