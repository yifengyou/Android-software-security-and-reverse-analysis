package com.droider.network;

public class MSGInfo {
	private String decrypt_key;
    private String msg;
    
	public MSGInfo(String decrypt_key, String msg) {
		super();
		this.decrypt_key = decrypt_key;
		this.msg = msg;
	}  
	public MSGInfo() {
		super();
		this.decrypt_key = "";
		this.msg = "";
	} 
	public String getDecryptKey() {
		return decrypt_key;
	}
	public void setDecryptKey(String decrypt_key) {
		this.decrypt_key = decrypt_key;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
