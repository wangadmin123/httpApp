package cn.tyyhoa.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJybCompany;
import cn.tyyhoa.pojo.OaJybEmployment;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaRlzybHatCity;
import cn.tyyhoa.pojo.OaRlzybHatProvince;

public interface OaJybEmploymentService {
	
	public  List<OaJzbStudent> selectDaiStu(Map m);
	
	public int count2(Map<String, Object> emp);
	public int selStuCount(Map o);
	
	public List<OaJzbStudent> daiCity();
	public List<OaJzbStudent> daibanji();
	public List<OaJzbStudent> daixueli();
	public List<OaJzbStudent> selectAllBiyeStu();
	
	
	public List<OaJybEmployment> selectOaJybEmployments(Map<String, Object> m);
	public List<OaJybEmployment> selectOaJybEmployments2(Map<String, Object> m);
	public List<OaJybEmployment> selectDaiEmp(Map m);
	public int selectOaJybEmploymentByCount(Map<String, Object> emp);
	public List<OaJzbStudent> selectDaiStu2(int id);
	public void StuStatus(int stuId);
	public void StuStatus2(int gradeId);
	public List<OaJwbGrade> empClass(int empTecid,int positionid);
	public  List<OaJybEmployment> selectCity();
	public  List<OaJybEmployment> selectCity1(String className);
	public  List<OaJybEmployment> selectRecord(String className);
	public  List<OaJybEmployment> selectClassName();
	public  List<OaJybEmployment> selectRecord2();
	public int selectEmpStatic(Map<String, Comparable> m);
	public  int selectEmpStatic2(Map<String, Comparable> m);
	
	public int empinsertSelective(OaJybEmployment record);
			
	public OaJybEmployment selectempbyterm(OaJybEmployment record);
	
	//获取城市
	public List<OaRlzybHatProvince> selectAllcity1();
	public List<OaRlzybHatCity> selectAllcity2(String ProvinceId);
	OaRlzybHatCity selectByCityPojoKey(String city);
	public List<OaJybCompany> GetAllComList();
	
	 public OaJybCompany GetByComLEnglist(Integer comid);
	/*  public OaJybCompany GetByComLEnglist2(String comName);*/
	 int updateByPrimaryKeySelective(OaJybEmployment record);
	 
		public int insertSelective(OaJybChronicle oaJybChronicle);

		public int insertId( int id);
		//查询单个的就业信息
	    public OaJybEmployment selectoneEmp(@Param("stuid") int stuid); 

}
