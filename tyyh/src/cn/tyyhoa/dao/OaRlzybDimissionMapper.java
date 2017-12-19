package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybDimission;

public interface OaRlzybDimissionMapper {
    int deleteByPrimaryKey(Integer dimission_id);

    int insert(OaRlzybDimission record);

    int insertSelective(OaRlzybDimission record);

    OaRlzybDimission selectByPrimaryKey(Integer dimission_id);

    int updateByPrimaryKeySelective(OaRlzybDimission record);

    int updateByPrimaryKey(OaRlzybDimission record);
    
    
    List<OaRlzybDimission> selectAll(
    		@Param("emp_name") String emp_name,
    		@Param("dimission_date1") Date dimission_date1,
    		@Param("dimission_date2") Date dimission_date2,
    		@Param("startPos") Integer startPos,
    		@Param("PageSize") Integer PageSize);
    
    int selectCount(
    		@Param("emp_name") String emp_name,
    		@Param("dimission_date1") Date dimission_date1,
    		@Param("dimission_date2") Date dimission_date2);
    
    OaRlzybDimission selectShow(Integer dimission_id); 
    
    int updateDelete(@Param("dimission_id") Integer dimission_id);
}