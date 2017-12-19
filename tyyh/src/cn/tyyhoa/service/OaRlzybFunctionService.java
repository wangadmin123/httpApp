// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybFunctionService.java

package cn.tyyhoa.service;

import java.util.List;

import cn.tyyhoa.pojo.OaRlzybFunction;


public interface OaRlzybFunctionService
{

	public  List<OaRlzybFunction> selectBySubfieldId(Integer integer);

	public  List<OaRlzybFunction> selectByUserId(Integer integer);
	
	public List<OaRlzybFunction> selectByNotSubfieldId(Integer subfield_id);

	public  int insert(OaRlzybFunction oarlzybfunction);

	public  List<OaRlzybFunction> selectAddFunction();

	public  int function_to_subfield(OaRlzybFunction oarlzybfunction);

	public  int function_out_subfield(OaRlzybFunction oarlzybfunction);

	public  List<OaRlzybFunction> selectCanDelFunction();

	public  int deleteByFunctionid(Integer integer);
}
