package cn.tyyhoa.service;

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

public interface OaScbMarketService {
		//市场部新增
		public boolean addmarket(OaScbConsulter oaScbConsulter);
		//修改状态
	    public int update(int id);
		
		//市场部查询
		public List<OaScbConsulter> getmarketInfo(Map<String, Object> map);
		//次数
		public int getCount(OaScbConsulter oaScbConsulter);
		
		//次数3
		public int getHandallCount(OaScbConsulter oaScbConsulter);
		
		public List<OaScbMajorinfo> selectSchoolMajor(int id);
		//最新添加院校的id
		public int selectschoolmaxid();
			
		//院校信息新增
		public boolean addschoolInfo(OaScbSchoolinfo oaScbSchoolinfo);
			
		//专业信息新增
		public boolean addmajorInfo(OaScbMajorinfo oaScbMajorinfo);
				
		//院系负责人新增
		public boolean addmajorpersonInfo(OaScbMajorpersoninfo oaScbMajorpersoninfo);
				
		//班主任信息新增
		public boolean addmajorteacherInfo(OaScbMajorteacherinfo oaScbMajorteacherinfo);
				
		//院校修改信息
		public int updateschoolInfo(String schoolTimePlan,String opptSituation, String schoolsSchedule,String pushingSchedule, String studentsSituation,int id);
		
		List<OaScbConsulter> getBySchoolName(@Param("name")String name,@Param("pno")Integer pon,@Param("size")Integer size);
		
		Integer getschoolcount(@Param("name")String name);
		//查询全部院校
		public List<OaScbSchoolinfo> getAll();
		
		//删除信息
		public int deleteSchool(int schoolId );
		
		//修改专业信息
		public Integer marketMajorXG(OaScbMajorinfo oaScbMajorinfo);
		
		public int deleteMajor(int schoolId );
		
		public int deleteMajorPerson(int schoolId );
		
		public int deleteMajorTeacher(int schoolId );
		//查询次数
		public int getschoolInfo1Count(OaScbSchoolinfo oaScbSchoolinfo);
		
		//院校信息查询  1 
		public List<OaScbSchoolinfo> getschoolInfo1(Map<String,Object> map);
		//院校信息查询   2
		public OaScbSchoolinfo getschoolInfo2(int id);
		//专业信息查询
		public List<OaScbMajorinfo> getmajorInfo(int schoolId);
		//系主任信息查询   
		public List<OaScbMajorpersoninfo> getmajorpersonInfo(int specialtId);
		//班主任信息查询
		public List<OaScbMajorteacherinfo> getmajorteacherInfo(int specialtId);
		
		public OaScbMajorinfo getspeciaInfo(int id);
		//院校名称查询
		/*public OaScbSchoolinfo getSchoolName(OaScbSchoolinfo oaScbSchoolinfo);*/
		
		//查询所有
		public List<OaScbMajorinfo>getinfo();
		//查询未提交信息 
		public List<OaScbConsulter>query(Map<String, Object> map);
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
		
		public OaScbSchoolinfo selectSchoolById(int id);
		
		public List<OaScbMajorinfo> selectMajorBySchoolId(int schoolId);
		//查询市场渠道部的人
		List<OaRlzybEmployee> getEmployee();
		//渠道部删除
		Integer ConsulterDelete(@Param("id")Integer id);

		//修改院校基本信息
		int updateSchoolinfo(OaScbSchoolinfo oaSchoolinfo);

		//修改专业
		Integer majorinfoUpdate(OaScbMajorinfo OaScbMajorinfo);
		//修改系主任
		Integer majorpersoninfoUpdate(OaScbMajorpersoninfo OaScbMajorpersoninfo);

		//修改班主任
		Integer MajorteacherinfoUpdate(OaScbMajorteacherinfo OaScbMajorteacherinfo);
}
