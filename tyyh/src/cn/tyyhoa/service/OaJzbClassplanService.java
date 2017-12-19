package cn.tyyhoa.service;

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

public interface OaJzbClassplanService {
		
		//显示带班计划
	List<OaJzbClassplan> getClassPlansById(int id);
	
	int addClassplan(int emp_id,String question,String WORK,int grade_id,int Stage_id,String coursecontent,
			Date enteringTime);
	
	int UpdateClassplan(String question,String WORK,int Stage_id,String coursecontent,int Id);
	
	int deteleClassplan(int id);
	
	List<OaJzbTermstage> gettermstages();
	
	int getClassPlanCount(int grade_id);
	
	//得到周考成绩
		List<OaXsbWeek> getWeeksByGradeId(int gradeID,String stu_number,String stu_name
				,int pageindex,int pagesize,int whatweek);
		
    //得到总记录数
	int getCountWeek(int gradeID,String stu_number,String stu_name,int whatweek);
	
	List<OaXsbWeek> getWhatweek();
	
	List<OaRlzybEmployee> ShowClassTeacher();
	
	List<OaRlzybEmployee> ShowTeacher();
    
    List<OaRlzybEmployee> ShowCareerteacher();
    
    List<OaJwbGrade> getGrades(String login_name,String emp_name,int strutsId,int emp_id);
	 
	 OaJwbGrade ShowGradeByID(int id);
	 
	 List<OaJwbStruts> getGradeStruts();
	 
	 int getGradeCountById(int grade_id);
	 
	 public List<OaJwbGrade>grade();
	 
	 List<OaJzbGradedata> getGradedata(Integer classId,Date time);

	 OaClassTeacher gettList(Integer classId);
}
