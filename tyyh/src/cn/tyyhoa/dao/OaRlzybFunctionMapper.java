// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybFunctionMapper.java

package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaRlzybFunction;
import java.util.List;

public interface OaRlzybFunctionMapper
{

	public abstract OaRlzybFunction selectByPrimaryKey(Integer integer);

	public abstract int insert(OaRlzybFunction oarlzybfunction);

	public abstract List<OaRlzybFunction> selectBySubfieldId(Integer subfield_id);
	
	public abstract List<OaRlzybFunction> selectByNotSubfieldId(Integer subfield_id);

	public abstract List<OaRlzybFunction> selectByUserId(Integer user_id);

	public abstract List<OaRlzybFunction> selectAddFunction();

	public abstract int function_to_subfield(OaRlzybFunction oarlzybfunction);

	public abstract int function_out_subfield(OaRlzybFunction oarlzybfunction);

	public abstract List<OaRlzybFunction> selectCanDelFunction();

	public abstract int deleteByFunctionid(Integer function_id);
/*人力资源部*/
	   int deleteByPrimaryKey(Integer function_id);



	    int insertSelective(OaRlzybFunction record);


	    int updateByPrimaryKeySelective(OaRlzybFunction record);

	    int updateByPrimaryKey(OaRlzybFunction record);

	
	
	
	/*人力资源部*/
}
