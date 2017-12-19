// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybFunctionServiceImpl.java

package cn.tyyhoa.service.impl;

import cn.tyyhoa.dao.OaRlzybFunctionMapper;
import cn.tyyhoa.pojo.OaRlzybFunction;
import cn.tyyhoa.service.OaRlzybFunctionService;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("osaRlzybFunctionService")
public class OaRlzybFunctionServiceImpl
	implements OaRlzybFunctionService
{

	@Autowired
	private  OaRlzybFunctionMapper oaRlzybFunctionMapper;

	public OaRlzybFunctionServiceImpl()
	{
	}

	public List<OaRlzybFunction> selectBySubfieldId(Integer subfield_id)
	{
		return oaRlzybFunctionMapper.selectBySubfieldId(subfield_id);
	}

	public List<OaRlzybFunction> selectByUserId(Integer user_id)
	{
		return oaRlzybFunctionMapper.selectByUserId(user_id);
	}

	public int insert(OaRlzybFunction function)
	{
		return oaRlzybFunctionMapper.insert(function);
	}

	public List<OaRlzybFunction> selectAddFunction()
	{
		return oaRlzybFunctionMapper.selectAddFunction();
	}

	public int function_to_subfield(OaRlzybFunction function)
	{
		return oaRlzybFunctionMapper.function_to_subfield(function);
	}

	public int function_out_subfield(OaRlzybFunction function)
	{
		return oaRlzybFunctionMapper.function_out_subfield(function);
	}

	public List<OaRlzybFunction> selectCanDelFunction()
	{
		return oaRlzybFunctionMapper.selectCanDelFunction();
	}

	public int deleteByFunctionid(Integer function_id)
	{
		return oaRlzybFunctionMapper.deleteByFunctionid(function_id);
	}

	@Override
	public List<OaRlzybFunction> selectByNotSubfieldId(Integer subfield_id) {
		// TODO Auto-generated method stub
		return oaRlzybFunctionMapper.selectByNotSubfieldId(subfield_id);
	}
}
