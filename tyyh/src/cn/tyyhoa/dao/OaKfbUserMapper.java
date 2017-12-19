package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaKfbUser;
import cn.tyyhoa.pojo.OaKfbUserExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface OaKfbUserMapper {
	
	/*根据id查询员工信息*/
    public  OaKfbUser selectUse(Integer id);

	
	//组长查看考勤列表
	public  List<OaKfbUser> selectAllkq(@Param("groupid") Integer groupid);
	
	//经理查看考勤列表
	public  List<OaKfbUser> selectjlAllkq(OaKfbUser oaKfbUser);
	
	//查看总分
	public  List<OaKfbUser> selectallscore(@Param("id") Integer id);

	 OaKfbUser selectByPrimaryKeyTest(String stu_id);
	
    long countByExample(OaKfbUserExample example);

    int deleteByExample(OaKfbUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(OaKfbUser record);

    int insertSelective(OaKfbUser record);

    List<OaKfbUser> selectByExample(OaKfbUserExample example);
       
    OaKfbUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") OaKfbUser record, @Param("example") OaKfbUserExample example);

    int updateByExample(@Param("record") OaKfbUser record, @Param("example") OaKfbUserExample example);

    int updateByPrimaryKeySelective(OaKfbUser record);

    int updateByPrimaryKey(OaKfbUser record);
    
    List<OaKfbUser> selectUserNoGroup (OaKfbUserExample example);
    
    int InsertUserFromStu(OaKfbUser record);
    
    List<OaKfbUser> selectByGroup (Integer groupid);
    
    int Remove(OaKfbUser record);

	public List<OaKfbUser> selectHistoryStu(Map<String, Object> paramMap);


	public List<OaKfbUser> selectAll(OaKfbUser oaKfbUser);


	public OaKfbUser selectByUid(Integer uid);


	public List<OaKfbUser> selectYgByUid(OaKfbUser oaKfbUser);
    
    
    
}