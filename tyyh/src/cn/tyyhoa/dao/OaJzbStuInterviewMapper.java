package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbInterviewtype;
import cn.tyyhoa.pojo.OaJzbStuInterview;
import cn.tyyhoa.pojo.OaJzbStudent;

public interface OaJzbStuInterviewMapper {
	//查询学生信息跳转
	public List<OaJzbStuInterview> getSelect(@Param("stu_id")int id);
	//查询一条记录
	public List<OaJzbStuInterview> getInterview(@Param("id")int id);
	//查询学生ID
	public List<OaJzbStudent> getStuId(@Param("stu_id")int stu_id);
	//查询学期ID
	public List<OaJwbSemester> getSesmId(@Param("stu_id")int stu_id);
	//查询访谈类型
	public List<OaJzbInterviewtype> getInterviewId();
	//查看访谈人
	public List<OaJzbStuInterview> Interview_empname();
	//添加学生访谈
	public int addStuInterview(OaJzbStuInterview stuInterview);
	//修改数据
	public int editStuInterview(OaJzbStuInterview stuInterview);
	//删除
	public int deleteInterview(@Param("id")int id);
}