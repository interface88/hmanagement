package com.app.framework;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

public class DateTimeUtil
{
	public static Date ParseString(String StringDate)
	{
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");

		try
		{
			return new Date(simpleDateFormat.parse(StringDate).getTime());
		}
		catch (ParseException e)
		{
			return null;
		}
	}
	
	public static String DateToString(Date date)
	{
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd-MM-yyyy");//dd/MM/yyyy
	    String strDate = sdfDate.format(date);
	    return strDate;
	}
	
	public static Date getCurrentDateObject(){
		java.util.Date date = new java.util.Date();
		return new Date(date.getTime());
	}
	
	public static String getCurrentDate(){
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd-MM-yyyy");//dd/MM/yyyy
		java.util.Date now = new java.util.Date();
	    String strDate = sdfDate.format(now);
	    return strDate;
	}
	
	/**
	 * Return the difference between 2 date in day
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public static int getElapsedDay(Date startDate, Date endDate){
		final long DAY_IN_MILLIS = 1000 * 60 * 60 * 24;

		int diffInDays = (int) ((endDate.getTime() - startDate.getTime())/ DAY_IN_MILLIS );
		return diffInDays;
	}
	
}
