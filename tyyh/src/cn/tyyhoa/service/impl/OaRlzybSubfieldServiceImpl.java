// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybSubfieldServiceImpl.java

package cn.tyyhoa.service.impl;

import cn.tyyhoa.dao.OaRlzybSubfieldMapper;
import cn.tyyhoa.pojo.OaRlzybSubfield;
import cn.tyyhoa.service.OaRlzybSubfieldService;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("oaRlzybSubfieldService")
public class OaRlzybSubfieldServiceImpl
	implements OaRlzybSubfieldService
{

	@Autowired
	private  OaRlzybSubfieldMapper oaRlzybSubfieldMapper;

	public OaRlzybSubfieldServiceImpl()
	{
	}

	public List<OaRlzybSubfield> selectByPositionId(Integer position_id)
	{
		return oaRlzybSubfieldMapper.selectByPositionId(position_id);
	}

	public int insert(OaRlzybSubfield subfield)
	{
		return oaRlzybSubfieldMapper.insert(subfield);
	}

	public List<OaRlzybSubfield> selectAllSubfield()
	{
		return oaRlzybSubfieldMapper.selectAllSubfield();
	}

	public int subfield_to_position(OaRlzybSubfield subfield)
	{
		return oaRlzybSubfieldMapper.subfield_to_position(subfield);
	}

	public int subfield_out_position(OaRlzybSubfield subfield)
	{
		return oaRlzybSubfieldMapper.subfield_out_position(subfield);
	}

	public List<OaRlzybSubfield> selectCanDelSubfield()
	{
		return oaRlzybSubfieldMapper.selectCanDelSubfield();
	}

	public int deleteByPrimaryKey(Integer subfield_id)
	{
		return oaRlzybSubfieldMapper.deleteByPrimaryKey(subfield_id);
	}

	@Override
	public List<OaRlzybSubfield> selectByNotPositionId(Integer integer) {
		// TODO Auto-generated method stub
		return oaRlzybSubfieldMapper.selectByNotPositionId(integer);
	}
}
