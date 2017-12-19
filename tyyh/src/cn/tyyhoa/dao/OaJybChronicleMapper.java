package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJybChronicle;



public interface OaJybChronicleMapper {
  
	
	public int delectSelective(@Param("zt")String zt,@Param("time")String time,@Param("id")Integer id);
	public int insertSelective(OaJybChronicle oaJybChronicle);
	
	 public List<OaJybChronicle> GetChrobicleById(@Param("student_id") int student_id);
	  
	 public List<OaJybChronicle> GetChronicleByTime(@Param("event_time") Date event_time,@Param("student_id") int student_id);
	 
	public OaJybChronicle GetgradeStudent(@Param("student_id") int student_id);//得到班级，姓名
	  
}