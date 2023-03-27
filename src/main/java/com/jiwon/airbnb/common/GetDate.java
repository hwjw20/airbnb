package com.jiwon.airbnb.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GetDate {

	public static String getDate(Date date, int days) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, days);
		
		return format.format(cal.getTime());
	}
}
