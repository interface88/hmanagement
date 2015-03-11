package com.app.framework;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

public class DateTimeUtil
{
	public static Date ParseString(String StringDate)
	{
		SimpleDateFormat DateF = new SimpleDateFormat("dd-MMMM-yyyy");

		try
		{
			return (Date) DateF.parse(StringDate);
		}
		catch (ParseException e)
		{
			return null;
		}
	}
}
