// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybEmployeeService.java

package cn.tyyhoa.service;

import cn.tyyhoa.pojo.OaRlzybEmployee;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybContract;
import cn.tyyhoa.pojo.OaRlzybDepartment;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybGrade;
import cn.tyyhoa.pojo.OaRlzybHatArea;
import cn.tyyhoa.pojo.OaRlzybHatCity;
import cn.tyyhoa.pojo.OaRlzybHatProvince;
import cn.tyyhoa.pojo.OaRlzybNative;
import cn.tyyhoa.pojo.OaRlzybNotice;
import cn.tyyhoa.pojo.OaRlzybNotifiedParty;
import cn.tyyhoa.pojo.OaRlzybPosition;
import cn.tyyhoa.pojo.OaRlzybTechnicalTitle;
import cn.tyyhoa.pojo.OaRlzybUser;

public interface OaRlzybEmployeeService
{

	public abstract OaRlzybEmployee selectByPrimaryKey(Integer integer);

	List<OaRlzybEmployee> selectByDepart(Integer depart_id);
	/*List<OaRlzybEmployee> selectByDepart2(Integer depart_id);*/
	
	List<OaRlzybEmployee> selectByEmpId(Integer emp_id);
	
	List<OaRlzybEmployee> selectAllContract(String emp_name,Integer contract_id,String contract_startDate,String contract_endDate,String contract_status,Integer startPos,Integer PageSize);
	
	OaRlzybEmployee showInfo(Integer emp_id);
	
	Boolean updateByContractEndDate(OaRlzybEmployee record);
	
	int selectCount(String emp_name,Integer contract_id,String contract_startDate,String contract_endDate,String contract_status);
	
	boolean updateByEmpId(OaRlzybEmployee record);
    
    List<OaRlzybEmployee> selectAll(String emp_name);
    
    boolean updateStatus(OaRlzybEmployee record);
    
    
    List<OaRlzybEmployee> selectEmpNameByDepartId(Integer emp_department);
    
    OaRlzybEmployee selectPositionByEmpName(Integer emp_id);
    
    
    
    
    
    
    
    
    public List<OaRlzybNative> getAllNations();
    public List<OaRlzybHatProvince> getAllProvinces();
    public List<OaRlzybHatCity> getAllCitys(String ProvinceId);
    public List<OaRlzybHatArea> getAllAreas(String CityId);
    public List<OaRlzybDepartment> getAllDepartments();
    public List<OaRlzybPosition> getAllPositions(Integer DepartmentId);
    public List<OaRlzybGrade> getAllGrades();
    public List<OaRlzybEmployee> getHumanAffairsOaRlzybEmployees();//获得人力资源部人事的雇员名单
    public int addEmpTechnicalTitlePath(OaRlzybTechnicalTitle oaRlzybTechnicalTitle);
    public int addEmployee(OaRlzybEmployee oaRlzybEmployee);
    public int modifyEmployee(OaRlzybEmployee oaRlzybEmployee);
    public Integer getMaxEmpId();
    public int modifyEmployeeByEmpIdCard(OaRlzybEmployee oaRlzybEmployee);
    public int getEmpIdByEmpIdCard(OaRlzybEmployee oaRlzybEmployee);
    public int addUser(OaRlzybUser OaRlzybUser);
    public int getEmployeeCountByCondition(Map<String,Object> condition);
    public List<OaRlzybEmployee> getOaRlzybEmployeeByPage(Map<String,Object> condition);
    public OaRlzybEmployee getOaRlzybEmployeeById(int emp_id);
    public int getOaRlzybUserCountByOaRlzybUser(OaRlzybUser oaRlzybUser);
    public int getOaRlzybEmployeeCountByEmpIdCard(String empIdCard );
    public List<OaRlzybTechnicalTitle>  getOaRlzybTechnicalTitleByEmpId(int emp_id);
    public int modifyOaRlzybEmployeePhotoPathByEmpId(OaRlzybEmployee oaRlzybEmployee);
    public int deleteOaRlzybEmployeeByEmpId(Integer emp_id);
    public     int getOaRlzybEmployeeCountByPhoneNumber(String emp_phone);
    public     int getOaRlzybEmployeeCountByEmailAddress(String emp_Email);
    public int realDeleteInformationBugOaRlzybEmployee();
    public int modifyUserPositionIdByUserName(OaRlzybUser oaRlzybUser);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   

    /*查询除自己外其他用户名*/
    public List<OaRlzybUser> selectUserByUid(Integer user_id);
    /*查询自己用户名*/
    public OaRlzybUser selectUserNameByUid(@Param("user_id") Integer user_id);


    /*插入通知信息*/
    public boolean addNotice(OaRlzybNotice record);
    /*收件人添加通知信息*/
    public boolean  addNotified_party(OaRlzybNotifiedParty record);

    /* 根据用户id查询已读通知信息 */
    public List<OaRlzybNotice> selectYdNoticeByUid( Integer user_id);

    /* 根据用户id查询未读通知信息 */
    public List<OaRlzybNotice> selectWdNoticeByUid( Integer user_id);
    /* 根据用户id查询通知信息 */
    public List<OaRlzybNotice> selectnotice(Integer status, Integer user_id);

    /*根据通知id查询通知详情*/
    public OaRlzybNotice selectXqNotice( Integer id,Integer user_id);

    /*根据通知id修改通知状态*/
    public int updateNoticeById(Integer npid);

    /*根据用户id查询未读通知记录数*/
    public int selectWdCountByUid(Integer user_id);
    
    
    
    
    
    
    
    public abstract List<OaRlzybEmployee> getEmpByDept(Integer deptid);

}
