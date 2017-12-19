// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybUserService.java

package cn.tyyhoa.service;

import cn.tyyhoa.pojo.OaRlzybUser;
import java.util.List;

public interface OaRlzybUserService
{

	public abstract int deleteByPrimaryKey(Integer integer);

	public abstract int insert(OaRlzybUser oarlzybuser);

	public abstract int insertSelective(OaRlzybUser oarlzybuser);

	public abstract OaRlzybUser selectByPrimaryKey(Integer integer);

	public abstract int updateByPrimaryKeySelective(OaRlzybUser oarlzybuser);

	public abstract int updateByPrimaryKey(OaRlzybUser oarlzybuser);

	public abstract OaRlzybUser login(OaRlzybUser oarlzybuser);

	public abstract List<OaRlzybUser> selectByPositionid(Integer integer);
	
	
	public int updataPwdByPrimaryKey(OaRlzybUser oarlzybuser);
	
	public abstract OaRlzybUser getEmpName(OaRlzybUser oarlzybuser);
	
	public abstract OaRlzybUser getStuName(OaRlzybUser oarlzybuser);

	public abstract int InsertUserFromStu();
	
	public abstract int deleteUserNotKfbStu();
	
	public abstract int recordlogincont(OaRlzybUser oarlzybuser);
	
	public abstract void updateUserJob32(String stuid);
	
	public abstract void updateUserJob33(String stuid);
	
	public abstract void updateUserJobnull(String stuid);


public boolean updatePositionByEmpId(OaRlzybUser record);

public int delStudentDuoyu();

}
