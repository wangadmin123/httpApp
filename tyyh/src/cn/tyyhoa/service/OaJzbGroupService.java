package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJzbGroup;
import cn.tyyhoa.pojo.OaJzbStudent;

public interface OaJzbGroupService {
	/**
	 * 根据班级id查询所在班级的小组名称
	 * @param grade_id
	 * @return
	 */
	List<OaJzbGroup> queryOaJzbGroup(int grade_id);
	/**
	 * 插入小组
	 * @param oaJzbGroup
	 * @return
	 */
	boolean addOaJzbGroup(OaJzbGroup oaJzbGroup);
	/**
	 * 根据小组名称查询小组信息
	 * @param group_name
	 * @return
	 */
	OaJzbGroup queryOaJzbGroupByGroupName(String group_name,int grade_id);
	
	/**
	 * 根据班级查询该班全部学生
	 * @param id
	 * @return
	 */
	List<OaJzbStudent> getStudentsByGriade_ID(int id, int sid);
}
