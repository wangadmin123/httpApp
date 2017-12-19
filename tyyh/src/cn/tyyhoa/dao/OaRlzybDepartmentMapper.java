// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybDepartmentMapper.java

package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaRlzybDepartment;
import java.util.List;

public interface OaRlzybDepartmentMapper
{

	public int deleteByPrimaryKey(Integer integer);

	public int insert(OaRlzybDepartment oarlzybdepartment);

	public int insertSelective(OaRlzybDepartment oarlzybdepartment);

	public OaRlzybDepartment selectByPrimaryKey(Integer integer);

	public int updateByPrimaryKeySelective(OaRlzybDepartment oarlzybdepartment);

	public int updateByPrimaryKey(OaRlzybDepartment oarlzybdepartment);

	public OaRlzybDepartment selectByPositionId(Integer depart_ids);

	public List<OaRlzybDepartment> selectAllDepartment();
	
	public List<OaRlzybDepartment> chooseposition();

/*人力资源部*/
	List<OaRlzybDepartment> selectAllOaRlzybDepartment();	
	List<OaRlzybDepartment> selectAll();
	/*人力资源部*/	
	
}
