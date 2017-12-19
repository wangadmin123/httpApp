// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybDepartmentServiceImpl.java

package cn.tyyhoa.service.impl;

import cn.tyyhoa.dao.OaRlzybDepartmentMapper;
import cn.tyyhoa.pojo.OaRlzybDepartment;
import cn.tyyhoa.service.OaRlzybDepartmentService;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("oaRlzybDepartmentService")
public class OaRlzybDepartmentServiceImpl
	implements OaRlzybDepartmentService
{
	@Autowired
	private OaRlzybDepartmentMapper oaRlzybDepartmentMapper;

	public OaRlzybDepartmentServiceImpl()
	{
	}

	public List<OaRlzybDepartment> selectAllDepartment()
	{
		return oaRlzybDepartmentMapper.selectAllDepartment();
	}
	@Override
	public List<OaRlzybDepartment> selectAll() {
		
		return oaRlzybDepartmentMapper.selectAll();
	}

	@Override
	public List<OaRlzybDepartment> chooseposition() {
		// TODO Auto-generated method stub
		return oaRlzybDepartmentMapper.chooseposition();
	}
}
