package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaRlzybSalaryAdjustmentMapper;
import cn.tyyhoa.pojo.OaRlzybSalaryAdjustment;
import cn.tyyhoa.service.OaRlzybSalaryAdjustmentService;

@Service("oaRlzybSalaryAdjustmentService")
public class OaRlzybSalaryAdjustmentServiceImpl implements OaRlzybSalaryAdjustmentService {

	@Autowired
	OaRlzybSalaryAdjustmentMapper oaRlzybSalaryAdjustmentMapper;

	@Override
	public List<OaRlzybSalaryAdjustment> selectAll(Integer position_id,
			String emp_name, Integer depart_id, Integer startPos,
			Integer PageSize) {
		// TODO Auto-generated method stub
		return oaRlzybSalaryAdjustmentMapper.selectAll(position_id, emp_name, depart_id, startPos, PageSize);
	}

	@Override
	public int selectCount(Integer position_id, String emp_name,
			Integer depart_id) {
		// TODO Auto-generated method stub
		return oaRlzybSalaryAdjustmentMapper.selectCount(position_id, emp_name, depart_id);
	}

	@Override
	public boolean insertSelective(OaRlzybSalaryAdjustment record) {
		// TODO Auto-generated method stub
		int count = oaRlzybSalaryAdjustmentMapper.insertSelective(record);
		if(count > 0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public OaRlzybSalaryAdjustment selectShowById(Integer salary_adjustment_id) {
		// TODO Auto-generated method stub
		return oaRlzybSalaryAdjustmentMapper.selectShowById(salary_adjustment_id);
	}

	@Override
	public boolean updateDelete(Integer salary_adjustment_id) {
		int count = oaRlzybSalaryAdjustmentMapper.updateDelete(salary_adjustment_id);
		if(count > 0){
			return true;
		}else{
			return false;
		}
	}
	
	

}
