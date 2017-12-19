package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbPatriarchInterviewMapper;
import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbInterview;
import cn.tyyhoa.pojo.OaJzbPatriarchInterview;
import cn.tyyhoa.service.OaJzbPatriarchInterviewService;
@Service("OaJzbPatriarchInterviewService")
public class OaJzbPatriarchInterviewServiceImpl implements
		OaJzbPatriarchInterviewService {
	@Autowired
	OaJzbPatriarchInterviewMapper oaJzbPatriarchInterviewMapper;


	//根据Stu_id 查询家长访谈
	@Override
	public List<OaJzbPatriarchInterview> getJZFTSById(int stu_id) {
		// TODO Auto-generated method stub
		return oaJzbPatriarchInterviewMapper.getJZFTSById(stu_id);
	}
	@Override
	public List<OaJzbInterview> getInterview() {
		// TODO Auto-generated method stub
		return oaJzbPatriarchInterviewMapper.getInterview();
	}
	@Override
	public int addJZFT(String Interview_name, int Interview_id, int term,Date Interview_time,
			Date Entering_time, int Interview_way, String Interview_content,
			String remarks, int deleteStatus, int stu_id) {
		// TODO Auto-generated method stub
		return oaJzbPatriarchInterviewMapper.addJZFT(Interview_name, Interview_id, term, Interview_time, Entering_time,
				Interview_way, Interview_content, remarks, deleteStatus, stu_id);
	}
	@Override
	public OaJzbPatriarchInterview getJZFTByID(int Id) {
		// TODO Auto-generated method stub
		return oaJzbPatriarchInterviewMapper.getJZFTByID(Id);
	}
	
	@Override
	public int deleteJZFT(int id) {
		// TODO Auto-generated method stub
		return oaJzbPatriarchInterviewMapper.deleteJZFT(id);
	}
	@Override
	public OaJwbSemester getsemesterById(int stu_Id) {
		// TODO Auto-generated method stub
		return oaJzbPatriarchInterviewMapper.getsemesterById(stu_Id);
	}
	@Override
	public int UpdateJZFT(String Interview_name,
			int Interview_way, String Interview_content, int id) {
		// TODO Auto-generated method stub
		return oaJzbPatriarchInterviewMapper.UpdateJZFT(Interview_name, Interview_way, Interview_content, id);
	}


}
