package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaScbConsulter;

public interface OaJzbReceiveConsultService {

	//查询接收咨询量
	public List<OaScbConsulter> findselectConsultNameAndSex(String name,int sex,int allotClassteacher,int currentPage,int pageSize);
	//接收咨询量总数
	public int selectConsultNameAndSexCount(String name,int sex,int allotClassteacher);
	//查询班级
	public List<OaJwbGrade> findselectGrade(int emp_id);
	//所有班级
	public List<OaJwbGrade> findshowGrade();
	//修改
	public boolean findedit(int gradeId,int id);
	//查询接收咨询量
	public List<OaScbConsulter> findSelectConsult();
	//根据班级Id获取名称
	public OaJwbGrade findselectGradeId(int gradeId);
	//查询学生个数
	public List<OaJzbStudent> findstudentCount(int gradeId);
	//批量插入
	public boolean addStudentPL(int consulter_id,String stu_number,String name,int age,String telphone1,String ungenTelphone,int gradeId,Date entry_date);
	//批量插入开班情况表
	public boolean findaddOpenClass(String name,int sex,int age,int study_experience,int gradeId);
	//查询一条学生信息
	public List<OaScbConsulter> findselectOne(int id);
}
