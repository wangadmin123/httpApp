package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybDimission;

public interface OaRlzybDimissionService {
	
	List<OaRlzybDimission> selectAll(
    		String emp_name,
    		 Date dimission_date1,
    		 Date dimission_date2,
    		Integer startPos,
    		Integer PageSize);
    
    int selectCount(
    		String emp_name,
    		Date dimission_date1,
   		 Date dimission_date2);
    
    boolean insertSelective(OaRlzybDimission record);
    
    OaRlzybDimission selectShow(Integer dimission_id); 
    
    boolean updateDelete(Integer dimission_id);
}
