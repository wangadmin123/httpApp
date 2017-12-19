package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.tyyhoa.dao.OaKfbGroupMapper;
import cn.tyyhoa.dao.OaKfbJobMapper;
import cn.tyyhoa.pojo.OaKfbGroup;
import cn.tyyhoa.service.OaKfb_GroupMapperService;

@Service(value="OaKfb_GroupMapperService")
public class OaKfb_GroupMapperServiceImpl implements OaKfb_GroupMapperService {

	
	
	@Autowired
	OaKfbGroupMapper oaKfb_GroupMapper;
	
	
	@Override
	public void updateGroup(OaKfbGroup group) {
		// TODO Auto-generated method stub
		oaKfb_GroupMapper.updateByPrimaryKeySelective(group);
	
	}
	
	
	@Override
	public List<OaKfbGroup> selectsxGroup() {
		// TODO Auto-generated method stub
		return oaKfb_GroupMapper.selectSxGroup(null);
	}
	

	@Override
	public OaKfbGroup selectnameByid(Integer id) {
		OaKfbGroup OaKfbGroup=oaKfb_GroupMapper.selectnameByid(id).get(0);
		if(OaKfbGroup!=null){
			return OaKfbGroup;
		}
		return null ;
	}

	@Override
	public void addgroup(OaKfbGroup group) {
		oaKfb_GroupMapper.insert(group);
	}
	
	@Override
	public OaKfbGroup selectGroupById(Integer id) {
		OaKfbGroup oaKfbGroup=oaKfb_GroupMapper.selectByPrimaryKey(id);
		if(oaKfbGroup!=null){
			return oaKfbGroup;
		}
		return null;
	}
	@Override
	public List<OaKfbGroup> selectByAll() {
		return oaKfb_GroupMapper.selectByAll();
	}                                    

	
	@Override
	public void deleteGroup(Integer groupid) {
		
		oaKfb_GroupMapper.deleteByPrimaryKey(groupid);
	}

	@Override
	public List<OaKfbGroup> selectsxedGroup(Integer gid) {
		// TODO Auto-generated method stub
		return oaKfb_GroupMapper.selectSxedGroup(gid);
	}

}
