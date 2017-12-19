package cn.tyyhoa.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tyyhoa.dao.OaJzbStudentMapper;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbMembership;
import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaJzbStudentstatus;
import cn.tyyhoa.pojo.OaJzbWorkcondition;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.pojo.OaScbInfosource;
import cn.tyyhoa.pojo.OaScbPayfeesway;
import cn.tyyhoa.service.OaJzbStudentService;


/**
 * 学员档案
 * @author 曲行舟
 *
 */
@Service("oaJzbStudentService")
public class OaJzbStudentServiceImpl implements OaJzbStudentService{

	@Autowired
	OaJzbStudentMapper oaJzbStudentMapper;


	/*班级下拉列表*/
	public void setOaJzbStudentMapper(OaJzbStudentMapper oaJzbStudentMapper) {
		this.oaJzbStudentMapper = oaJzbStudentMapper;
	}


	/*班级下拉列表*/
	@Override
	public List<OaJwbGrade> gradeList(int classTeacherID) {
		return oaJzbStudentMapper.gradeList(classTeacherID);
	}


	/*学员状态下拉列表*/
	@Override
	public List<OaJzbStudentstatus> statusList() {
		return oaJzbStudentMapper.statusList();
	}

	 /*根据条件查询学员档案*/
	@Override
	public List<OaJzbStudent> stuList(int queryGrade, String searchName,
			int queryStatus,int classTeacherID,int currentPageNo,
			int pageSize) {
		return oaJzbStudentMapper.stuList(queryGrade, searchName, queryStatus,classTeacherID,(currentPageNo - 1)*pageSize,pageSize);
	}

	/*根据ID获取学员详细信息*/
	@Override
	public OaJzbStudent getStuInfo(int stu_Id) {
		return oaJzbStudentMapper.getStuInfo(stu_Id);
	}

	/*所学专业下拉列表*/
	@Override
	public List<OaJzbSpecialty> specialtyList() {
		return oaJzbStudentMapper.specialtyList();
	}

	/*学历下拉列表*/
	@Override
	public List<OaScbEducation> educations() {
		return oaJzbStudentMapper.educations();
	}

	/*信息来源*/
	@Override
	public List<OaScbInfosource> infoSources() {
		return oaJzbStudentMapper.infoSources();
	}

	 /*成员关系下拉列表*/
	@Override
	public List<OaJzbMembership> memberships() {
		return oaJzbStudentMapper.memberships();
	}

	/*添加学员档案*/
	@Override
	public boolean addStudent(OaJzbStudent oaJzbStudent) {
		int row = oaJzbStudentMapper.addStudent(oaJzbStudent);
		if(row == 1){
			return true;
		}else{
			return false;
		}
	}

	/*查询最后一个新插入的记录*/
	@Override
	public int getLastInsert() {
		return oaJzbStudentMapper.getLastInsert();
	}

	/*编辑学员档案*/
	@Override
	public boolean updateStuInfo(OaJzbStudent oaJzbStudent) {
		int row = oaJzbStudentMapper.updateStuInfo(oaJzbStudent);
		if(row == 1){
			return true;
		}else{
			return false;
		}
	}

	/*编辑添加的学员详细信息档案*/
	@Override
	public boolean modifyAdddetailedStuInfo(OaJzbStudent oaJzbStudent) {
		int row = oaJzbStudentMapper.modifyAdddetailedStuInfo(oaJzbStudent);
		if(row == 1){
			return true;
		}else{
			return false;
		}
	}

	
	/*编辑添加的学员成员信息档案*/
	@Override
	public boolean modifyAddMemberStuInfo(OaJzbStudent oaJzbStudent) {
		int row = oaJzbStudentMapper.modifyAddMemberStuInfo(oaJzbStudent);
		if(row == 1){
			return true;
		}else{
			return false;
		}
	}

	/*删除学员档案*/
	@Override
	public boolean deleteStuInfo(int stu_Id) {
		int row = oaJzbStudentMapper.deleteStuInfo(stu_Id);
		if(row == 1){
			return true;
		}else{
			return false;
		}
	}

	/*缴费方式*/
	@Override
	public List<OaScbPayfeesway> payfeesways() {
		return oaJzbStudentMapper.payfeesways();
	}


	/*工作状态*/
	@Override
	public List<OaJzbWorkcondition> workconditions() {
		return oaJzbStudentMapper.workconditions();
	}


	@Override
	public int getStuCount(int queryGrade, String searchName, int queryStatus,
			int classTeacherID) {
		return oaJzbStudentMapper.getStuCount(queryGrade, searchName, queryStatus, classTeacherID);
	}


	/*根据身份证号上传照片*/
	@Override
	public boolean updateStuPhoto(String photograph, String ID_number) {
		int row = oaJzbStudentMapper.updateStuPhoto(photograph, ID_number);
		if(row == 1){
			return true;
		}else{
			return false;
		}
	}


	@Override
	public String getStuPhoto(int stu_Id) {
		return oaJzbStudentMapper.getStuPhoto(stu_Id);
	}
	@Override
	public List<OaJzbStudent> getStudentByClassId(
			@Param("grade_id") int grade_id) {
		return oaJzbStudentMapper.getStudentByClassId(grade_id);
	}


	@Override
	public int updateWeiXin(String wx, String stu_id) {
		// TODO Auto-generated method stub
		return oaJzbStudentMapper.updateWeiXin(wx, stu_id);
	}
}
