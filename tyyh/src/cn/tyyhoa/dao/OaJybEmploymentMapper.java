package cn.tyyhoa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJybEmployment;
import cn.tyyhoa.pojo.OaJzbStudent;

public interface OaJybEmploymentMapper {

	//查询待就业信息
	public  List<OaJzbStudent> selectDaiStu(Map m);	
	public int selStuCount(Map o);
	public List<OaJzbStudent> daiCity();
	public List<OaJzbStudent> selectAllBiyeStu();
	public List<OaJzbStudent> daibanji();
	public List<OaJzbStudent> daixueli();
	public List<OaJybEmployment> selectDaiEmp(Map m);
	public List<OaJzbStudent> selectDaiStu2(int id);
	public void StuStatus(int stuId);
	public void StuStatus2(int gradeId);
	
	
	//查询所有的就业信息
	public List<OaJybEmployment> selectOaJybEmployments(Map<String, Object> m);
	public List<OaJybEmployment> selectOaJybEmployments2(Map<String, Object> m);
	
	public List<OaJwbGrade> empClass(@Param("empTecid") int empTecid,@Param("positionid") int positionid);
	//查询就业总记录
	public int count(Map<String, Object> emp);
	public int count2(Map<String, Object> emp);

	//查询就业城市
	public  List<OaJybEmployment> selectCity();
	
	public  List<OaJybEmployment> selectRecord(@Param("className") String className);
	public  List<OaJybEmployment> selectRecord2();
	public  List<OaJybEmployment> selectClassName();
	//添加就业信息
	public int empinsertSelective(OaJybEmployment record);
	public  int selectEmpStatic2(Map<String, Comparable> m);
	//查询个人就业信息
	public OaJybEmployment selectempbyterm(OaJybEmployment record);
	//就业数据统计
	public  List<OaJybEmployment> selectCity1(@Param("className") String className);
	public int selectEmpStatic(Map<String, Comparable> m);
	
    int deleteByPrimaryKey(Integer employment_id);

    int insert(OaJybEmployment record);

    
    OaJybEmployment selectByPrimaryKey(Integer employment_id);
    
    int updateByPrimaryKeySelective(OaJybEmployment record);

    int updateByPrimaryKey(OaJybEmployment record);
    
    public int insertId(@Param("id") int id);
    
    
    //查询单个的就业信息
    public OaJybEmployment selectoneEmp(@Param("stuid") int stuid); 
}