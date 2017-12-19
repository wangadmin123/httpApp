package cn.tyyhoa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybEmployee;

public interface OaRlzybEmployeeMapper {
    int deleteByPrimaryKey(Integer emp_id);

    int insert(OaRlzybEmployee record);

    int insertSelective(OaRlzybEmployee record);

    OaRlzybEmployee selectByPrimaryKey(Integer emp_id);

    
    int updateByPrimaryKeySelective(OaRlzybEmployee record);

    int updateByPrimaryKey(OaRlzybEmployee record);
    
    String selectByID(Integer emp_id);

    public Integer selectById(@Param("emp_name")String name);

/*人力资源部*/
 List<OaRlzybEmployee> selectHumanAffairsOaRlzybEmployee();//查询人力资源部的人事专员
    
    Integer selectMaxEmpId();   
    
 Integer updateByEmpIdCardSelective(OaRlzybEmployee record);
    
    int selectEmpIdByByEmpIdCard(OaRlzybEmployee record);
    
    int selectOaRlzybEmployeeCountByCondition(Map<String,Object> condition);
    
    List<OaRlzybEmployee> selectOaRlzybEmployeeByPage(Map<String,Object> condition);
    
    int selectOaRlzybEmployeeCountByEmpIdCard(@Param("emp_idcard") String empIdCard);
    
    List<OaRlzybEmployee> selectSomeOaRlzybEmployeeByfather(@Param("DepartId") Integer DepartId);
    
    int updateOaRlzybEmployeePhotoPathByEmpId(OaRlzybEmployee record);
    
    int deleteOaRlzybEmployeeByEmpId(@Param("emp_id") Integer emp_id);
    
    int selectOaRlzybEmployeeCountByPhoneNumber(@Param("emp_phone") String emp_phone);
    
    int selectOaRlzybEmployeeCountByEmailAddress(@Param("emp_Email") String emp_Email); 
    
    int realDeleteInformationBugOaRlzybEmployee();
    
    int updateOaRlzybEmployeeEmpNowStatusByEmpId(@Param("emp_id") Integer emp_id,@Param("emp_now_status") String emp_now_status);
    
    
   /* zl*/
    List<OaRlzybEmployee> selectByDepart(@Param("emp_department")Integer depart_id);
   /* List<OaRlzybEmployee> selectByDepart2(@Param("emp_department")Integer depart_id);*/
    
    List<OaRlzybEmployee> selectByEmpId(@Param("emp_id")Integer emp_id);
    
    List<OaRlzybEmployee> selectAllContract(@Param("emp_name")String emp_name,@Param("contract_id")Integer contract_id,@Param("contract_startDate")String contract_startDate,@Param("contract_endDate")String contract_endDate,@Param("contract_status")String contract_status,@Param("startPos")Integer startPos,@Param("PageSize")Integer PageSize);
    
    OaRlzybEmployee showInfo(@Param("emp_id")Integer emp_id);
    
    int updateByContractEndDate(OaRlzybEmployee record);
    
   int selectCount(@Param("emp_name")String emp_name,@Param("contract_id")Integer contract_id,@Param("contract_startDate")String contract_startDate,@Param("contract_endDate")String contract_endDate,@Param("contract_status")String contract_status);
  
   int updateByEmpId(OaRlzybEmployee record);
   
   List<OaRlzybEmployee> selectAll(@Param("emp_name")String emp_name);
   int updateStatus(OaRlzybEmployee record);
   
   
   
   
   
   List<OaRlzybEmployee> selectEmpNameByDepartId(@Param("emp_department")Integer emp_department);
   
   OaRlzybEmployee selectPositionByEmpName(@Param("emp_id")Integer emp_id);
   /* zl*/
   List<OaRlzybEmployee>  getEmpByDept(@Param("deptid") Integer deptid);
    /*人力资源部*/
}