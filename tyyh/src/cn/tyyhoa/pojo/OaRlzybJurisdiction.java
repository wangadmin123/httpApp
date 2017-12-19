// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybJurisdiction.java

package cn.tyyhoa.pojo;


public class OaRlzybJurisdiction
{

	private Integer jurisdiction_id;
	private String jurisdiction_name;

	public OaRlzybJurisdiction()
	{
	}

	public Integer getJurisdiction_id()
	{
		return jurisdiction_id;
	}

	public void setJurisdiction_id(Integer jurisdiction_id)
	{
		this.jurisdiction_id = jurisdiction_id;
	}

	public String getJurisdiction_name()
	{
		return jurisdiction_name;
	}

	public void setJurisdiction_name(String jurisdiction_name)
	{
		this.jurisdiction_name = jurisdiction_name != null ? jurisdiction_name.trim() : null;
	}
}
