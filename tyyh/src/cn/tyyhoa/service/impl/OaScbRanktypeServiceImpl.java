package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaScbRanktypeMapper;
import cn.tyyhoa.pojo.OaScbRanktype;
import cn.tyyhoa.service.OaScbRanktypeService;
@Service("oaScbRanktypeService")
public class OaScbRanktypeServiceImpl implements OaScbRanktypeService {
	@Autowired
	OaScbRanktypeMapper oaScbRanktypeMapper;
	@Override
	public List<OaScbRanktype> selectRankList() {
		
		return oaScbRanktypeMapper.selectRankList();
	}

}
