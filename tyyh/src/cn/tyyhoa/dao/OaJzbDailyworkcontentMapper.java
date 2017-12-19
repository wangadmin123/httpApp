package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJzbDailyschedule;
import cn.tyyhoa.pojo.OaJzbDailyworkcontent;
import cn.tyyhoa.pojo.OaRlzybEmployee;

public interface OaJzbDailyworkcontentMapper {
    
	List<OaJzbDailyworkcontent> getDailyWorkcontents(@Param("emp_id")int emp_id
				,@Param("pageindex")int pageindex,@Param("pagesize")int pagesize,@Param("bieTime")Date bieTime,@Param("outTime")Date outTime);
	
	/*查询教质部所有员工*/
	List<OaRlzybEmployee> getJzbEmp_names();
	
	int getCount(@Param("emp_id")int emp_id,@Param("bieTime")Date bieTime,@Param("outTime")Date outTime);
	
	OaJzbDailyworkcontent getDailyworkcontentById(@Param("Entrytime")Date Entrytime,@Param("teacher_id")int teacher_id);

	List<OaJzbDailyschedule> getDailyschedulsByteacher_id(@Param("Entrytime")Date Entrytime,@Param("teacher_id")int teacher_id);

	int UpdateDailyworkconte(@Param("TheContentOfThework")String TheContentOfThework,@Param("Morningwork")String Morningwork,
			@Param("Afternoonjobcontent")String Afternoonjobcontent,@Param("remarks")String remarks,@Param("Dailyworkcontent_id")int Dailyworkcontent_id);

	int UpdateDailschedul(@Param("Contentsoftheclass")String Contentsoftheclass,@Param("Dailyschedule_id")int Dailyschedule_id);

	int addDailyschedule(@Param("Starttime")Date Starttime,@Param("Outtime")Date Outtime,@Param("Entrytime")Date Entrytime,
						@Param("Contentsoftheclass")String Contentsoftheclass,@Param("classteacher_id")int classteacher_id);

	int addDailyworkconten(@Param("Entrytime")Date Entrytime,@Param("teacher_id")int teacher_id,@Param("TheContentOfThework")String TheContentOfThework
					,@Param("Morningwork")String Morningwork,@Param("Afternoonjobcontent")String Afternoonjobcontent,@Param("remarks")String remarks);
	
	int deleteDaily(@Param("Dailyworkcontent_id")int Dailyworkcontent_id);
	
	int deleteDilyworkcontent(@Param("Entrytime")Date Entrytime,@Param("classteacher_id")int classteacher_id);

	//以下为查询个人日报表
	List<OaJzbDailyworkcontent> getDailyWorkcontent(@Param("emp_id")int emp_id
			,@Param("pageindex")int pageindex,@Param("pagesize")int pagesize,@Param("bieTime")Date bieTime,@Param("outTime")Date outTime);

	int getCountDaily(@Param("emp_id")int emp_id,@Param("bieTime")Date bieTime,@Param("outTime")Date outTime);
}