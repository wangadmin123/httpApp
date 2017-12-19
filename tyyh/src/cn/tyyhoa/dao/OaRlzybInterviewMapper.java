package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybInterview;

public interface OaRlzybInterviewMapper {
    int deleteByPrimaryKey(Integer interview_id);

    int insert(OaRlzybInterview record);

    int insertSelective(OaRlzybInterview record);

    OaRlzybInterview selectByPrimaryKey(Integer interview_id);

    int updateByPrimaryKeySelective(OaRlzybInterview record);

    int updateByPrimaryKey(OaRlzybInterview record);
    
    /*zl*/
    
    List<OaRlzybInterview> selectAllPerson(
    		@Param("interview_person")String emp_name,
    		@Param("interview_date")Date interview_date,
    		@Param("startPos")Integer startPos,
    		@Param("PageSize")Integer PageSize);
    
    List<OaRlzybInterview> selectAllEmpName(
    		@Param("emp_name")String emp_name,
    		@Param("interview_date")Date interview_date,
    		@Param("startPos")Integer startPos,
    		@Param("PageSize")Integer PageSize);
    
    List<OaRlzybInterview> selectPerson(
    		@Param("interview_person")String emp_name,
    		@Param("interview_date")Date interview_date);
    
    List<OaRlzybInterview> selectEmpName(
    		@Param("emp_name")String emp_name,
    		@Param("interview_date")Date interview_date);
    
   /* int selectCount(@Param("interview_person")String interview_person,
    		@Param("emp_name")String emp_name,
    		@Param("interview_date")Date interview_date);*/
    
    List<OaRlzybInterview> selectPersonByName(@Param("emp_name")String emp_name);
    
    List<OaRlzybInterview> selectIdByName(@Param("emp_name")String emp_name);
    
    OaRlzybInterview selectShowPerson(@Param("interview_id")Integer interview_id);
    
    OaRlzybInterview selectShowEmpName(@Param("interview_id")Integer interview_id);
    
    int updateDelete(@Param("interview_id")Integer interview_id);
    /*zl*/
}