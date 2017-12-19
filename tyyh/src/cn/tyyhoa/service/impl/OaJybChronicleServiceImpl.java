package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJybChronicleMapper;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.service.OaJybChronicleService;



@Service("OaJybChronicleService")
public class OaJybChronicleServiceImpl implements OaJybChronicleService {
     @Autowired
     OaJybChronicleMapper oaJybChronicleMapper;
	
	
	public OaJybChronicleMapper getOaJybChronicleMapper() {
		return oaJybChronicleMapper;
	}


	public void setOaJybChronicleMapper(OaJybChronicleMapper oaJybChronicleMapper) {
		this.oaJybChronicleMapper = oaJybChronicleMapper;
	}


	@Override
	public List<OaJybChronicle> GetChrobicleById(int student_id) {
		// TODO Auto-generated method stub
		return oaJybChronicleMapper.GetChrobicleById(student_id);
	}


	@Override
	public int insertSelective(OaJybChronicle oaJybChronicle) {
		// TODO Auto-generated method stub
		return oaJybChronicleMapper.insertSelective(oaJybChronicle);
	}


	@Override
	public List<OaJybChronicle> GetChronicleByTime(Date event_time,int stuid) {
		// TODO Auto-generated method stub
		return oaJybChronicleMapper.GetChronicleByTime(event_time,stuid);
	}


	@Override
	public OaJybChronicle GetgradeStudent(int student_id) {
		// TODO Auto-generated method stub
		return oaJybChronicleMapper.GetgradeStudent(student_id);
	}
    
	

}
