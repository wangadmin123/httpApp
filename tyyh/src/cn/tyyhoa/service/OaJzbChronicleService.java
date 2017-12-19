package cn.tyyhoa.service;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJybChronicle;

public interface OaJzbChronicleService {
	
	public int insertSelective(OaJybChronicle oaJybChronicle);
	public int delectSelective(String zt,String time,Integer id);
	/* public int deletea(int student_id,Date event_time);*/
}
