package com.lmj.util;

public class MyTool {
	public static String getString(String s){
		String newstr = "";
		try {
			newstr = new String (s.getBytes("iso-8859-1"),"utf-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return newstr;
	}
}
