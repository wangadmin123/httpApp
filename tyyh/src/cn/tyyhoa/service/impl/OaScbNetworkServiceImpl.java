package cn.tyyhoa.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.tyyhoa.dao.OaScbNetworkMapper;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;
import cn.tyyhoa.service.OaScbNetworkService;

@Service("oaScbNetworkService")
public class OaScbNetworkServiceImpl implements OaScbNetworkService {
	@Autowired
	OaScbNetworkMapper oaScbnetworkMapper;
	//新增
	public int networkAdd(OaScbConsulter oaScbConsulter) {
		
		return oaScbnetworkMapper.networkAdd(oaScbConsulter);
	}
	//查询
	@Override
	public List<OaScbConsulter> NetworkQuery(Map<String, Object> map) {
		
		return oaScbnetworkMapper.NetworkQuery(map);
	}
	//查询总记录数
	@Override
	public int getNetworkcount(OaScbConsulter oaScbConsulter) {
		
		return oaScbnetworkMapper.getNetworkcount(oaScbConsulter);
	}
	
	
	//查询学生详情
	@Override
	public OaScbConsulter selectOne(int id) {
		
		return oaScbnetworkMapper.selectOne(id);
	}
	//查询基本信息
	@Override
	public List<OaScbConsulter> selectstudentInfo(Map<String, Object> map) {
		
		return oaScbnetworkMapper.selectstudentInfo(map);
	}
	//查询基本信息(提交)
	@Override
	public int editConInfoStatus(int id) {

		return oaScbnetworkMapper.editConInfoStatus(id);
	}
	//查询基本信息总记录数
	@Override
	public int selectInfoCount(OaScbConsulter oaScbConsulter) {
		
		return oaScbnetworkMapper.selectInfoCount(oaScbConsulter);
	}
	//提交量
		@Override
		public int handallInfo(int[] id) {
			return oaScbnetworkMapper.handallInfo(id);
		}
	//跟踪
	@Override
	public List<OaScbVisit> networkVisitFind(int consultId) {
		
		return oaScbnetworkMapper.networkVisitFind(consultId);
	}
	
	
	@Override
	public List<OaScbConsulter> NetworkQueryfollwing(Map<String, Object> map) {
		
		return oaScbnetworkMapper.NetworkQueryfollwing(map);
	}
	//记事
	@Override
	public int insertRecord(OaScbRecord oaScbRecord) {
		
		return oaScbnetworkMapper.insertRecord(oaScbRecord);
	}
	//最大ID
	@Override
	public int maxId() {
		
		return oaScbnetworkMapper.maxId();
	}

}
