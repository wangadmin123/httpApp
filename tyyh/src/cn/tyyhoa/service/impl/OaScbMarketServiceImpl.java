package cn.tyyhoa.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.tyyhoa.dao.OaScbMarketMapper;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbMajorinfo;
import cn.tyyhoa.pojo.OaScbMajorpersoninfo;
import cn.tyyhoa.pojo.OaScbMajorteacherinfo;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbSchoolinfo;
import cn.tyyhoa.pojo.OaScbVisit;
import cn.tyyhoa.service.OaScbMarketService;


@Service("oaScbMarketService")
public class OaScbMarketServiceImpl implements OaScbMarketService {
	@Autowired
	private OaScbMarketMapper oaScbMarketMapper;
	
	
	//市场部新增
	@Override
	public boolean addmarket(OaScbConsulter oaScbConsulter) {
		int row=oaScbMarketMapper.addmarket(oaScbConsulter);
		if(row==1){
			return true;
		}else{
			return false;
		}
		
	}
	//修改状态
	@Override
	public int update(int id) {
		
		return oaScbMarketMapper.update(id);
	}
	//市场部查询
	@Override
	public List<OaScbConsulter> getmarketInfo(Map<String, Object> map) {
		
		return oaScbMarketMapper.getmarketInfo(map);
	}
	
	
	
	//院校信息新增
	@Override
	public boolean addschoolInfo(OaScbSchoolinfo oaScbSchoolinfo) {
		
		int row=oaScbMarketMapper.addschoolInfo(oaScbSchoolinfo);
		if(row==1){
			return true;
		}else{
			return false;
		}
	}
	//专业信息新增
	@Override
	public boolean addmajorInfo(OaScbMajorinfo oaScbMajorinfo) {
		int row=oaScbMarketMapper.addmajorInfo(oaScbMajorinfo);
		if(row==1){
			return true;
		}else{
			return false;
		}
	}
	//院系负责人新增
	@Override
	public boolean addmajorpersonInfo(OaScbMajorpersoninfo oaScbMajorpersoninfo) {
		int row=oaScbMarketMapper.addmajorpersonInfo(oaScbMajorpersoninfo);
		if(row==1){
			return true;
		}else{
			return false;
		}
	}
	//班主任信息新增
	@Override
	public boolean addmajorteacherInfo(
			OaScbMajorteacherinfo oaScbMajorteacherinfo) {
		int row=oaScbMarketMapper.addmajorteacherInfo(oaScbMajorteacherinfo);
		if(row==1){
			return true;
		}else{
			return false;
		}
	}
	//修改院校信息
	@Override
	public int updateschoolInfo(String schoolTimePlan,String opptSituation, String schoolsSchedule,String pushingSchedule, String studentsSituation,int id) {
		
		return oaScbMarketMapper.updateschoolInfo(schoolTimePlan, opptSituation, schoolsSchedule, pushingSchedule, studentsSituation, id);
	}
	
	
	
	//院校信息查询 1
	@Override
	public List<OaScbSchoolinfo> getschoolInfo1(Map<String,Object> map) {
		
		return oaScbMarketMapper.getschoolInfo1(map);
	}
	//院校信息查询 2
	@Override
	public OaScbSchoolinfo getschoolInfo2(int id) {
			
		return oaScbMarketMapper.getschoolInfo2(id);
	}
	//专业信息查询
	@Override
	public List<OaScbMajorinfo> getmajorInfo(int schoolId) {
		
		return oaScbMarketMapper.getmajorInfo(schoolId);
	}
	//院校信息查询
	@Override
	public List<OaScbMajorpersoninfo> getmajorpersonInfo(
			int specialtId) {
		
		return oaScbMarketMapper.getmajorpersonInfo(specialtId);
	}
	//专业信息查询  
	@Override
	public List<OaScbMajorteacherinfo> getmajorteacherInfo(
			int specialtId) {
		
		return oaScbMarketMapper.getmajorteacherInfo(specialtId);
	}
	
	//学院名称查询
	/*@Override
	public OaScbSchoolinfo getSchoolName(OaScbSchoolinfo oaScbSchoolinfo) {
		
		return oaScbMarketMapper.getSchoolName(oaScbSchoolinfo);
	}*/
	//获取ID
	@Override
	public List<OaScbMajorinfo> selectSchoolMajor(int id) {
		
		return oaScbMarketMapper.selectSchoolMajor(id);
	}
	@Override
	public int selectschoolmaxid() {
		return oaScbMarketMapper.selectschoolmaxid();
	}
	//删除信息
	@Override
	public int deleteSchool(int schoolId) {
		return oaScbMarketMapper.deleteSchool(schoolId);
	}
	@Override
	public int deleteMajor(int schoolId) {
		return oaScbMarketMapper.deleteMajor(schoolId);
	}
	@Override
	public int deleteMajorPerson(int schoolId) {
		return oaScbMarketMapper.deleteMajorPerson(schoolId);
	}
	@Override
	public int deleteMajorTeacher(int schoolId) {
		return oaScbMarketMapper.deleteMajorTeacher(schoolId);
	}
	//院校名称查询
	/*@Override
	public List<OaScbSchoolinfo> getschoolName() {
		
		return oaScbMarketMapper.getschoolName();
	}*/
	//查询所有
	@Override
	public List<OaScbMajorinfo> getinfo() {
		
		return oaScbMarketMapper.getinfo();
	}
	@Override
	public OaScbMajorinfo getspeciaInfo(int id) {
		
		return oaScbMarketMapper.getspeciaInfo(id);
	}
	@Override
	public List<OaScbConsulter> query(Map<String, Object> map) {
	
		return oaScbMarketMapper.query(map);
	}
	//次数
	@Override
	public int getCount(OaScbConsulter oaScbConsulter) {
	
		return oaScbMarketMapper.getCount(oaScbConsulter);
	}

	@Override
	public int getschoolInfo1Count(OaScbSchoolinfo oaScbSchoolinfo) {
		
		return oaScbMarketMapper.getschoolInfo1Count(oaScbSchoolinfo);
	}
	
	@Override
	public int getHandallCount(OaScbConsulter oaScbConsulter) {
		
		return oaScbMarketMapper.getHandallCount(oaScbConsulter);
	}
	//批量
	@Override
	public int handallInfo(@Param("id") int[] id) {
		
		return oaScbMarketMapper.handallInfo(id);
	}
	//跟踪
	@Override
	public List<OaScbVisit> AssistantOaScbVisitFind(
			@Param("consultId") int consultId) {
		
		return oaScbMarketMapper.AssistantOaScbVisitFind(consultId);
	}
	//查询跟踪
	@Override
	public List<OaScbConsulter> Queryfollwing(Map<String, Object> map) {
		
		return oaScbMarketMapper.Queryfollwing(map);
	}
	//记事
	@Override
	public int insertRecord(OaScbRecord oaScbRecord) {
		
		return oaScbMarketMapper.insertRecord(oaScbRecord);
	}
	@Override
	public int maxId() {
		
		return oaScbMarketMapper.maxId();
	}
	@Override
	public OaScbSchoolinfo selectSchoolById(int id) {
		
		return oaScbMarketMapper.selectSchoolById(id);
	}
	@Override
	public List<OaScbMajorinfo> selectMajorBySchoolId(int schoolId) {
		
		return oaScbMarketMapper.selectMajorBySchoolId(schoolId);
	}
	@Override
	public Integer marketMajorXG(OaScbMajorinfo oaScbMajorinfo) {
		// TODO Auto-generated method stub
		return oaScbMarketMapper.marketMajorXG(oaScbMajorinfo);
	}
	@Override
	public List<OaScbSchoolinfo> getAll() {
		// TODO Auto-generated method stub
		return oaScbMarketMapper.getAll();
	}
	@Override
	public List<OaScbConsulter> getBySchoolName(String name, Integer pon, Integer size) {
		// TODO Auto-generated method stub
		return oaScbMarketMapper.getBySchoolName(name, pon, size);
	}
	@Override
	public Integer getschoolcount(String name) {
		// TODO Auto-generated method stub
		return oaScbMarketMapper.getschoolcount(name);
	}
	@Override
	public List<OaRlzybEmployee> getEmployee() {
		// TODO Auto-generated method stub
		return oaScbMarketMapper.getEmployee();
	}
	@Override
	public Integer ConsulterDelete(Integer id) {
		// TODO Auto-generated method stub
		return oaScbMarketMapper.ConsulterDelete(id);
	}

	@Override
	public int updateSchoolinfo(OaScbSchoolinfo oaSchoolinfo) {
		// TODO Auto-generated method stub
		return oaScbMarketMapper.updateSchoolinfo(oaSchoolinfo);
	}

	@Override
	public Integer majorinfoUpdate(OaScbMajorinfo OaScbMajorinfo) {
		// TODO Auto-generated method stub
		return oaScbMarketMapper.majorinfoUpdate(OaScbMajorinfo);
	}
	@Override
	public Integer majorpersoninfoUpdate(OaScbMajorpersoninfo OaScbMajorpersoninfo) {
		// TODO Auto-generated method stub
		return oaScbMarketMapper.majorpersoninfoUpdate(OaScbMajorpersoninfo);
	}

	@Override
	public Integer MajorteacherinfoUpdate(OaScbMajorteacherinfo OaScbMajorteacherinfo) {
		// TODO Auto-generated method stub
		return oaScbMarketMapper.MajorteacherinfoUpdate(OaScbMajorteacherinfo);
	}

	

}
