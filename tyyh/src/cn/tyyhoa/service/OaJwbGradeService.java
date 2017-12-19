package cn.tyyhoa.service;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbCurriculum;
import cn.tyyhoa.pojo.OaJwbFuckClass;
import cn.tyyhoa.pojo.OaJwbFuckType;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJwbMotor;
import cn.tyyhoa.pojo.OaJwbStruts;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaRlzybEmployee;

public interface OaJwbGradeService {
	
	//查询产品
		public List<OaJzbSpecialty> selectSpecialty();
		
		//查询班主任
		public List<OaRlzybEmployee> selectClassTeacher();
		
		//查询教员
		public List<OaRlzybEmployee> selectTeacher();
		
		//查询就业专员
		public List<OaRlzybEmployee> selectObtain();
		
		
		//查询机房
		public List<OaJwbMotor> selectMotor();
		
	//添加
	public int insert(OaJwbGrade record);
	


	//查询状态
		public List<OaJwbStruts> selectStatus();
	/**
	 * 查询所有班级信息
	 * @return
	 */
	public List<OaJwbGrade> selectProject(int id,String name,int teacherID,int classTeacherID);
	
	/**
	    * 查询所有教员所带的班级信息
	    * @return
	    */
	   public List<OaJwbCurriculum> selectTeacherGrade(String selectDate,String lecturer);
	   
	   public List<OaJwbCurriculum>  selectclassTeacherGrade(String selectDate,String lecturer);
	   /**
	    * 修改班级根据ID
	    * @param OaJwbGrade
	    * @return
	    */
	   public int updateGrade(OaJwbGrade OaJwbGrade);
	   /**
	    * 修改班级状态根据ID
	    * @param OaJwbGrade
	    * @return
	    */
	   public int updateGradestatus(int id);
	   /**
	    * 根据姓名查询员工ID
	    * @param name
	    * @return
	    */
	   public Integer selectById(String name);
	   /**
	    * 代班信息表
	    * @param grade
	    * @param createTime
	    * @return
	    */
	   public List<OaJwbGrade> selectGrade(String nameHead,String name,String createTime);
	   public List<OaJwbGrade> selectGrade2(String nameHead,String name,String createTime);
	   /**
	    * 个人月考成绩表
	    * @return
	    */
	   public List<OaJwbGrade> selectMonthStudent(String name,String createTime);
	   /**
	    * 班级月考成绩表
	    * @return
	    */
	   public List<OaJwbGrade> selectScoreGrade(String name);
	   
	   /**
	    * 修改机房状态
	    * @param oaJwbMotor
	    * @return
	    */
	   public int updatemotor(int status,int id);
	   
	   /**
	    * 向学生记事插入数据
	    */
	   public int insertSelective(OaJybChronicle oaJybChronicle);
	 //就业部添加，查询班级状态
	   public int selectStrutsById( int id);
	   
	   
		/**
		 * 根据教员员工编号查看所带班级
		 */
		public List<OaJwbGrade> selectGradeByTeacherId(@Param("teacherID") int teacherID);
		/**
		 * 根据班级名字查询班级id
		 */
		public int selectGradeid(@Param("name") String name);
		/**
		 * 根据班级状态修改学生状态
		 */
		public int updateStusta(@Param("grade_id") int grade_id);
		/*添加排课记录*/
		public int insertFuckClass();
		/*修改排课记录*/
		public int updateFuckClass(Map<String,String> map);
		/*查询排课记录*/
		public List<OaJwbFuckClass> selFuckClass();
		/*查询排课类型*/
		public List<OaJwbFuckType> selFuckType();

}
