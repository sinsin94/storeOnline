package com.store.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GetCusID {

	public static String get(){
		Date date = new Date();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//	    int k = 1;
//	    DecimalFormat df = new DecimalFormat("0000");
//	    String d = sdf.format(date);
//	    String n = df.format(k);
///	    System.out.println(sdf.format(date));
		return sdf.format(date);
	}
	
}
