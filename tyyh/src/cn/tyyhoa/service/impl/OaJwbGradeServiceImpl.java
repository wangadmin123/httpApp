package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJwbGradeMapper;
import cn.tyyhoa.dao.OaRlzybEmployeeMapper;
import cn.tyyhoa.pojo.OaJwbCurriculum;
import cn.tyyhoa.pojo.OaJwbFuckClass;
import cn.tyyhoa.pojo.OaJwbFuckType;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJwbMotor;
import cn.tyyhoa.pojo.OaJwbStruts;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.service.OaJwbGradeService;
@SuppressWarnings("unused")
@Service("oaJwbGradeService")
public class OaJwbGradeServiceImpl implements OaJwbGradeService{
	@Autowired
	private OaJwbGradeMapper oaJwbGradeMapper ;
	@Autowired
	private OaRlzybEmployeeMapper OaRlzybEmployeeMapper;
	@Autowired
	private cn.tyyhoa.dao.OaJwbMotorMapper OaJwbMotorMapper;
	
	//添加
	public int insert(OaJwbGrade record) {

		return oaJwbGradeMapper.insert(record);
	}
	
	
	//查询产品
	@Override
	public List<OaJzbSpecialty> selectSpecialty() {
		// TODO 自动生成的方法存根
		return oaJwbGradeMapper.selectSpecialty();
	}
	
	//查询机房
	@Override
	public List<OaJwbMotor> selectMotor() {
		// TODO 自动生成的方法存根
		return oaJwbGradeMapper.selectMotor();
	}
	


	//查询状态
		public List<OaJwbStruts> selectStatus(){
			return oaJwbGradeMapper.selectStatus();
				
		}

	//查询班主任
	@Override
	public List<OaRlzybEmployee> selectClassTeacher() {
		// TODO 自动生成的方法存根
		return oaJwbGradeMapper.selectClassTeacher();
	}

	//查询教员
	@Override
	public List<OaRlzybEmployee> selectTeacher() {
		// TODO 自动生成的方法存根
		return oaJwbGradeMapper.selectTeacher();
	}

	//查询就业老师
	@Override
	public List<OaRlzybEmployee> selectObtain() {
		// TODO 自动生成的方法存根
		return oaJwbGradeMapper.selectObtain();
	}


	@Override
	public List<OaJwbGrade> selectProject(int id,String name,int teacherID,int classTeacherID) {
		List<OaJwbGrade> list=oaJwbGradeMapper.selectProject(id,name, teacherID, classTeacherID);
		return list;
	}


	@Override
	public List<OaJwbCurriculum> selectTeacherGrade(String selectDate,String lecturer) {
		
		return oaJwbGradeMapper.selectTeacherGrade(selectDate, lecturer);
	}


	@Override
	public List<OaJwbCurriculum> selectclassTeacherGrade(String selectDate,String lecturer) {
		return oaJwbGradeMapper.selectclassTeacherGrade(selectDate, lecturer);
	}


	@Override
	public int updateGrade(OaJwbGrade OaJwbGrade) {
		int row=oaJwbGradeMapper.updateGrade(OaJwbGrade);
		return row;
	}


	@Override
	public Integer selectById(String name) {
		int id=OaRlzybEmployeeMapper.selectById(name);
		return id;
	}


	@Override
	public List<OaJwbGrade> selectGrade(String nameHead,String name, String createTime) {
		return oaJwbGradeMapper.selectGrade(nameHead,name, createTime);
	}


	@Override
	public int updateGradestatus(int id) {
		return oaJwbGradeMapper.updateGradestatus(id);
	}


	@Override
	public List<OaJwbGrade> selectMonthStudent(String name, String createTime) {
		List<OaJwbGrade> list=oaJwbGradeMapper.selectMonthStudent(name, createTime);
		if(list !=null){
			return list;
		}else{
			return null;
		}
		
	}


	@Override
	public List<OaJwbGrade> selectScoreGrade(String name) {
		return oaJwbGradeMapper.selectScoreGrade(name);
	}


	@Override
	public int updatemotor(int status,int id) {
		
		return OaJwbMotorMapper.updatemotor(status, id);
	}


	@Override
	public int insertSelective(OaJybChronicle oaJybChronicle) {
		return oaJwbGradeMapper.insertSelective(oaJybChronicle);
	}


	@Override
	public int selectStrutsById(int id) {
		// TODO 自动生成的方法存根
		return oaJwbGradeMapper.selectStrutsById(id);
	}


	@Override
	public List<OaJwbGrade> selectGradeByTeacherId(
			@Param("teacherID") int teacherID) {
		return oaJwbGradeMapper.selectGradeByTeacherId(teacherID);
	}


	@Override
	public int selectGradeid(String name) {
		// TODO Auto-generated method stub
		return oaJwbGradeMapper.selectGradeid(name);
	}


	@Override
	public int updateStusta(int grade_id) {
		// TODO Auto-generated method stub
		return oaJwbGradeMapper.updateStusta(grade_id);
	}


	@Override
	public List<OaJwbGrade> selectGrade2(String nameHead, String name, String createTime) {
		// TODO Auto-generated method stub
		return oaJwbGradeMapper.selectGrade2(nameHead, name, createTime);
	}


	@Override
	public int insertFuckClass() {
		// TODO Auto-generated method stub
		return oaJwbGradeMapper.insertFuckClass();
	}


	@Override
	public int updateFuckClass(Map<String, String> map) {
		// TODO Auto-generated method stub
		return oaJwbGradeMapper.updateFuckClass(map);
	}


	@Override
	public List<OaJwbFuckClass> selFuckClass() {
		// TODO Auto-generated method stub
		return oaJwbGradeMapper.selFuckClass();
	}


	@Override
	public List<OaJwbFuckType> selFuckType() {
		// TODO Auto-generated method stub
		return oaJwbGradeMapper.selFuckType();
	}
	
}
