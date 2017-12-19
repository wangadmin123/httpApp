package cn.tyyhoa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJybInterviewScoreMapper;

import cn.tyyhoa.pojo.OaJybInterviewScore;
import cn.tyyhoa.service.OaJybInterviewService;
@Service(value="OaJybInterviewService")
public class OaJybInterviewServiceImpl implements OaJybInterviewService{
     @Autowired
     OaJybInterviewScoreMapper oaJybInterviewScoreMapper;
	public OaJybInterviewScoreMapper getOaJybInterviewScoreMapper() {
		return oaJybInterviewScoreMapper;
	}

	public void setOaJybInterviewScoreMapper(
			OaJybInterviewScoreMapper oaJybInterviewScoreMapper) {
		this.oaJybInterviewScoreMapper = oaJybInterviewScoreMapper;
	}

	@Override
	public List<OaJybInterviewScore> GetAllIntervie(String studentname,
			String gradename, int index, int pageSize,int position_id, int emp_id) {
		// TODO Auto-generated method stub
		return oaJybInterviewScoreMapper.GetAllIntervie(studentname, gradename, ((index-1)*pageSize), pageSize, position_id,  emp_id);
	}

	@Override
	public int GetAllCounts(String studentname, String gradename, int index,
			int pageSize,int position_id, int emp_id) {
		// TODO Auto-generated method stub
		return oaJybInterviewScoreMapper.GetAllCounts(studentname, gradename, (index-1)*pageSize, pageSize, position_id,  emp_id);
	}

	@Override
	public int updateByPrimaryKeySelective(OaJybInterviewScore record) {
		// TODO Auto-generated method stub
		return oaJybInterviewScoreMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public OaJybInterviewScore GetStudentInterview(int stuid) {
		// TODO Auto-generated method stub
		return oaJybInterviewScoreMapper.GetStudentInterview(stuid);
	}

	@Override
	public List<OaJybInterviewScore> GetBanjiInterview(int gradeid) {
		// TODO Auto-generated method stub
		return oaJybInterviewScoreMapper.GetBanjiInterview(gradeid);
	}

	@Override
	public int insertId(int interview_score_studentId) {
		// TODO Auto-generated method stub
		return oaJybInterviewScoreMapper.insertId(interview_score_studentId);
	}

	@Override
	public List<OaJybInterviewScore> getstudentid(int id) {
		// TODO 自动生成的方法存根
		return oaJybInterviewScoreMapper.getstudentid(id);
	}

	@Override
	public int insertByPrimaryKeySelective(OaJybInterviewScore record) {
		// TODO Auto-generated method stub
		return oaJybInterviewScoreMapper.insertByPrimaryKeySelective(record);
	}

	

	

	
}
