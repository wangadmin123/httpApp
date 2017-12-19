package cn.tyyhoa.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaScbAdvicesMapper;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbAdvices;
import cn.tyyhoa.service.OaScbAdvicesService;
import cn.tyyhoa.util.MessageUtil;
@Service("oaScbAdvicesService")
public class OaScbAdvicesServiceImpl implements OaScbAdvicesService {
	
	@Resource(name="oaScbAdvicesMapper")
	private OaScbAdvicesMapper osam;
	

	public OaScbAdvicesMapper getOsam() {
		return osam;
	}

	public void setOsam(OaScbAdvicesMapper osam) {
		this.osam = osam;
	}

	@Override
	public List<OaScbAdvices> getById(Integer id) {
		// TODO Auto-generated method stub
		return osam.getById(id);
	}

	@Override
	public Integer yidu(Integer id) {
		// TODO Auto-generated method stub
		return osam.yidu(id);
	}

	@Override
	public Integer del(Integer aid) {
		// TODO Auto-generated method stub
		return osam.del(aid);
	}

	@Override
	public Integer add(MessageUtil mu) {
		// TODO Auto-generated method stub
		return osam.add(mu);
	}

	@Override
	public List<OaRlzybUser> getByPnaem(String pname) {
		// TODO Auto-generated method stub
		return osam.getByPname(pname);
	}

	@Override
	public Integer weidu(Integer id) {
		// TODO Auto-generated method stub
		return osam.weidu(id);
	}

}
