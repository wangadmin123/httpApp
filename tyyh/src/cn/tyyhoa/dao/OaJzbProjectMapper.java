package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJzbGroup;
import cn.tyyhoa.pojo.OaJzbProject;

public interface OaJzbProjectMapper {
	/**
	 * 根据班级ID给分组
	 */
	int addGrupus(@Param("group_name")String group_name,@Param("grade_id")int grade_id);
	
	int addProject(@Param("Student_id")Integer Student_id,@Param("group_id")Integer group_id,@Param("entering_time")Date entering_time,@Param("stage_id")int stage_id);
	
	OaJzbGroup getGroupID();
	
	List<OaJzbProject> getProjdectsByGrade_id(@Param("grade_id")Integer grade_id);

	OaJzbProject getProjectByID(@Param("id")int id);
	
	int updateProjectByID(@Param("Score")double Score,@Param("Group_score")double Group_score,
			@Param("Group_expression")String Group_expression,@Param("remarks")String remarks,@Param("id")int id);
	
	int deleteProjectById(@Param("id")int id);
}