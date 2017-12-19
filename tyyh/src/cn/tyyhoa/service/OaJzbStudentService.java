package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbMembership;
import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaJzbStudentstatus;
import cn.tyyhoa.pojo.OaJzbWorkcondition;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.pojo.OaScbInfosource;
import cn.tyyhoa.pojo.OaScbPayfeesway;

public interface OaJzbStudentService {
	/*班级下拉列表*/
    public List<OaJwbGrade> gradeList(int classTeacherID);
    /*学员状态下拉列表*/
    public List<OaJzbStudentstatus> statusList();
    /*根据条件查询学员档案*/
    public List<OaJzbStudent> stuList(int queryGrade,
    		String searchName,
    		int queryStatus,
    		int classTeacherID,
    		int currentPageNo,
			int pageSize);
    
    
    /*总记录数*/
    public int getStuCount(int queryGrade,
    		String searchName,
    		int queryStatus,
    		int classTeacherID);
    
    /*根据ID获取学员详细信息*/
    public OaJzbStudent getStuInfo(int stu_Id);
    
    /*所学专业下拉列表*/
    public List<OaJzbSpecialty> specialtyList();
    
    /*学历下拉列表*/
    public List<OaScbEducation> educations();
    
    /*信息来源*/
    public List<OaScbInfosource> infoSources();
    
    /*成员关系下拉列表*/
    public List<OaJzbMembership> memberships();
    
    /*添加学员档案*/
    public boolean addStudent(OaJzbStudent oaJzbStudent);
    
    /*查询最后一个新插入的记录*/
    public int getLastInsert();
    /*修改小程序绑定微信号*/
    public int updateWeiXin(String wx,String stu_id);
    /*编辑学员档案*/
    public boolean updateStuInfo(OaJzbStudent oaJzbStudent);
    
    /*编辑添加的学员详细信息档案*/
    public boolean modifyAdddetailedStuInfo(OaJzbStudent oaJzbStudent);
    
    /*编辑添加的学员成员信息档案*/
    public boolean modifyAddMemberStuInfo(OaJzbStudent oaJzbStudent);
    
    /*删除学员档案*/
    public boolean deleteStuInfo(int stu_Id);
    
    /*缴费方式*/
    public List<OaScbPayfeesway> payfeesways();
    
    /*工作状态*/
    public List<OaJzbWorkcondition> workconditions();
    
    /*根据身份证号上传照片*/
    public boolean updateStuPhoto(String photograph,String ID_number);
    
    /*根据学员id获取照片*/
    public String getStuPhoto(int stu_Id);
    /**
	 * 根据班级ID查询学生
	 * 
	 * @param class_id
	 * @return
	 */
	public List<OaJzbStudent> getStudentByClassId(@Param("grade_id") int grade_id);
}
