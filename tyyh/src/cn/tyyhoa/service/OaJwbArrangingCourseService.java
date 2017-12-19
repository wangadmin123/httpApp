package cn.tyyhoa.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbArrangingCourse;
import cn.tyyhoa.pojo.OaJwbGrade;


public interface OaJwbArrangingCourseService {
	public Integer addArrange(OaJwbArrangingCourse ojac);
	
	public Integer updateArrange(@Param("cid") Integer cid,@Param("course") Integer course);
	
	public Integer delArrange(@Param("cid") Integer cid);	
	
	public List<OaJwbArrangingCourse> getArrange(Map map);
	
	public List<OaJwbGrade>getUnArranging(@Param("pon") Integer pon,@Param("psize") Integer psize);
	
	public Integer getUnArrangingcount();
	
	public Integer getArrangecount(Map map);
}
