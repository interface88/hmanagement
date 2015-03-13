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
	
	public Date getCurrentDate(){
		java.util.Date date = new java.util.Date();
		return new Date(date.getTime());
	}
}
