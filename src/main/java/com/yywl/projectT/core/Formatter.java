package com.yywl.projectT.core;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;

import com.google.gson.Gson;

@Component
public class Formatter {
	public final static SimpleDateFormat dateTimeFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	public final static Gson gson=new Gson();
	
	public final static SimpleDateFormat dateFormatter=new SimpleDateFormat("yyyy-MM-dd");
	
	public String getAmountText(int amount) {
		String t = amount + "";
		if (t.length()==1) {
			return "0.0"+t;
		}
		if (t.length()==2) {
			return "0."+t;
		}
		int index = t.length() - 2;
		t = t.substring(0, index) + "." + t.substring(index, index + 2);
		return t;
	}
}
