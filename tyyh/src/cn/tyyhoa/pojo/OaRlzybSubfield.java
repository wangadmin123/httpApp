// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybSubfield.java

package cn.tyyhoa.pojo;

import java.util.List;

public class OaRlzybSubfield
{

	private Integer subfield_id;
	private String subfield_name;
	private String show_name;
	private String position_id;
	private List<OaRlzybFunction> functions;

	public OaRlzybSubfield()
	{
	}

	public String getPosition_id()
	{
		return position_id;
	}

	public void setPosition_id(String position_id)
	{
		this.position_id = position_id;
	}

	public List<OaRlzybFunction> getFunctions()
	{
		return functions;
	}

	public void setFunctions(List<OaRlzybFunction> functions)
	{
		this.functions = functions;
	}

	public Integer getSubfield_id()
	{
		return subfield_id;
	}

	public void setSubfield_id(Integer subfield_id)
	{
		this.subfield_id = subfield_id;
	}

	public String getSubfield_name()
	{
		return subfield_name;
	}

	public void setSubfield_name(String subfield_name)
	{
		this.subfield_name = subfield_name != null ? subfield_name.trim() : null;
	}

	public String getShow_name()
	{
		return show_name;
	}

	public void setShow_name(String show_name)
	{
		this.show_name = show_name != null ? show_name.trim() : null;
	}
}
