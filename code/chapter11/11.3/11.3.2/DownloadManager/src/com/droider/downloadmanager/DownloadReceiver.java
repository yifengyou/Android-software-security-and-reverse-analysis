package com.droider.downloadmanager;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.widget.Toast;

public class DownloadReceiver extends BroadcastReceiver {

	@Override
	public void onReceive(Context context, Intent intent) {
		if (intent.getAction().equals("com.droider.download")) {
			String url = intent.getExtras().getString("url");
			String fileName = intent.getExtras().getString("filename");
			Toast.makeText(context, url, Toast.LENGTH_SHORT).show();
			try {
				downloadFile(url, fileName);	//下载文件
			} catch (IOException e) {
				e.printStackTrace();
			}
		}	
		
	}

	 private void downloadFile(String url,String filename) throws IOException{
	    	URL myURL = new URL(url);
	    	URLConnection conn = myURL.openConnection();
	    	conn.connect();
	    	InputStream is = conn.getInputStream();
		    if (is == null) 
		    	throw new RuntimeException("stream is null");
		    int fileSize = conn.getContentLength();			//文件大小
		    if (fileSize <= 0) 
		    	throw new RuntimeException("can not get file size ");
		    FileOutputStream fos = new FileOutputStream("/sdcard/" + filename);	//保存文件的路径		    
		    byte buf[] = new byte[1024];
		    int numread = -1;
		    while ((numread = is.read(buf)) != -1){
		        fos.write(buf, 0, numread);
		    }
		    is.close();
		    fos.close();
	    }

}