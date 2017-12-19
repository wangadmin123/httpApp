package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbInterview;
import cn.tyyhoa.pojo.OaJzbPatriarchInterview;

public interface OaJzbPatriarchInterviewService {

	 List<OaJzbPatriarchInterview> getJZFTSById(int stu_id);
	 
	 List<OaJzbInterview> getInterview();
	 
	  int addJZFT(String Interview_name,int Interview_id,int term,Date Interview_time,Date Entering_time,int Interview_way,
	    		String Interview_content,String remarks,int deleteStatus
	    		,int stu_id);
	  OaJzbPatriarchInterview getJZFTByID(int Id);
	  
	  int UpdateJZFT(String Interview_name,int Interview_way,String Interview_content,
	    		int id);
	  
	  int deleteJZFT(int id);
	  
	  OaJwbSemester getsemesterById(int stu_Id);
}
