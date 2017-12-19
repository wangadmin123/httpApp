package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaClassTeacher;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJwbStruts;
import cn.tyyhoa.pojo.OaJzbClassplan;
import cn.tyyhoa.pojo.OaJzbGradedata;
import cn.tyyhoa.pojo.OaJzbTermstage;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaXsbWeek;

public interface OaJzbClassplanMapper {
	//根据ID查询带班计划
	List<OaJzbClassplan> getClassPlanById(@Param("id")int id);
	//新增带班计划
	int addClassplan(@Param("emp_id")int emp_id,@Param("question")String question,
			@Param("WORK")String WORK,@Param("grade_id")int grade_id,
			@Param("Stage_id")int Stage_id,@Param("coursecontent")String coursecontent,
			@Param("enteringTime")Date enteringTime);
	//修改带班计划
	int UpdateClassplan(@Param("question")String question,@Param("WORK")String WORK,@Param("Stage_id")int Stage_id,
			@Param("coursecontent")String coursecontent,@Param("Id")int Id);
	//删除带班计划
	int deteleClassplan(@Param("id")int id);
	
	//得到所有学期阶段
	List<OaJzbTermstage> gettermstages();
	
	int getClassPlanCount(@Param("grade_id")int grade_id);
	
	//得到周考成绩
	List<OaXsbWeek> getWeeksByGradeId(@Param("gradeID")int gradeID,@Param("stu_number")String stu_number,@Param("stu_name")String stu_name
			,@Param("pageindex")int pageindex,@Param("pagesize")int pagesize,@Param("whatweek")int whatweek);
	
	//得到总记录数
	int getCountWeek(@Param("gradeID")int gradeID,@Param("stu_number")String stu_number,@Param("stu_name")String stu_name
			,@Param("whatweek")int whatweek);
	
	//得到周
	List<OaXsbWeek> getWhatweek();
	
	//得到班主任
    List<OaRlzybEmployee> getClassTeacher();
    
    List<OaRlzybEmployee> getTeacher();
    
    List<OaRlzybEmployee> getCareerteacher();
    
    //以下是班级数据
    List<OaJwbGrade> getGrades(@Param("login_name")String login_name,@Param("emp_name")String emp_name
			,@Param("strutsId")int strutsId,@Param("emp_id")int emp_id);

OaJwbGrade getGradeByID(@Param("id") int id);

List<OaJwbStruts> getGradeStruts();

int getGradeCountById(@Param("grade_id")int grade_id);

public List<OaJwbGrade>grade();
//查询班级数据表
List<OaJzbGradedata> getGradedata(@Param("classId") Integer classId,@Param("time") Date time);
//查询班级老师
OaClassTeacher gettList(Integer classId);

}