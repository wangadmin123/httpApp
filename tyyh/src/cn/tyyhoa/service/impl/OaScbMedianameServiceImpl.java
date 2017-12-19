package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaScbMedianameMapper;
import cn.tyyhoa.pojo.OaScbMedianame;
import cn.tyyhoa.service.OaScbMedianameService;
@Service("oaScbMedianameService")
public class OaScbMedianameServiceImpl implements OaScbMedianameService {
	@Autowired
	OaScbMedianameMapper oaScbMedianameMapper;
	@Override
	public List<OaScbMedianame> selectMediaNameList() {
		
		return oaScbMedianameMapper.selectMediaNameList();
	}

}
