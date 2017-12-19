package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaScbConsultstatusMapper;
import cn.tyyhoa.pojo.OaScbConsultstatus;
import cn.tyyhoa.service.OaScbConsultstatusService;
@Service("oaScbConsultstatusService")
public class OaScbConsultstatusServiceImpl implements OaScbConsultstatusService {
	@Autowired
	OaScbConsultstatusMapper oaScbConsultstatusMapper;
	@Override
	public List<OaScbConsultstatus> selectConsultstatusList() {
		return oaScbConsultstatusMapper.selectConsultstatusList();
	}

}
