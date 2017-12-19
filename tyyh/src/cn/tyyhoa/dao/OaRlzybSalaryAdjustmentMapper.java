package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybSalaryAdjustment;

public interface OaRlzybSalaryAdjustmentMapper {
    int deleteByPrimaryKey(Integer salary_adjustment_id);

    int insert(OaRlzybSalaryAdjustment record);

    int insertSelective(OaRlzybSalaryAdjustment record);

    OaRlzybSalaryAdjustment selectByPrimaryKey(Integer salary_adjustment_id);

    int updateByPrimaryKeySelective(OaRlzybSalaryAdjustment record);

    int updateByPrimaryKey(OaRlzybSalaryAdjustment record);
    
    
    
    
    
    
    List<OaRlzybSalaryAdjustment> selectAll(
    		@Param("emp_position")Integer position_id,
    		@Param("emp_name")String emp_name,
    		@Param("emp_department")Integer depart_id,
    		@Param("startPos")Integer startPos,
    		@Param("PageSize")Integer PageSize);
    
    int selectCount(
    		@Param("emp_position")Integer position_id,
    		@Param("emp_name")String emp_name,
    		@Param("emp_department")Integer depart_id);
    
    OaRlzybSalaryAdjustment selectShowById(@Param("salary_adjustment_id")Integer salary_adjustment_id);
    
    int updateDelete(@Param("salary_adjustment_id")Integer salary_adjustment_id);
    
}