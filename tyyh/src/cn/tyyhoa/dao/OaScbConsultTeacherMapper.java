package cn.tyyhoa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbPaystatus;
import cn.tyyhoa.pojo.OaScbPaytype;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;

/**
 * 咨询师
 * @author lenovo
 *
 */
public interface OaScbConsultTeacherMapper {

	/*查询所有的咨询师*/
	public List<OaRlzybEmployee> ConsultTeacherFind();
	
	
	 //咨询师查询
    public List<OaScbConsulter> selectConsulter(Map<String, Object> map);
    //咨询师查询当天
    public List<OaScbConsulter> selectConsulterone(Map<String, Object> map);
    
    //咨询师查询三天内
    public List<OaScbConsulter> selectConsulterthree(Map<String, Object> map);
    //咨询师查询七天内
    public List<OaScbConsulter> selectConsultersave(Map<String, Object> map);
    //咨询师查询七天以上
    public List<OaScbConsulter> selectConsultersaveup(Map<String, Object> map);
    //查询记录总记录书
    public List<OaScbConsulter> selectConsulterCount(OaScbConsulter oaScbConsulter);
    
    public OaScbConsulter findConsulter(@Param("id") int id);
    
    //插入回访记录
    public int visitrecord(OaScbVisit oaScbVisit );
    
    //修改
    public int updateConsulter(OaScbConsulter oaScbConsulter);
    
    //无效
    public int invalidConsulter(@Param("uselessCause") String uselessCause,@Param("id") int id);
    
 
    //不再显示
    public int displayConsulter(@Param("id") int id);
    
    //报审
    public int enrollStatusConsulter(OaScbConsulter oaScbConsulter);
    
    public int StatusConsulter(OaScbConsulter oaScbConsulter);
    
    public OaScbConsulter findbaoshen(@Param("id") int id);
    
    //跟踪
    public List<OaScbVisit> queryvisit(@Param("consultId") Integer consultId);
    
    public List<OaScbConsulter> consultqueryvisit(Map<String, Object> map);
    
    public OaScbConsulter consultquerybaoshen(@Param("id") int id);
    
    //移交班主任
    public List<OaRlzybEmployee> selectPosition();
    
    //批量移交
    public int updatePosition(Map<String, Object> map);
    
    //查询缴费类型
    public List<OaScbPaytype> selectpayType();
    
    //查询缴费状态
    public List<OaScbPaystatus> selectpaystatus();
    
    //记事
  	public int insertRecord(OaScbRecord oaScbRecord);
  	
  	//最大id
  	public int maxId();
  	
  	//查询已通过审核
  	public List<OaScbConsulter> selectTeacherConsulter(Map<String, Object> map);
  	//分量状态
  	public Integer Update(@Param("id")Integer id);
    
  
}
