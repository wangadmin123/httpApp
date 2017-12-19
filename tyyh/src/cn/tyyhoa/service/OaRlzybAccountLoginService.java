package cn.tyyhoa.service;

import java.util.List;

import cn.tyyhoa.pojo.OaRlzybAccountLogin;

public interface OaRlzybAccountLoginService {
	/**
	 * 记录登陆信息
	 * @param oarlzybaccountlogin
	 * @return
	 */
	public abstract int insert(OaRlzybAccountLogin oarlzybaccountlogin);
	/**
	 * 查询上次登陆信息
	 */
	public List<OaRlzybAccountLogin> lastLoginInfo(OaRlzybAccountLogin oarlzybaccountlogin);
}
