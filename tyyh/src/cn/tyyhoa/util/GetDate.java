// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   GetDate.java

package cn.tyyhoa.util;

import java.io.PrintStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GetDate
{

	public GetDate()
	{
	}

	public Date getDateNowDate()
	{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date nowDate = null;
		try
		{
			nowDate = df.parse(df.format(new Date()));
		}
		catch (ParseException e)
		{
			e.printStackTrace();
		}
		System.out.println(nowDate);
		return nowDate;
	}

	public String getStringNowDate()
	{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return df.format(new Date());
	}
}
