// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybPosition.java

package cn.tyyhoa.pojo;

import java.util.List;

public class OaRlzybPosition 
{

	private Integer position_id;
	private String position_name;
	private Integer depart_id;
	private String depart_name;
	private Integer jurisdiction_id;
	private String jurisdiction_name;
	private List<OaRlzybSubfield> subfields;
	private List<OaRlzybUser> users;

	public OaRlzybPosition()
	{
	}

	

	public Integer getDepart_id()
	{
		return depart_id;
	}

	public void setDepart_id(Integer depart_id)
	{
		this.depart_id = depart_id;
	}

	public String getDepart_name()
	{
		return depart_name;
	}

	public void setDepart_name(String depart_name)
	{
		this.depart_name = depart_name;
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
		this.jurisdiction_name = jurisdiction_name;
	}

	

	public List<OaRlzybSubfield> getSubfields() {
		return subfields;
	}



	public void setSubfields(List<OaRlzybSubfield> subfields) {
		this.subfields = subfields;
	}



	public List<OaRlzybUser> getUsers() {
		return users;
	}



	public void setUsers(List<OaRlzybUser> users) {
		this.users = users;
	}



	public Integer getPosition_id()
	{
		return position_id;
	}

	public void setPosition_id(Integer position_id)
	{
		this.position_id = position_id;
	}

	public String getPosition_name()
	{
		return position_name;
	}

	public void setPosition_name(String position_name)
	{
		this.position_name = position_name != null ? position_name.trim() : null;
	}
}
