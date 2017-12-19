package cn.tyyhoa.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJwbGradeMapper;
import cn.tyyhoa.dao.OaKfbUserMapper;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaKfbUser;
import cn.tyyhoa.pojo.OaKfbUserExample;
import cn.tyyhoa.pojo.OaKfbUserExample.Criteria;
import cn.tyyhoa.service.OaKfbUserService;

@Service("OaKfbUserService")
public class OaKfbUserServiceimpl implements OaKfbUserService{
	
	@Autowired
	OaKfbUserMapper userMapper;
	@Autowired 
	OaJwbGradeMapper gradeMapper;
	
	@Override
	public OaKfbUser selectUse(Integer id) {
		return userMapper.selectUse(id);
	}

	
	@Override
	public OaKfbUser selectallscore(Integer id) {
		OaKfbUser oaKfbUser=userMapper.selectallscore(id).get(0);
		if(oaKfbUser!=null){
			return oaKfbUser;
		}
		return null;
	}


	@Override
	public List<OaKfbUser> selectAllkq(Integer groupid) {
		 List<OaKfbUser> list3=userMapper.selectAllkq(groupid);
		 if(list3.size()!=0){
			 return list3;
		 }
		return null;
	}

	@Override
	public List<OaKfbUser> selectjlAllkq(OaKfbUser oaKfbUser) {
		 List<OaKfbUser> list=userMapper.selectjlAllkq(oaKfbUser);
		 System.out.println(list.size());
		 if(list.size()!=0){
			 return list;
		 }
		return null;
	}

	@Override
	public List<OaKfbUser> getStuinfo(OaKfbUser oaKfbUser) {
		// TODO Auto-generated method stub
		return userMapper.selectAll(oaKfbUser);
	}



	@Override
	public List<OaKfbUser> selectUserNoGroup() {
		// TODO Auto-generated method stub
		return userMapper.selectUserNoGroup(null);
	}


	@Override
	public void UserUpdateGroups(List<Integer> userids, Integer groupid) {
		// TODO Auto-generated method stub
		OaKfbUserExample example=new OaKfbUserExample();
		Criteria usercreate = example.createCriteria();
		usercreate.andIdIn(userids);
		OaKfbUser user=new OaKfbUser();
		user.setGroupid(groupid);
		userMapper.updateByExampleSelective(user, example);
	}


	@Override
	public void UserUpdateGroup(Integer id, Integer groupid) {
		// TODO Auto-generated method stub
		OaKfbUser user=new OaKfbUser();
		user.setId(id);
		user.setGroupid(groupid);
		userMapper.updateByPrimaryKeySelective(user);
	}
	@Override
	public void UserUpdateJob(OaKfbUser user) {
		// TODO Auto-generated method stub
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public int insertuser() {
		// TODO Auto-generated method stub
		return userMapper.InsertUserFromStu(null);
	}
	@Override
	 public List<OaKfbUser> getUserByGroup(Integer groupid) {
		// TODO Auto-generated method stub
		return userMapper.selectByGroup(groupid);
	}


	@Override
	public int remove(Integer id) {
		// TODO Auto-generated method stub
		OaKfbUser user=new OaKfbUser();
		user.setId(id);
		user.setJobid(0);
		user.setGroupid(null);
		int row=userMapper.Remove(user);
		return row;
	}


	@Override
	public OaKfbUser selectUser(String id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKeyTest(id);
	}


	@Override
	public List<OaKfbUser> gethistoryStu(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return userMapper.selectHistoryStu(paramMap);
	}

	@Override
	public List<OaJwbGrade> getgrade() {
		// TODO Auto-generated method stub
		return gradeMapper.selectAllGrade();
	}
	@Override
	public List<OaKfbUser> selectYgByUid(OaKfbUser oaKfbUser) {
		// TODO Auto-generated method stub
		return userMapper.selectYgByUid(oaKfbUser);
	}


	@Override
	public OaKfbUser selectByUid(Integer uid) {
		// TODO Auto-generated method stub
		return userMapper.selectByUid(uid);
	}





}
