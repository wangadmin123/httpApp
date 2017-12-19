package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;



import cn.tyyhoa.pojo.OaJybChronicle;






public interface OaJybChronicleService {
	
	  public int insertSelective(OaJybChronicle oaJybChronicle);
	  public List<OaJybChronicle> GetChrobicleById( int student_id);
	  public List<OaJybChronicle> GetChronicleByTime( Date event_time,int student_id);
	  public OaJybChronicle GetgradeStudent( int student_id);
	  

}
