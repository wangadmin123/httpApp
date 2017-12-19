package cn.tyyhoa.service;

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

public interface OaScbConsultTeacherService {
	
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
	    
	    //编辑查询
	    public OaScbConsulter findConsulter(int id);
	    
	    //插入回访记录
	    public int visitrecord(OaScbVisit oaScbVisit);
	    
	    //修改
	    public boolean updateConsulter(OaScbConsulter oaScbConsulter);
	    
	    //无效
	    public boolean invalidConsulter(String uselessCause,int id);
	    	   
	    //不再显示
	    public boolean displayConsulter(int id);
	    
	    //报审
	    public OaScbConsulter consultquerybaoshen(int id);
	    
	    public boolean enrollStatusConsulter(OaScbConsulter oaScbConsulter);
	    
	    public boolean StatusConsulter(OaScbConsulter oaScbConsulter);
	    
	    public OaScbConsulter findbaoshen(int id);
	    
	    //跟踪
	    public List<OaScbVisit>  queryvisit(Integer consultId);

	    public List<OaScbConsulter> consultqueryvisit(Map<String, Object> map);
	    
	    //查询缴费类型
	    public List<OaScbPaytype> selectpayType();
	    
	    //查询缴费状态
	    public List<OaScbPaystatus> selectpaystatus();
	    
	    //查询班主任
	    public List<OaRlzybEmployee> selectPosition();
	    
	    //批量
	    public int updatePosition(Map<String, Object> map);
	    //查询通过审核的
	    public List<OaScbConsulter> selectTeacherConsulter(Map<String, Object> map);
	    
	    
	    //记事
	  	public int insertRecord(OaScbRecord oaScbRecord);
	  	//最大id
	  	public int maxId();
	  //分量状态
	  	public Integer Update(Integer id);
}
