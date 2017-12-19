package cn.tyyhoa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbInterviewtype;
import cn.tyyhoa.pojo.OaJzbStuInterview;
import cn.tyyhoa.pojo.OaJzbStudent;

public interface OaJzbStuInterviewService {
	//查询访谈学生列表
	public  List<OaJzbStuInterview> findSelect(int id);
	//查询一条访谈记录
	public List<OaJzbStuInterview> findInterview(int id);
	//查询学生ID
	public List<OaJzbStudent> findStuId(int stu_id);
	//查询学期ID
	public List<OaJwbSemester> findSesmId(int stu_id);
	//查询访谈类型
	public List<OaJzbInterviewtype> findInterviewId();
	//查询访谈人、录入时间
	public List<OaJzbStuInterview> findInterview_empname();
	//添加学生访谈
	public boolean findAddStuInterview(OaJzbStuInterview stuInterview);
	//修改数据
	public boolean findeditStuInterview(OaJzbStuInterview stuInterview);
	//删除
	public int deleteInterview(int id);
}
