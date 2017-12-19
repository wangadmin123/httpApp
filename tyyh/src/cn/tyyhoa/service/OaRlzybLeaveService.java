package cn.tyyhoa.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybDepartment;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybLeave;
import cn.tyyhoa.pojo.OaRlzybLeaveType;
import cn.tyyhoa.pojo.OaRlzybPosition;

public interface OaRlzybLeaveService {
	
    public int deleteByPrimaryKey(Integer leave_id);

    public int insert(OaRlzybLeave record);

    //选择性的，①通过id插入离岗原因字段
    public int insertSelective(OaRlzybLeave record);

    //查询所有离岗信息
    public List<OaRlzybLeave> selectAllByPrimaryKey();

    public int updateByPrimaryKeySelective(OaRlzybLeave record);

    public int updateByPrimaryKey(OaRlzybLeave record);
    
    //合计天数
    public double totaldays(OaRlzybLeave record);
    
    //得到部门的所有数据
    public List<OaRlzybDepartment> getAllDepartments();
    
    //得到对应部门的所有员工姓名数据
    public List<OaRlzybEmployee> getAllEmployees(int DepartId);
    
    //得到对应员工的所有岗位名称数据
    public 	OaRlzybPosition getAllPositions(int EmpId);
    
    //查询所有离岗类型(填充离岗信息)
    public List<OaRlzybLeaveType> getAllLeaveType();
    
    //通过条件查询所有数据,查询数据的条数
    public int selectOaRlzybLeaveCountByCondition(Map<String,Object> condition);
    
    //通过分页查询所有数据,查询所有数据
    public List<OaRlzybLeave> getOaRlzybLeaveByPage(Map<String,Object> condition);

    //查看页面
    public OaRlzybLeave  selectAllByleave_id(Integer leave_id);
    
    
    public int deleteOaRlzybLeaveByLeaveId(Integer leave_id);
    
    
    public int updateOaRlzybLeaveLeaveBackTimeByLeaveId(OaRlzybLeave oaRlzybLeave);
    
    public  int updateOaRlzybEmployeeEmpNowStatusByEmpId(Integer emp_id,String emp_now_status);
}
