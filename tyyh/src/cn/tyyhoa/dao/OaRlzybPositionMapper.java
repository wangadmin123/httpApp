// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybPositionMapper.java

package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaRlzybPosition;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OaRlzybPositionMapper
{

	public abstract int deleteByPrimaryKey(Integer integer);

	public abstract int insert(OaRlzybPosition oarlzybposition);

	public abstract int insertSelective(OaRlzybPosition oarlzybposition);

	public abstract OaRlzybPosition selectByPrimaryKey(Integer integer);

	public abstract int updateByPrimaryKeySelective(OaRlzybPosition oarlzybposition);

	public abstract int updateByPrimaryKey(OaRlzybPosition oarlzybposition);

	public abstract OaRlzybPosition selectByUserId(Integer user_id);

	public abstract List<OaRlzybPosition> selectByDepartmentid(OaRlzybPosition oarlzybposition);


/*人力资源部*/
	
	List<OaRlzybPosition> selectSomeOaRlzybPositionByDepartment(@Param("DepartmentId") Integer DepartmentId);

    
    OaRlzybPosition selectSomeOaRlzybPositionByEmployeeName(@Param("EmpId") Integer EmpId);
    
    
   /* zl*/
 List<OaRlzybPosition> selectAll();

 
    
    List<OaRlzybPosition> selectAllByDepartId(@Param("department_id")Integer department_id);
    /* zl*/
    /*人力资源部*/
}
