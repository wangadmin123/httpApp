package cn.tyyhoa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbMembership;
import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaJzbStudentstatus;
import cn.tyyhoa.pojo.OaJzbWorkcondition;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.pojo.OaScbInfosource;
import cn.tyyhoa.pojo.OaScbPayfeesway;

public interface OaJzbStudentMapper {
    int deleteByPrimaryKey(Integer stu_Id);

    int insert(OaJzbStudent record);

    int insertSelective(OaJzbStudent record);

    OaJzbStudent selectByPrimaryKey(Integer stu_Id);

    int updateByPrimaryKeySelective(OaJzbStudent record);

    int updateByPrimaryKey(OaJzbStudent record);
    
    
  //----------------------------------------------------------------
    
    /*班级下拉列表*/
    public List<OaJwbGrade> gradeList(@Param("classTeacherID")int classTeacherID);
    
    /*学员状态下拉列表*/
    public List<OaJzbStudentstatus> statusList();
    
    /*根据条件查询学员档案*/
    public List<OaJzbStudent> stuList(@Param("queryGrade")int queryGrade,
    		@Param("searchName")String searchName,
    		@Param("queryStatus")int queryStatus,
    		@Param("classTeacherID")int classTeacherID,
    		@Param("index")int index,
    		@Param("pageSize")int pageSize
    		);
    
    /*总记录数*/
    public int getStuCount(@Param("queryGrade")int queryGrade,
    		@Param("searchName")String searchName,
    		@Param("queryStatus")int queryStatus,
    		@Param("classTeacherID")int classTeacherID);
    
    /*根据ID获取学员详细信息*/
    public OaJzbStudent getStuInfo(@Param("stu_Id")int stu_Id);
    
    /*所学专业下拉列表*/
    public List<OaJzbSpecialty> specialtyList();
    
    /*学历下拉列表*/
    public List<OaScbEducation> educations();
    
    /*信息来源*/
    public List<OaScbInfosource> infoSources();
    
    /*成员关系下拉列表*/
    public List<OaJzbMembership> memberships();
    
    /*添加学员档案*/
    public int addStudent(OaJzbStudent oaJzbStudent);
    
    /*查询最后一个新插入的记录*/
    public int getLastInsert(); 
    
    /*修改小程序绑定微信号*/
    public int updateWeiXin(@Param("wx")String wx,@Param("stuid")String stu_id);
    /*编辑学员档案*/
    public int updateStuInfo(OaJzbStudent oaJzbStudent);
    
    /*编辑（添加的）学员详细信息档案*/
    public int modifyAdddetailedStuInfo(OaJzbStudent oaJzbStudent);
    
    /*编辑（添加的）学员成员信息档案*/
    public int modifyAddMemberStuInfo(OaJzbStudent oaJzbStudent);
    
    /*删除学员档案*/
    public int deleteStuInfo(@Param("stu_Id")int stu_Id);
    
    /*缴费方式*/
    public List<OaScbPayfeesway> payfeesways();
    
    /*工作状态*/
    public List<OaJzbWorkcondition> workconditions();
    
    /*根据身份证号上传照片*/
    public int updateStuPhoto(@Param("photograph")String photograph,@Param("ID_number")String ID_number);
    
    /*根据学员id获取照片*/
    public String getStuPhoto(@Param("stu_Id")int stu_Id);
    
    /*开发部根据组长id查询小组员工信息*/
    public List<OaJzbStudent> selectYgByUid (OaJzbStudent oaJzbStudent);
    /*开发部根据组长id查询小组员工信息*/
    public OaJzbStudent selectByUid(Integer uid);
    
    
    
    /**
     * 开发部查看
     * @param stuID
     * @param stuName
     * @return
     */
	List<OaJzbStudent> selectAll(OaJzbStudent student);
    /**
     * 开发部查看历史
     * @param student
     * @param gradeid
     * @param groupid
     * @return
     */
	List<OaJzbStudent> selectHistoryStu(Map paramMap);
	
	//Mapper 接口

	/**
	 * 根据班级ID查询学生
	 * 
	 * @param class_id
	 * @return
	 */
	public List<OaJzbStudent> getStudentByClassId(@Param("grade_id") int grade_id);
	

	
    
}