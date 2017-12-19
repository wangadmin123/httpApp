package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJybActivityMapper;
import cn.tyyhoa.pojo.OaJybActivity;
import cn.tyyhoa.service.OaJybActiveService;
@Service("OaJybActiveService")
public class OaJybActiveServiceImpl implements OaJybActiveService {
	@Autowired
	OaJybActivityMapper oaJybActivityMapper;
	public OaJybActivityMapper getOaJybActivityMapper() {
		return oaJybActivityMapper;
	}
	public void setOaJybActivityMapper(OaJybActivityMapper oaJybActivityMapper) {
		this.oaJybActivityMapper = oaJybActivityMapper;
	}
	@Override
	public int insertSelective(OaJybActivity record) {
		// TODO Auto-generated method stub
		return oaJybActivityMapper.insertSelective(record);
	}
	@Override
	public List<OaJybActivity> GetAllActivity(int index,int pageSize) {
		// TODO Auto-generated method stub
		return oaJybActivityMapper.GetAllActivity((index-1)*pageSize, pageSize);
	}
	@Override
	public int AllCounts() {
		// TODO Auto-generated method stub
		return oaJybActivityMapper.AllCounts();
	}
	@Override
	public OaJybActivity selectByPrimaryKey(Integer activity_id) {
		// TODO Auto-generated method stub
		return oaJybActivityMapper.selectByPrimaryKey(activity_id);
	}

}
