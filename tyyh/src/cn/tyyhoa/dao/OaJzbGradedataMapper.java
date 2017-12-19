package cn.tyyhoa.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbGradedata;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.StudentDK;

public interface OaJzbGradedataMapper {
   
   
    //查询指定班级数据信息
    public List<OaJzbGradedata> selectgranddate(@Param("grade_id")int grade_id);
    
    //跳转到添加班级数据
    public List<OaJzbStudent> toSelectGradeStu(@Param("grade_id")int grade_id);
    
    //按时间和班级id查询
    public List<OaJzbGradedata> selectStuDataBytime(
    		@Param("time")Date time,
    		@Param("grade_id")int grade_id
    		);
    
  //按时间和学生id查询
    public OaJzbGradedata selectStuDataBytimeAndStudent_id(
    		@Param("time")Date time,
    		@Param("student_id")int student_id
    		);
    
    //按时间和班级id分页查询
    public List<OaJzbGradedata> selecttime(
    		@Param("time")Date time,
    		@Param("grade_id")int grade_id,
    		@Param("index")int index,
    		@Param("pageSize")int pageSize);
    /*查询学生打卡信息*/
    public List<StudentDK> selListDK(@Param("time")String time,@Param("gradeId")String id);
    /*总记录*/
    public int getDataByTime(
    		@Param("time")Date time,
    		@Param("grade_id")int grade_id
    		);
    
    //添加班级数据
   int insertGradedata(OaJzbGradedata insertGradedata);
   
   
   /*编辑班级数据*/
   public int updateGradeData(OaJzbGradedata oaJzbGradedata);
   
    
   
}