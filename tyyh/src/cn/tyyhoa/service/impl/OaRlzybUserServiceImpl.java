// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybUserServiceImpl.java

package cn.tyyhoa.service.impl;

import cn.tyyhoa.dao.OaRlzybUserMapper;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaRlzybUserService;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("oaRlzybUserService")
public class OaRlzybUserServiceImpl
	implements OaRlzybUserService
{
	@Autowired
	private OaRlzybUserMapper oaRlzybUserMapper;

	public OaRlzybUserServiceImpl()
	{
	}

	public int deleteByPrimaryKey(Integer user_id)
	{
		return 0;
	}

	public int insert(OaRlzybUser record)
	{
		return 0;
	}

	public int insertSelective(OaRlzybUser record)
	{
		return 0;
	}

	public OaRlzybUser selectByPrimaryKey(Integer user_id)
	{
		return null;
	}

	public int updateByPrimaryKeySelective(OaRlzybUser record)
	{
		return 0;
	}

	public int updateByPrimaryKey(OaRlzybUser record)
	{
		return 0;
	}

	public OaRlzybUser login(OaRlzybUser user)
	{
		return oaRlzybUserMapper.login(user);
	}

	public List<OaRlzybUser> selectByPositionid(Integer position_id)
	{
		return oaRlzybUserMapper.selectByPositionid(position_id);
	}

	@Override
	public int updataPwdByPrimaryKey(OaRlzybUser oarlzybuser) {
		// TODO Auto-generated method stub
		return oaRlzybUserMapper.updataPwdByPrimaryKey(oarlzybuser);
	}

	@Override
	public OaRlzybUser getEmpName(OaRlzybUser oarlzybuser) {
		// TODO Auto-generated method stub
		return oaRlzybUserMapper.getEmpName(oarlzybuser);
	}

	@Override
	public OaRlzybUser getStuName(OaRlzybUser oarlzybuser) {
		// TODO Auto-generated method stub
		return oaRlzybUserMapper.getStuName(oarlzybuser);
	}
	@Override
	public int InsertUserFromStu(){
		return oaRlzybUserMapper.InsertUserFromStu();
		
	}
	@Override
	public int deleteUserNotKfbStu() {
		// TODO Auto-generated method stub
		return oaRlzybUserMapper.deleteUserNotKfbStu();
	}

	@Override
	public int recordlogincont(OaRlzybUser oarlzybuser) {
		// TODO Auto-generated method stub
		return oaRlzybUserMapper.recordlogincont(oarlzybuser);
	}

	@Override
	public void updateUserJob32(String stuid) {
		// TODO Auto-generated method stub
		oaRlzybUserMapper.updateUserJob32(stuid);
	}

	@Override
	public void updateUserJob33(String stuid) {
		// TODO Auto-generated method stub
		oaRlzybUserMapper.updateUserJob33(stuid);
	}

	@Override
	public void updateUserJobnull(String stuid) {
		// TODO Auto-generated method stub
		oaRlzybUserMapper.updateUserJobnull(stuid);
	}
	
	
	
	
	
	
	
	
	
	@Override
	public boolean updatePositionByEmpId(OaRlzybUser record) {
		int count = oaRlzybUserMapper.updatePositionByEmpId(record);
		if(count > 0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int delStudentDuoyu() {
		// TODO Auto-generated method stub
		return oaRlzybUserMapper.delStudentDuoyu();
	}
}
