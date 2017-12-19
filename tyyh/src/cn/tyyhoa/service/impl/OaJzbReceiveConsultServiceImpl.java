package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbReceiveConsultMapper;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.service.OaJzbReceiveConsultService;
@Service("receiveConsult")
public class OaJzbReceiveConsultServiceImpl implements OaJzbReceiveConsultService{
	@Autowired
	OaJzbReceiveConsultMapper receiveConsultMapper;
	@Override
	public List<OaScbConsulter> findselectConsultNameAndSex(String name,int sex,int allotClassteacher,int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		return receiveConsultMapper.selectConsultNameAndSex(name,sex,allotClassteacher,(currentPage-1)*pageSize,pageSize);
	}
	@Override
	public int selectConsultNameAndSexCount(String name,int sex,int allotClassteacher) {
		// TODO Auto-generated method stub
		return receiveConsultMapper.selectConsultNameAndSexCount(name,sex,allotClassteacher);
	}
	@Override
	public List<OaScbConsulter> findSelectConsult() {
		// TODO Auto-generated method stub
		return receiveConsultMapper.selectConsult();
	}
	@Override
	public List<OaJwbGrade> findselectGrade(int emp_id) {
		// TODO Auto-generated method stub
		return receiveConsultMapper.selectGrade(emp_id);
	}
	@Override
	public boolean findedit(int gradeId,int id) {
		int row=receiveConsultMapper.edit(gradeId,id);
		if(row!=0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public OaJwbGrade findselectGradeId(int gradeId) {
		// TODO Auto-generated method stub
		return receiveConsultMapper.selectGradeId(gradeId);
	}
	@Override
	public List<OaJzbStudent> findstudentCount(int gradeId) {
		// TODO Auto-generated method stub
		return receiveConsultMapper.studentCount(gradeId);
	}
	@Override
	public boolean addStudentPL(int consulter_id,String stu_number,String name,int age,String telphone1,String ungenTelphone,int gradeId,Date entry_date) {
		int row=receiveConsultMapper.addStudentPL(consulter_id,stu_number,name,age,telphone1,ungenTelphone,gradeId,entry_date);
		if(row!=0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public List<OaScbConsulter> findselectOne(int id) {
		// TODO Auto-generated method stub
		return receiveConsultMapper.selectOne(id);
	}
	@Override
	public List<OaJwbGrade> findshowGrade() {
		// TODO Auto-generated method stub
		return receiveConsultMapper.showGrade();
	}
	@Override
	public boolean findaddOpenClass(String name, int sex, int age,int study_experience,int gradeId) {
		// TODO Auto-generated method stub
		int row=receiveConsultMapper.addOpenClass(name, sex, age,study_experience,gradeId);
		if(row!=0){
			return true;
		}else{
			return false;
		}
	}

}
