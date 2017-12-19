package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbGroupMapper;
import cn.tyyhoa.pojo.OaJzbGroup;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.service.OaJzbGroupService;
@Service("oaJzbGroupService")
public class OaJzbGroupServiceImpl implements OaJzbGroupService {
	
	@Autowired
	OaJzbGroupMapper groupMapper;
	
	@Override
	public List<OaJzbGroup> queryOaJzbGroup(int grade_id) {
		return groupMapper.selectOaJzbGroup(grade_id);
	}

	@Override
	public boolean addOaJzbGroup(OaJzbGroup oaJzbGroup) {
		int row=groupMapper.insertOaJzbGroup(oaJzbGroup);
		if (row==1) {
			return true;
		}else{
			return false;
		}
	}

	@Override
	public OaJzbGroup queryOaJzbGroupByGroupName(String group_name,int grade_id) {
		return groupMapper.selectOaJzbGroupByGroupName(group_name,grade_id);
	}

	@Override
	public List<OaJzbStudent> getStudentsByGriade_ID(int id, int sid) {
		// TODO Auto-generated method stub
		return groupMapper.getStudentsByGriade_ID(id,sid);
	}
}
