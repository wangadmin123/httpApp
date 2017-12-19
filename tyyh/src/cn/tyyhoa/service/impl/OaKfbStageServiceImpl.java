package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaKfbStageMapper;
import cn.tyyhoa.pojo.OaKfbStage;
import cn.tyyhoa.service.OaKfbStageService;

@Service(value="OaKfbStageService")
public class OaKfbStageServiceImpl implements OaKfbStageService{

	@Autowired
	OaKfbStageMapper oaKfbStageMapper;
	
	@Override
	public List<OaKfbStage> selectByExample() {
		List<OaKfbStage> list=oaKfbStageMapper.selectByExample();
		if(list.size()!=0){
			return list;
		}
		return null;
	}

	@Override
	public OaKfbStage selectBygroup(Integer did) {
		if(oaKfbStageMapper.selectBygroup(did).size()!=0){
			OaKfbStage oaKfbStage=oaKfbStageMapper.selectBygroup(did).get(0);
			return oaKfbStage;
		}
		return null;
	}
	

}
