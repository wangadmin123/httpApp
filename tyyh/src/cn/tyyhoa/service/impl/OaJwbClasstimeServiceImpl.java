package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJwbClasstimeMapper;
import cn.tyyhoa.pojo.OaJwbClasstime;
import cn.tyyhoa.pojo.OaJwbCurriculum;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJwbMotor;
import cn.tyyhoa.service.OaJwbClasstimeService;
@Service("oaJwbClasstimeService")
public class OaJwbClasstimeServiceImpl implements OaJwbClasstimeService {
	@Autowired
	private OaJwbClasstimeMapper oaJwbClasstimeMapper;
	@Override
	public List<OaJwbGrade> selectAllgrade(String grades) {
		// TODO 自动生成的方法存根
		return oaJwbClasstimeMapper.selectAllgrade(grades);
	}

	@Override
	public List<OaJwbMotor> selectMotor(String motor) {
		// TODO 自动生成的方法存根
		return oaJwbClasstimeMapper.selectMotor(motor);
	}

	@Override
	public List<OaJwbClasstime> selectTime(String classtimes) {
		// TODO 自动生成的方法存根
		return oaJwbClasstimeMapper.selectTime(classtimes);
	}


	@Override
	public boolean insert(List<OaJwbCurriculum> curriculumlist) {
		int row = oaJwbClasstimeMapper.insert(curriculumlist);
				if (row > 0) {
					return true;
				} else {
					return false;
				}			
		
	}

	@Override
	public List<OaJwbCurriculum> getCurriculum(String lecturer, String name,
			Date bieTime, Date outTime) {
		// TODO 自动生成的方法存根
		List<OaJwbCurriculum> list=oaJwbClasstimeMapper.getCurriculum(lecturer, name, bieTime, outTime);
		if(list.size()!=0){
			return list;
		}
		return null;
	}
	// 更新
	@Override
	public boolean updateCurriculum(List<OaJwbCurriculum> curriculumlists) {
		int row = oaJwbClasstimeMapper.updateCurriculum(curriculumlists);
		if (row > 0) {
			return true;
		} else {
			return false;
		}		
	}

}
