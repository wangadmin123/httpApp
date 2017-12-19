package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaScbEducationMapper;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.service.OaScbEducationService;
@Service("oaScbEducationService")
public class OaScbEducationServiceImpl implements OaScbEducationService {
	@Autowired
	OaScbEducationMapper oaScbEducationMapper;
	
	@Override
	public List<OaScbEducation> selectEducationList() {
		
		return oaScbEducationMapper.selectEducationList();
	}

}
