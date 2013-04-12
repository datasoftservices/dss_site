package com.dss.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashService {

	public String hashThis(String s){
		
	    MessageDigest md;
	    
		try {
			
			md = MessageDigest.getInstance("SHA-256");
		    md.update(s.getBytes());

		    byte byteData[] = md.digest();
		    
		    StringBuffer sb = new StringBuffer();
		    for (int i = 0; i < byteData.length; i++) {
		     sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		    }

		    return sb.toString();
		    
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "hash_failed";
	} 
}
