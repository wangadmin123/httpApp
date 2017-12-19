package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybInterview;

public interface OaRlzybInterviewService {
	
	boolean insertSelective(OaRlzybInterview record);
	
	 List<OaRlzybInterview> selectAllPerson(
			 	String emp_name,
	    		Date interview_date,
	    		Integer startPos,
	    		Integer PageSize);
	    
	 List<OaRlzybInterview> selectAllEmpName(
	    		String emp_name,
	    		Date interview_date,
	    		Integer startPos,
	    		Integer PageSize);
	 
	 List<OaRlzybInterview> selectPerson(
	    		String emp_name,
	    		Date interview_date);
	    
	    List<OaRlzybInterview> selectEmpName(
	    		String emp_name,
	    		Date interview_date);
	    
	    
	    /*int selectCount(String interview_person,
				 String emp_name,
		    		Date interview_date);*/
	    
	    List<OaRlzybInterview> selectPersonByName(String emp_name);
	    
	    List<OaRlzybInterview> selectIdByName(String emp_name);
	    
	    OaRlzybInterview selectShowPerson(Integer interview_id);
	    
	    OaRlzybInterview selectShowEmpName(Integer interview_id);
	    
	    boolean updateDelete(Integer interview_id);
}
