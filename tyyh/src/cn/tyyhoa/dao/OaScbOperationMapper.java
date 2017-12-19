package cn.tyyhoa.dao;



import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbOperation;

public interface OaScbOperationMapper {
	//添加操作记录
	Integer Insertoperation(OaScbOperation operation);
	//查询被操作人
	String Emp_id(OaRlzybEmployee OaRlzybEmployee);
	//查询咨询量
	String consulter_id(OaScbConsulter s);
	//查询操作记录
	List<OaScbOperation> SelectOperation(@Param("employee_id")String employee_id,
										@Param("currPageNo")Integer currPageNo,
										@Param("pageNo")Integer pageNo,
										@Param("Time")String Time,
										@Param("emp_name")String emp_name,@Param("consulter_name")String consulter_name);
	//查询记录条数
	Integer SelectOperationCount(@Param("employee_id")String employee_id,
			@Param("Time")String Time,
			@Param("emp_name")String emp_name,@Param("consulter_name")String consulter_name);
	//查询所有咨询师
	 List<OaRlzybEmployee> EmployeeList();
	 //删除相应的咨询记录
	 Integer operationDelete(@Param("emp_id")Integer emp_id);
	 //查询相应的咨询量
	 String operationSelect(@Param("consult_id")Integer consult_id);

}
