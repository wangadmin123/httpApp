package cn.tyyhoa.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaScbConsultwayMapper;
import cn.tyyhoa.pojo.OaScbConsultway;
import cn.tyyhoa.service.OaScbConsultwayService;
@Service("oaScbConsultwayService")
public class OaScbConsultwayServiceImpl implements OaScbConsultwayService {
	@Autowired
	OaScbConsultwayMapper oaScbConsultwayMapper;
	@Override
	public List<OaScbConsultway> selectConsultWay() {
		
		return oaScbConsultwayMapper.selectConsultWay();
	}
	@Override
	public int addconsultway(OaScbConsultway oaScbConsultway) {
		
		return oaScbConsultwayMapper.addconsultway(oaScbConsultway);
	}
	@Override
	public int checkUnuseWay(int[] id) {
		
		return oaScbConsultwayMapper.checkUnuseWay(id);
	}
	@Override
	public int editWayName(OaScbConsultway oaScbConsultway) {
		
		return oaScbConsultwayMapper.editWayName(oaScbConsultway);
	}
	@Override
	public int moveUnuseWay(@Param("id") int[] id) {
		
		return oaScbConsultwayMapper.moveUnuseWay(id);
	}
	@Override
	public List<OaScbConsultway> selectConsultUnWay() {
		
		return oaScbConsultwayMapper.selectConsultUnWay();
	}
	
	
	

}
