package cn.tyyhoa.service;

import java.util.List;

import cn.tyyhoa.pojo.OaJybActivity;

public interface OaJybActiveService {
	public int insertSelective(OaJybActivity record);
	public List<OaJybActivity> GetAllActivity(int index,int pageSize);
	public int AllCounts();
	public OaJybActivity selectByPrimaryKey(Integer activity_id);
}
