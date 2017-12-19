package cn.tyyhoa.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbStuInterviewMapper;
import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbInterviewtype;
import cn.tyyhoa.pojo.OaJzbStuInterview;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.service.OaJzbStuInterviewService;
@Service("stuInterview")
public class OaJzbStuInterviewServiceImpl implements OaJzbStuInterviewService{
	@Autowired
	OaJzbStuInterviewMapper stuInterviewMapper;
	@Override
	public List<OaJzbStuInterview> findSelect(int id) {
		
		return stuInterviewMapper.getSelect(id);
	}
	@Override
	public List<OaJzbStudent> findStuId(int stu_id) {
		return stuInterviewMapper.getStuId(stu_id);
	}
	@Override
	public List<OaJwbSemester> findSesmId(int stu_id) {
		return stuInterviewMapper.getSesmId(stu_id);
	}
	@Override
	public List<OaJzbInterviewtype> findInterviewId() {
		return stuInterviewMapper.getInterviewId();
	}
	@Override
	public boolean findAddStuInterview(OaJzbStuInterview stuInterview) {
		int row=stuInterviewMapper.addStuInterview(stuInterview);
		if(row!=0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public boolean findeditStuInterview(OaJzbStuInterview stuInterview) {
		int row=stuInterviewMapper.editStuInterview(stuInterview);
		if(row!=0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public List<OaJzbStuInterview> findInterview_empname() {
		// TODO Auto-generated method stub
		return stuInterviewMapper.Interview_empname();
	}
	@Override
	public int deleteInterview(int id) {
		// TODO Auto-generated method stub
		return stuInterviewMapper.deleteInterview(id);
	}
	@Override
	public List<OaJzbStuInterview> findInterview(int id) {
		// TODO Auto-generated method stub
		return stuInterviewMapper.getInterview(id);
	}
}
