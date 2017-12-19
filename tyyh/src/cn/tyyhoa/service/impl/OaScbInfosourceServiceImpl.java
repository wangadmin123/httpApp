package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaScbInfosourceMapper;
import cn.tyyhoa.pojo.OaScbInfosource;
import cn.tyyhoa.service.OaScbInfosourceService;
@Service("oaScbInfosourceService")
public class OaScbInfosourceServiceImpl implements OaScbInfosourceService{
	@Autowired
	OaScbInfosourceMapper oaScbInfosourceMapper;
	@Override
	public List<OaScbInfosource> selectInfoSource() {
		
		return oaScbInfosourceMapper.selectInfoSource();
	}

}
