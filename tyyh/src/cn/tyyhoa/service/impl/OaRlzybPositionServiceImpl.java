// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybPositionServiceImpl.java

package cn.tyyhoa.service.impl;

import cn.tyyhoa.dao.OaRlzybPositionMapper;
import cn.tyyhoa.pojo.OaRlzybPosition;
import cn.tyyhoa.service.OaRlzybPositionService;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("oaRlzybPositionService")
public class OaRlzybPositionServiceImpl
	implements OaRlzybPositionService
{

	@Autowired
	private OaRlzybPositionMapper oaRlzybPositionMapper;

	public OaRlzybPositionServiceImpl()
	{
	}

	public OaRlzybPosition selectByUserId(Integer user_id)
	{
		return oaRlzybPositionMapper.selectByUserId(user_id);
	}

	public List<OaRlzybPosition> selectByDepartmentid(OaRlzybPosition position)
	{
		return oaRlzybPositionMapper.selectByDepartmentid(position);
	}
	
	/**
	 * 查询全部职位
	 */
	@Override
	public List<OaRlzybPosition> selectAll() {
		
		return oaRlzybPositionMapper.selectAll();
	}

	@Override
	public List<OaRlzybPosition> selectAllByDepartId(Integer department_id) {
		// TODO Auto-generated method stub
		return oaRlzybPositionMapper.selectAllByDepartId(department_id);
	}

}
