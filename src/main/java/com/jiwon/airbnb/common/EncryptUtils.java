package com.jiwon.airbnb.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {
	public static String md5(String message) {
		String resultData = "";
		
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("md5");
			
			byte[] bytes = message.getBytes();
			md.update(bytes);
			
			byte[] digest = md.digest();
			
			for(int i = 0; i < digest.length; i++) {
				resultData += Integer.toHexString(digest[i] & 0xff);
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return resultData;
	}
}
