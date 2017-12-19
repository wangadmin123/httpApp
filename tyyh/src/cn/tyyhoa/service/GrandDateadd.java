package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbGradedata;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaRlzybGrade;
import cn.tyyhoa.pojo.StudentDK;

public interface GrandDateadd{
	
	// 查询指定班级数据信息
	public List<OaJzbGradedata> selectgranddate(int grade_id);
	
	//跳转到添加班级数据
    public List<OaJzbStudent> toSelectGradeStu(int grade_id);
    
    //按时间和班级id查询
    public List<OaJzbGradedata> selectStuDataBytime(Date time,int grade_id);
    
    //按时间和学生id查询
    public OaJzbGradedata selectStuDataBytimeAndStudent_id(Date time,int student_id);

	// 按时间和班级id分页查询
	public List<OaJzbGradedata> selecttime(Date time,int grade_id,int currentPageNo,int pageSize);
	
	/*总记录*/
    public int getDataByTime(
    		Date time,
    		int grade_id
    		);

	// 添加班级数据
	public boolean insertGradedata(OaJzbGradedata insertGradedata);

	/*编辑班级数据*/
	public boolean updateGradeData(OaJzbGradedata insertGradedata);
	
	/*查询学生打卡信息*/
    public List<StudentDK> selListDK(String time,String id);
}


