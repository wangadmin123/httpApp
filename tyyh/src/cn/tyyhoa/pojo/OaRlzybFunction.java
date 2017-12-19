// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybFunction.java

package cn.tyyhoa.pojo;


public class OaRlzybFunction
{

	private Integer function_id;
	private String function_name;
	private String function_url;
	private Integer yn_show;
	private Integer function_jurisdiction;
	private Integer subfield_id;

	public OaRlzybFunction()
	{
	}

	public Integer getSubfield_id()
	{
		return subfield_id;
	}

	public void setSubfield_id(Integer subfield_id)
	{
		this.subfield_id = subfield_id;
	}

	public Integer getYn_show()
	{
		return yn_show;
	}

	public void setYn_show(Integer yn_show)
	{
		this.yn_show = yn_show;
	}

	public Integer getFunction_jurisdiction()
	{
		return function_jurisdiction;
	}

	public void setFunction_jurisdiction(Integer function_jurisdiction)
	{
		this.function_jurisdiction = function_jurisdiction;
	}

	public Integer getFunction_id()
	{
		return function_id;
	}

	public void setFunction_id(Integer function_id)
	{
		this.function_id = function_id;
	}

	public String getFunction_name()
	{
		return function_name;
	}

	public void setFunction_name(String function_name)
	{
		this.function_name = function_name != null ? function_name.trim() : null;
	}

	public String getFunction_url()
	{
		return function_url;
	}

	public void setFunction_url(String function_url)
	{
		this.function_url = function_url != null ? function_url.trim() : null;
	}
}
