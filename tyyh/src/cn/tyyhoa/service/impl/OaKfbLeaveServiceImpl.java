package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tyyhoa.dao.OaKfbLeaveMapper;
import cn.tyyhoa.dao.OaKfbUserMapper;
import cn.tyyhoa.pojo.OaKfbGroup;
import cn.tyyhoa.pojo.OaKfbLeave;
import cn.tyyhoa.pojo.OaKfbUser;
import cn.tyyhoa.service.OaKfbLeaveService;

@Service(value="oaKfbLeaveService")
public class OaKfbLeaveServiceImpl implements OaKfbLeaveService {
	@Autowired
	OaKfbLeaveMapper oaKfbLeaveMapper;
	@Autowired
	OaKfbUserMapper oaKfbUserMapper;

	

	@Override
	public boolean addleave(OaKfbLeave kfbLeave) {
		
		int row =  oaKfbLeaveMapper.addleave(kfbLeave);
		
		if(row==1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<OaKfbLeave> ZzselectByName(String stuname, Integer groupid) {
		
		List<OaKfbLeave>  oaKfbL= oaKfbLeaveMapper.ZzselectByName(stuname,groupid);
		System.out.println(stuname+"============"+groupid);
		if(oaKfbL.size()!=0){
			return oaKfbL;
		}else{
			return null;
			}
	}

	@Override
	public List<OaKfbLeave> ZyselectByType(OaKfbLeave oaKfbLeave) {
		
		List<OaKfbLeave>  oaKfbL= oaKfbLeaveMapper.ZyselectByType(oaKfbLeave);
		if(oaKfbL.size()!=0){
			return oaKfbL;
		}else{
			return null;
		}
	}


	@Override
	public List<OaKfbLeave> JlLeavelist(OaKfbLeave oaKfbLeave) {
		
		List<OaKfbLeave>  oaKfbL= oaKfbLeaveMapper.JlLeavelist(oaKfbLeave);
		if(oaKfbL.size()!=0){
			return oaKfbL;
		}else{
			return null;
		}
	
	}

	@Override
	public List<OaKfbGroup> selectxz(OaKfbLeave oaKfbLeave) {
		
		List<OaKfbGroup>  oaKfbG= oaKfbLeaveMapper.selectxz(oaKfbLeave);
		if(oaKfbG.size()!=0){
			return oaKfbG;
		}else{
			return null;
		}

	}

	@Override
	public OaKfbLeave Leavelist(OaKfbLeave oaKfbLeave) {
		if(oaKfbLeaveMapper.Leavelist(oaKfbLeave).size()!=0){
		return oaKfbLeaveMapper.Leavelist(oaKfbLeave).get(0);}
		return null;
	}	

	@Override
	public int selectCountByUid(Integer user_id) {
		// TODO Auto-generated method stub
		return oaKfbLeaveMapper.selectCountByUid(user_id);
	}

	@Override
	public List<OaKfbLeave> selectTimeByUid(Integer user_id) {
		// TODO Auto-generated method stub
		return oaKfbLeaveMapper.selectTimeByUid(user_id);
	}

	@Override
	public OaKfbUser selectByUid(Integer uid) {
		// TODO Auto-generated method stub
		return oaKfbUserMapper.selectByUid(uid);
	}

	
	
	
	
}
