package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybSalaryAdjustment;

public interface OaRlzybSalaryAdjustmentService {

	boolean insertSelective(OaRlzybSalaryAdjustment record);
	
	List<OaRlzybSalaryAdjustment> selectAll(
			Integer position_id,
    		String emp_name,
    		Integer depart_id,
    		Integer startPos,
    		Integer PageSize);
	
	int selectCount(
			Integer position_id,
    		String emp_name,
    		Integer depart_id);
	
	OaRlzybSalaryAdjustment selectShowById(Integer salary_adjustment_id);
	
	boolean updateDelete(Integer salary_adjustment_id);
}
