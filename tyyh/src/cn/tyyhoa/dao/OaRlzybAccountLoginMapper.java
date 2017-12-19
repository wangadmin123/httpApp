// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybAccountLoginMapper.java

package cn.tyyhoa.dao;

import java.util.List;

import cn.tyyhoa.pojo.OaRlzybAccountLogin;

public interface OaRlzybAccountLoginMapper
{

	public abstract int deleteByPrimaryKey(Integer integer);
	
	/**
	 * 添加登陆信息记录
	 * @param oarlzybaccountlogin
	 * @return
	 */
	public abstract int insert(OaRlzybAccountLogin oarlzybaccountlogin);

	public abstract int insertSelective(OaRlzybAccountLogin oarlzybaccountlogin);

	public abstract OaRlzybAccountLogin selectByPrimaryKey(Integer integer);

	public abstract int updateByPrimaryKeySelective(OaRlzybAccountLogin oarlzybaccountlogin);

	public abstract int updateByPrimaryKey(OaRlzybAccountLogin oarlzybaccountlogin);
	/**
	 * 查询上次登陆信息
	 */
	public List<OaRlzybAccountLogin> lastLoginInfo(OaRlzybAccountLogin oarlzybaccountlogin);
}
