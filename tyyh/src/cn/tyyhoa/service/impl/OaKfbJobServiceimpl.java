package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaKfbJobMapper;
import cn.tyyhoa.pojo.OaKfbJob;
import cn.tyyhoa.service.OaKfbJobService;

@Service("OaKfbJobService")
public class OaKfbJobServiceimpl implements OaKfbJobService{
	@Autowired
	OaKfbJobMapper jobMapper;
	
	@Override
	public List<OaKfbJob> selectAllJob() {
		// TODO Auto-generated method stub
		return jobMapper.selectByExample(null);
	}

}
