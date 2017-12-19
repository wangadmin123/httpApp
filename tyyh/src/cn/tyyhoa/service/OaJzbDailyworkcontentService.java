package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJzbDailyschedule;
import cn.tyyhoa.pojo.OaJzbDailyworkcontent;
import cn.tyyhoa.pojo.OaRlzybEmployee;

public interface OaJzbDailyworkcontentService {
	
	List<OaJzbDailyworkcontent> getDailyWorkcontents(int emp_id,int pageindex,int pagesize,Date bieTime,Date outTime);
	
	List<OaRlzybEmployee> getJzbEmp_names();
	
	int getCount(int emp_id,Date bieTime,Date outTime);
	
	OaJzbDailyworkcontent getDailyworkcontentById(Date Entrytime,int teacher_id);

	List<OaJzbDailyschedule> getDailyschedulsByteacher_id(Date Entrytime,int teacher_id);
	
	int UpdateDailyworkconte(String TheContentOfThework,String Morningwork,String Afternoonjobcontent,String remarks,int Dailyworkcontent_id);
	
	int UpdateDailschedul(String Contentsoftheclass,int Dailyschedule_id);

	int addDailyschedule(Date Starttime,Date Outtime,Date Entrytime,String Contentsoftheclass,int classteacher_id);

	int addDailyworkconten(Date Entrytime,int teacher_id,String TheContentOfThework,String Morningwork,String Afternoonjobcontent,String remarks);
	
	int deleteDaily(int Dailyworkcontent_id);
	
	int deleteDilyworkcontent(Date Entrytime,int classteacher_id);
	
	//以下为个人日报表列表
	
	List<OaJzbDailyworkcontent> getDailyWorkcontent(int emp_id,int pageindex,int pagesize,Date bieTime,Date outTime);

	int getCountDaily(int emp_id,Date bieTime,Date outTime);
}
