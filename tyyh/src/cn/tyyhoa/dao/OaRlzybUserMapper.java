package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaRlzybUser;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OaRlzybUserMapper
{

	public abstract int deleteByPrimaryKey(Integer integer);

	public abstract int insert(OaRlzybUser user_id);

	public abstract int insertSelective(OaRlzybUser oarlzybuser);

	public abstract OaRlzybUser selectByPrimaryKey(Integer integer);

	public abstract int updateByPrimaryKeySelective(OaRlzybUser oarlzybuser);

	public abstract int updateByPrimaryKey(OaRlzybUser oarlzybuser);

	public abstract OaRlzybUser login(OaRlzybUser oarlzybuser);

	public abstract List<OaRlzybUser> selectByPositionid(Integer position_id);
	
	public int updataPwdByPrimaryKey(OaRlzybUser oarlzybuser);
	
	public abstract OaRlzybUser getEmpName(OaRlzybUser oarlzybuser);
	
	public abstract OaRlzybUser getStuName(OaRlzybUser oarlzybuser);
	
	public abstract int InsertUserFromStu();
	
	public abstract int deleteUserNotKfbStu();
	
	public abstract int recordlogincont(OaRlzybUser oarlzybuser);
	
	public abstract void updateUserJob32(String stuid);
	
	public abstract void updateUserJob33(String stuid);
	
	public abstract void updateUserJobnull(String stuid);
	
/*	人力资源部*/
int selectOaRlzybUserCountByOaRlzybUser(OaRlzybUser oaRlzybUser);
    
    int updatePositionByEmpId(OaRlzybUser record);
    
    int updateUserPositionIdByUserName(OaRlzybUser oaRlzybUser);
    
    
    
    
    public List<OaRlzybUser> selectUserByUid(@Param("user_id") Integer user_id);
    public OaRlzybUser selectUserNameByUid(@Param("user_id") Integer user_id);
    
    
    public int delStudentDuoyu();
	/*	人力资源部*/
}
