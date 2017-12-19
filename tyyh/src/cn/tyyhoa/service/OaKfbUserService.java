package cn.tyyhoa.service;

import java.util.List;
import java.util.Map;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaKfbUser;

public interface OaKfbUserService {
	/*根据id查询员工信息*/
    public  OaKfbUser selectUse(Integer id);
	//组长查看考勤列表
	public  List<OaKfbUser> selectAllkq(Integer groupid);
	
	//经理查看考勤列表
	public  List<OaKfbUser> selectjlAllkq(OaKfbUser oaKfbUser);
	
	//查看总分
	public  OaKfbUser selectallscore(Integer id);

	/**
	 * 根据组长id查询小组员工信息
	 * @param uid
	 * @return
	 */

	List<OaKfbUser> selectUserNoGroup();

	List<OaKfbUser> getUserByGroup(Integer id);

	int insertuser();

	void UserUpdateGroup(Integer id, Integer groupid);

	void UserUpdateGroups(List<Integer> userids, Integer groupid);

	int remove(Integer id);

	void UserUpdateJob(OaKfbUser user);

	OaKfbUser selectUser(String id);
	
	List<OaJwbGrade> getgrade();
	
	List<OaKfbUser> getStuinfo(OaKfbUser oaKfbUser);
	
	List<OaKfbUser> gethistoryStu(Map<String, Object> paramMap);
	
	List<OaKfbUser> selectYgByUid(OaKfbUser oaKfbUser);
	
	public OaKfbUser selectByUid(Integer uid);
	



}
