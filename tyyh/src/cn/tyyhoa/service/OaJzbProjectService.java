package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJzbGroup;
import cn.tyyhoa.pojo.OaJzbProject;

public interface OaJzbProjectService {

	int addGrupus(String group_name,int grade_id);
	
	int addProject(Integer Student_id,Integer group_id,Date entering_time,int stage_id);
	
	OaJzbGroup getGroupID();
	
	List<OaJzbProject> getProjdectsByGrade_id(Integer grade_id);
	
	OaJzbProject getProjectByID(int id);
	
	int updateProjectByID(double Score,double Group_score,String Group_expression,String remarks,int id);
	
	int deleteProjectById(int id);
}
