package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaKfbGroup;
import cn.tyyhoa.pojo.OaKfbLeave;
import cn.tyyhoa.pojo.OaKfbLeaveExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OaKfbLeaveMapper {
    long countByExample(OaKfbLeaveExample example);

    
    
  //查看姓名id
  	public  OaKfbLeave selectByleave(OaKfbLeave leve);
  	
  	//添加请假表
  	public int addleave(OaKfbLeave kfbLeave);
  	
  	//组长查看请假单
  	public List<OaKfbLeave> ZzselectByName(@Param("stuname")String stuname, @Param("groupid")Integer groupid);
  	
  	//组员查看个人请假单
  	public List<OaKfbLeave> ZyselectByType(OaKfbLeave oaKfbLeave);
  	
  	//查看请假详情
  	public List<OaKfbLeave> Leavelist(OaKfbLeave oaKfbLeave);
  	
  	//经理查看请假信息
  	public List<OaKfbLeave> JlLeavelist(OaKfbLeave oaKfbLeave);
  	
  	//小组查询
  	public List<OaKfbGroup> selectxz(OaKfbLeave oaKfbLeave);
    
    
    
     /**
      * 组员查询请假记录数
      * @param user_id
      * @return
      */
    public int selectCountByUid(@Param("user_id") Integer user_id);
    
    /**
     *  组员查询请假时间
     * @param user_id
     * @return
     */
    public List<OaKfbLeave> selectTimeByUid(@Param("user_id") Integer user_id);
    
    
    int deleteByExample(OaKfbLeaveExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(OaKfbLeave record);

    int insertSelective(OaKfbLeave record);

    List<OaKfbLeave> selectByExample(OaKfbLeaveExample example);

    OaKfbLeave selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") OaKfbLeave record, @Param("example") OaKfbLeaveExample example);

    int updateByExample(@Param("record") OaKfbLeave record, @Param("example") OaKfbLeaveExample example);

    int updateByPrimaryKeySelective(OaKfbLeave record);

    int updateByPrimaryKey(OaKfbLeave record);


}