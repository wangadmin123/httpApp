package cn.tyyhoa.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaRlzybDepartmentMapper;
import cn.tyyhoa.dao.OaRlzybEmployeeMapper;
import cn.tyyhoa.dao.OaRlzybLeaveMapper;
import cn.tyyhoa.dao.OaRlzybLeaveTypeMapper;
import cn.tyyhoa.dao.OaRlzybPositionMapper;
import cn.tyyhoa.pojo.OaRlzybDepartment;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybLeave;
import cn.tyyhoa.pojo.OaRlzybLeaveType;
import cn.tyyhoa.pojo.OaRlzybPosition;
import cn.tyyhoa.service.OaRlzybLeaveService;

@Service("LeaveService")
public class OaRlzybLeaveServiceImpl implements OaRlzybLeaveService {

	@Autowired
	private OaRlzybDepartmentMapper oaRlzybDepartmentMapper;//部门
	@Autowired
	private OaRlzybEmployeeMapper oaRlzybEmployeeMapper;//员工
	@Autowired
	private OaRlzybPositionMapper oaRlzybPositionMapper;//岗位
	@Autowired
	private OaRlzybLeaveTypeMapper oaRlzybLeaveTypeMapper;//离岗类型表
	@Autowired
	private OaRlzybLeaveMapper oaRlzybLeaveMapper;//离岗表
	
	
	//得到部门的所有数据
	@Override
	public List<OaRlzybDepartment> getAllDepartments() {
		return oaRlzybDepartmentMapper.selectAllOaRlzybDepartment();
	}

	//得到对应部门的所有员工姓名数据
	@Override
	public List<OaRlzybEmployee> getAllEmployees(int DepartId) {
		return oaRlzybEmployeeMapper.selectSomeOaRlzybEmployeeByfather(DepartId);
	}

	//得到对应员工的所有岗位名称数据
	@Override
	public OaRlzybPosition getAllPositions(int EmpId) {
		return oaRlzybPositionMapper.selectSomeOaRlzybPositionByEmployeeName(EmpId);
	}

	
	
	@Override
	public int deleteByPrimaryKey(Integer leave_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(OaRlzybLeave record) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	//选择性的，①通过id插入离岗原因字段
	@Override
	public int insertSelective(OaRlzybLeave record) {
		return oaRlzybLeaveMapper.insertSelective(record);
	}

	
	//查询所有离岗信息
	@SuppressWarnings("unchecked")
	@Override
	public List<OaRlzybLeave> selectAllByPrimaryKey() {
		return (List<OaRlzybLeave>) oaRlzybLeaveMapper.selectAllByPrimaryKey();
	}

	@Override
	public int updateByPrimaryKeySelective(OaRlzybLeave record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(OaRlzybLeave record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public double totaldays(OaRlzybLeave record) {
		// TODO Auto-generated method stub
		return 0;
	}

	//查询所有离岗类型(填充离岗信息)
	@Override
	public List<OaRlzybLeaveType> getAllLeaveType() {
		return oaRlzybLeaveTypeMapper.selectAllOaRlzybLeaveType();	
	}

	//通过条件查询所有数据,查询数据的条数
	@Override
	public int selectOaRlzybLeaveCountByCondition(Map<String, Object> condition) {
		return oaRlzybLeaveMapper.selectOaRlzybLeaveCountByCondition(condition);
	}

	//通过分页查询所有数据,查询所有数据
	@Override
	public List<OaRlzybLeave> getOaRlzybLeaveByPage(
			Map<String, Object> condition) {
		return oaRlzybLeaveMapper.selectOaRlzybLeaveByPage(condition);
	}

	//查看页面
	@Override
	public OaRlzybLeave selectAllByleave_id(Integer leave_id) {
		return oaRlzybLeaveMapper.selectAllByleave_id(leave_id);
	}

	@Override
	public int deleteOaRlzybLeaveByLeaveId(Integer leave_id) {
		return oaRlzybLeaveMapper.deleteOaRlzybLeaveByLeaveId(leave_id);
	}

	@Override
	public int updateOaRlzybLeaveLeaveBackTimeByLeaveId(
			OaRlzybLeave oaRlzybLeave) {
		return oaRlzybLeaveMapper.updateOaRlzybLeaveLeaveBackTimeByLeaveId(oaRlzybLeave);
	}

	@Override
	public int updateOaRlzybEmployeeEmpNowStatusByEmpId(Integer emp_id,
			String emp_now_status) {
		return oaRlzybEmployeeMapper.updateOaRlzybEmployeeEmpNowStatusByEmpId(emp_id, emp_now_status);
	}



	
	
}
