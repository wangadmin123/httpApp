package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaRlzybInterviewMapper;
import cn.tyyhoa.pojo.OaRlzybInterview;
import cn.tyyhoa.service.OaRlzybInterviewService;

@Service("oaRlzybInterviewService")
public class OaRlzybInterviewServiceImpl implements OaRlzybInterviewService {

	@Autowired
	OaRlzybInterviewMapper oaRlzybInterviewMapper;


	@Override
	public List<OaRlzybInterview> selectIdByName(String emp_name) {
		// TODO Auto-generated method stub
		return oaRlzybInterviewMapper.selectIdByName(emp_name);
	}

	@Override
	public List<OaRlzybInterview> selectPersonByName(String emp_name) {
		// TODO Auto-generated method stub
		return oaRlzybInterviewMapper.selectPersonByName(emp_name);
	}

	@Override
	public boolean insertSelective(OaRlzybInterview record) {
		// TODO Auto-generated method stub
		int count = oaRlzybInterviewMapper.insertSelective(record);
		if(count > 0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public OaRlzybInterview selectShowPerson(Integer interview_id) {
		// TODO Auto-generated method stub
		return oaRlzybInterviewMapper.selectShowPerson(interview_id);
	}

	@Override
	public OaRlzybInterview selectShowEmpName(Integer interview_id) {
		// TODO Auto-generated method stub
		return oaRlzybInterviewMapper.selectShowEmpName(interview_id);
	}

	@Override
	public boolean updateDelete(Integer interview_id) {
		int count = oaRlzybInterviewMapper.updateDelete(interview_id);
		if(count > 0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<OaRlzybInterview> selectAllPerson(
			String emp_name, Date interview_date, Integer startPos,
			Integer PageSize) {
		// TODO Auto-generated method stub
		return oaRlzybInterviewMapper.selectAllPerson( emp_name, interview_date, startPos, PageSize);
	}

	/*@Override
	public int selectCount(String interview_person, String emp_name,
			Date interview_date) {
		// TODO Auto-generated method stub
		return oaRlzybInterviewMapper.selectCount(interview_person, emp_name, interview_date);
	}*/

	@Override
	public List<OaRlzybInterview> selectAllEmpName(String emp_name,
			Date interview_date, Integer startPos, Integer PageSize) {
		// TODO Auto-generated method stub
		return oaRlzybInterviewMapper.selectAllEmpName(emp_name, interview_date, startPos, PageSize);
	}

	@Override
	public List<OaRlzybInterview> selectPerson(String emp_name,
			Date interview_date) {
		// TODO Auto-generated method stub
		return oaRlzybInterviewMapper.selectPerson(emp_name, interview_date);
	}

	@Override
	public List<OaRlzybInterview> selectEmpName(String emp_name,
			Date interview_date) {
		// TODO Auto-generated method stub
		return oaRlzybInterviewMapper.selectEmpName(emp_name, interview_date);
	}
	
}
