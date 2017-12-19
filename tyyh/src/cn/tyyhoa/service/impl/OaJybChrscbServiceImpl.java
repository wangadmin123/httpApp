package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJybChrscbMapper;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.service.OaJybChrscbService;
@Service("OaJybChrscbService")
public class OaJybChrscbServiceImpl implements OaJybChrscbService{
     @Autowired
     OaJybChrscbMapper oaJybChrscbMapper;
     
	public OaJybChrscbMapper getOaJybChrscbMapper() {
		return oaJybChrscbMapper;
	}

	public void setOaJybChrscbMapper(OaJybChrscbMapper oaJybChrscbMapper) {
		this.oaJybChrscbMapper = oaJybChrscbMapper;
	}

	@Override
	public List<OaScbRecord> GetChrscbById(int stu_id) {
		// TODO Auto-generated method stub
		return oaJybChrscbMapper.GetChrscbById(stu_id);
	}

	@Override
	public List<OaScbRecord> GetChrscbByTime(Date eventtime, int stu_id) {
		// TODO Auto-generated method stub
		return oaJybChrscbMapper.GetChrscbByTime(eventtime, stu_id);
	}

}
