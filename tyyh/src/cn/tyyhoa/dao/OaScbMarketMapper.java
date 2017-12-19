package cn.tyyhoa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbMajorinfo;
import cn.tyyhoa.pojo.OaScbMajorpersoninfo;
import cn.tyyhoa.pojo.OaScbMajorteacherinfo;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbSchoolinfo;
import cn.tyyhoa.pojo.OaScbVisit;

public interface OaScbMarketMapper {
	 //市场部新增
    public int addmarket(OaScbConsulter oaScbConsulter);
    //新增修改状态
    /*public int update(@Param("infoStatus") int infoStatus,@Param("id") int id);*/
    
    //市场部查询   
	public List<OaScbConsulter> getmarketInfo(Map<String, Object> map);
	//次数
	public int getCount(OaScbConsulter oaScbConsulter);
	//次数2
	/*public int getCount2(OaScbSchoolinfo oaScbSchoolinfo);*/
	
	public int getschoolInfo1Count(OaScbSchoolinfo oaScbSchoolinfo);
	//次数3
	public int getHandallCount(OaScbConsulter oaScbConsulter);
	//院校信息新增
	public int addschoolInfo(OaScbSchoolinfo oaScbSchoolinfo);
	
	//专业信息新增
	public int addmajorInfo(OaScbMajorinfo oaScbMajorinfo);
		
	//院系负责人新增
	public int addmajorpersonInfo(OaScbMajorpersoninfo oaScbMajorpersoninfo);
		
	//最新添加学院的id
	public int selectschoolmaxid();
	
	//班主任信息新增
	public int addmajorteacherInfo(OaScbMajorteacherinfo oaScbMajorteacherinfo);
	
	//院校信息修改
	public int updateschoolInfo(@Param("schoolTimePlan") String schoolTimePlan,@Param("opptSituation") String opptSituation,@Param("schoolsSchedule") String schoolsSchedule,@Param("pushingSchedule") String pushingSchedule,@Param("studentsSituation") String studentsSituation,@Param("id") int id);
	//院校专业列表查询
	public List<OaScbMajorinfo> selectSchoolMajor(@Param("schoolId") int id);
	
	public int deleteSchool(@Param("id") int schoolId );
	
	public int deleteMajor(@Param("schoolId") int schoolId );
	
	public int deleteMajorPerson(@Param("schoolId") int schoolId );
	
	public int deleteMajorTeacher(@Param("schoolId") int schoolId );
	
	
	
	
	//院校信息查询   1
	public List<OaScbSchoolinfo> getschoolInfo1(Map<String,Object> map);
	//院校信息查询   2
	public OaScbSchoolinfo getschoolInfo2(@Param("id") int id);
	//专业信息查询
	public List<OaScbMajorinfo> getmajorInfo(@Param("schoolId") int schoolId);
	//院校系主任查询   
	public List<OaScbMajorpersoninfo> getmajorpersonInfo(@Param("specialtId") int specialtId);
	//专业班主任查询
	public List<OaScbMajorteacherinfo> getmajorteacherInfo(@Param("specialtId") int specialtId);
	
	public OaScbMajorinfo getspeciaInfo(@Param("id") int id);
	
	
	//根据名字查询院校名称
	/*public OaScbSchoolinfo getSchoolName(OaScbSchoolinfo oaScbSchoolinfo);*/
	
	
	//查询所有信息
	public List<OaScbMajorinfo>getinfo();
	
	
	//查询未提交信息 
	public List<OaScbConsulter>query(Map<String, Object> map);
	//修改状态
	public int update(@Param("id") int id);
	//院校名称
	/*public List<OaScbSchoolinfo> getschoolName();*/
	//查询基本信息(提交量)
	public int handallInfo(@Param("id") int[] id);
	
	//查询跟踪
	public List<OaScbVisit>AssistantOaScbVisitFind(@Param("consultId") int consultId);
	
	//跟踪（查询）
	public List<OaScbConsulter> Queryfollwing(Map<String, Object> map);
	
	//记事
	public int insertRecord(OaScbRecord oaScbRecord);
	//最大id
	public int maxId();
	
	//根据id查找学校
	
	public OaScbSchoolinfo selectSchoolById(@Param("id") int id);
	
	
	public List<OaScbMajorinfo> selectMajorBySchoolId(@Param("schoolId") int schoolId);
	
	//修改专业信息
	public Integer marketMajorXG(OaScbMajorinfo oaScbMajorinfo);
	
	//查询全部学校
	List<OaScbSchoolinfo> getAll();
	
	List<OaScbConsulter> getBySchoolName(@Param("name")String name,@Param("pno")Integer pon,@Param("size")Integer size);
	
	Integer getschoolcount(@Param("name")String name);
	//查询市场渠道部的人
	List<OaRlzybEmployee> getEmployee();
	
	//渠道部删除
	Integer ConsulterDelete(@Param("id")Integer id);

	//修改院校信息
	public int updateSchoolinfo(OaScbSchoolinfo oaSchoolinfo);

	//修改专业
	Integer majorinfoUpdate(OaScbMajorinfo OaScbMajorinfo);
	//修改系主任
	Integer majorpersoninfoUpdate(OaScbMajorpersoninfo OaScbMajorpersoninfo);

	//修改班主任
	Integer MajorteacherinfoUpdate(OaScbMajorteacherinfo OaScbMajorteacherinfo);

}
