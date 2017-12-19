package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaScbOperationMapper;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbOperation;
import cn.tyyhoa.service.OaScbOperationService;

@Service("OaScbOperationService")
public class OaScbOperationServiceImpl implements OaScbOperationService{
	
	@Autowired
	private OaScbOperationMapper OperationMapper;

	@Override
	public Integer Insertoperation(OaScbOperation operation) {
		// TODO Auto-generated method stub
		return OperationMapper.Insertoperation(operation);
	}

	@Override
	public String Emp_id(OaRlzybEmployee OaRlzybEmployee) {
		// TODO Auto-generated method stub
		return OperationMapper.Emp_id(OaRlzybEmployee);
	}

	@Override
	public String consulter_id(OaScbConsulter s) {
		// TODO Auto-generated method stub
		return OperationMapper.consulter_id(s);
	}

	@Override
	public List<OaScbOperation> SelectOperation(String employee_id, Integer currPageNo, Integer pageNo, String Time,String name,String consulter_name) {
		// TODO Auto-generated method stub
		return OperationMapper.SelectOperation(employee_id, currPageNo, pageNo, Time,name,consulter_name);
	}

	@Override
	public Integer SelectOperationCount(String employee_id, String Time,String name,String consulter_name) {
		// TODO Auto-generated method stub
		return OperationMapper.SelectOperationCount(employee_id, Time,name,consulter_name);
	}

	@Override
	public List<OaRlzybEmployee> EmployeeList() {
		// TODO Auto-generated method stub
		return OperationMapper.EmployeeList();
	}

	@Override
	public Integer operationDelete(Integer emp_id) {
		// TODO Auto-generated method stub
		return OperationMapper.operationDelete(emp_id);
	}

	@Override
	public String operationSelect(Integer consult_id) {
		// TODO Auto-generated method stub
		return OperationMapper.operationSelect(consult_id);
	}

	

	

	

	
	
	
	


}
