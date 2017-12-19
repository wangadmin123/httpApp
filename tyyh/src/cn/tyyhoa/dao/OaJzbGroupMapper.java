package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJzbGroup;
import cn.tyyhoa.pojo.OaJzbStudent;

public interface OaJzbGroupMapper {
	
	List<OaJzbGroup> selectOaJzbGroup(@Param("grade_id")int grade_id);
	
	int insertOaJzbGroup(OaJzbGroup oaJzbGroup);
	
	OaJzbGroup selectOaJzbGroupByGroupName(@Param("group_name")String group_name,@Param("grade_id")int grade_id);
	
	List<OaJzbStudent> getStudentsByGriade_ID(@Param("id")int id,@Param("sid") int sid);
}
