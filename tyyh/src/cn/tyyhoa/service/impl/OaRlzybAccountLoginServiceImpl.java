package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaRlzybAccountLoginMapper;
import cn.tyyhoa.pojo.OaRlzybAccountLogin;
import cn.tyyhoa.service.OaRlzybAccountLoginService;


@Service("OaRlzybAccountLoginService")
public class OaRlzybAccountLoginServiceImpl implements OaRlzybAccountLoginService {
	
	
	
	@Autowired
	private OaRlzybAccountLoginMapper oaRlzybAccountLoginMapper;
	
	
	
	@Override
	public int insert(OaRlzybAccountLogin oarlzybaccountlogin) {
		// TODO Auto-generated method stub
		System.out.println("insert");
		return oaRlzybAccountLoginMapper.insert(oarlzybaccountlogin);
	}

	@Override
	public List<OaRlzybAccountLogin> lastLoginInfo(
			OaRlzybAccountLogin oarlzybaccountlogin) {
		// TODO Auto-generated method stub
		System.out.println("lastLoginInfo");
		return oaRlzybAccountLoginMapper.lastLoginInfo(oarlzybaccountlogin);
	}

}
