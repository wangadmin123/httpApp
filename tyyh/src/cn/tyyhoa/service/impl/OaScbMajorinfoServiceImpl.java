package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.tyyhoa.dao.OaScbMajorinfoMapper;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.pojo.OaScbMajorinfo;
import cn.tyyhoa.service.OaScbEducationService;
import cn.tyyhoa.service.OaScbMajorinfoService;
@Service("oaScbMajorinfoService")
public class OaScbMajorinfoServiceImpl implements OaScbMajorinfoService {
	@Autowired
	OaScbMajorinfoMapper oaScbMajorinfoMapper;
	
	

	@Override
	public List<OaScbMajorinfo> selectMajorinfoList(int schoolId) {
		
		return oaScbMajorinfoMapper.selectMajorinfoList(schoolId);
	}



	@Override
	public int findSchoolid(int id) {
		
		return oaScbMajorinfoMapper.findSchoolid(id);
	}

}
