package cn.tyyhoa.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJybInterviewMapper;
import cn.tyyhoa.pojo.OaJybInterview;
import cn.tyyhoa.service.OaJybInterService;
@Service(value="OaJybInterService")
public class OaJybInterServiceImpl implements OaJybInterService{
     @Autowired
     OaJybInterviewMapper oaJybInterviewMapper;

	@Override
	public int updateByPrimaryKeySelective(OaJybInterview record) {
		// TODO Auto-generated method stub
		return oaJybInterviewMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int insertId(int mianshibiao_id) {
		// TODO Auto-generated method stub
		return oaJybInterviewMapper.insertId(mianshibiao_id);
	}

	@Override
	public int insertByPrimaryKeySelective(OaJybInterview record) {
		// TODO Auto-generated method stub
		return oaJybInterviewMapper.insertByPrimaryKeySelective(record);
	}
	

}
