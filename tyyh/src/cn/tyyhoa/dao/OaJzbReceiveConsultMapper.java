package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaScbConsulter;

public interface OaJzbReceiveConsultMapper {

	//根据条件查询接收咨询量
	public List<OaScbConsulter> selectConsultNameAndSex(@Param("name")String name,@Param("sex")int sex,@Param("allotClassteacher")int allotClassteacher,@Param("currentPage")int currentPage,@Param("pageSize")int pageSize);
	//接收咨询量总数
	public int selectConsultNameAndSexCount(@Param("name")String name,@Param("sex")int sex,@Param("allotClassteacher")int allotClassteacher);
	//查询班级
	public List<OaJwbGrade> selectGrade(@Param("emp_id")int emp_id);
	//所有班级
	public List<OaJwbGrade> showGrade();
	//修改
	public int edit(@Param("gradeId")int gradeId,@Param("id")int id);
	//查询接收咨询量
	public List<OaScbConsulter> selectConsult();
	//根据班级Id获取名称
	public OaJwbGrade selectGradeId(@Param("gradeId")int gradeId);
	//查询学生个数
	public List<OaJzbStudent> studentCount(@Param("grade_Id")int gradeId);
	//批量插入
	public int addStudentPL(@Param("consulter_id")int consulter_id,@Param("stu_number")String stu_number,@Param("name")String name,@Param("age")int age,
				@Param("telphone1")String telphone1,@Param("ungenTelphone")String ungenTelphone,@Param("gradeId")int gradeId,@Param("entry_date")Date entry_date);
	//批量插入开班情况表
	public int addOpenClass(@Param("name")String name,@Param("sex")int sex,@Param("age")int age,@Param("study_experience")int study_experience,@Param("gradeId")int gradeId);
	//查询一条学生信息
	public List<OaScbConsulter> selectOne(@Param("id")int id);
}
