package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaXsbWeekTestMapper;
import cn.tyyhoa.pojo.OaXsbWeekTest;
import cn.tyyhoa.service.OaXsbWeekTestService;

@Service("OaXsbWeekTestService")
public class OaXsbWeekTestImpl implements OaXsbWeekTestService {

	@Autowired
	OaXsbWeekTestMapper oaXsbWeekTestMapper;

	public void setOaXsbWeekTestMapper(OaXsbWeekTestMapper oaXsbWeekTestMapper) {
		this.oaXsbWeekTestMapper = oaXsbWeekTestMapper;
	}

	@Override
	public List<OaXsbWeekTest> getWeektest(@Param("classId") int classId) {
		return oaXsbWeekTestMapper.getWeektest(classId);
	}

	@Override
	public boolean insertWeek(List<OaXsbWeekTest> oaXsbWeekTestlist) {

		int row = oaXsbWeekTestMapper.insertWeek(oaXsbWeekTestlist);
		if (row > 0) {
			return true;
		} else {
			return false;
		}

	}

	/**
	 * 根据时间查询周考表
	 */
	@Override
	public List<OaXsbWeekTest> selectWeekByClassIdAndCreateTime(
			@Param("classId") int classId, @Param("whatweek") int whatweek) {

		return oaXsbWeekTestMapper.selectWeekByClassIdAndCreateTime(classId, whatweek);
	}

	@Override
	public int getwhatWeek() {
		
		return oaXsbWeekTestMapper.getwhatWeek();
	}

	@Override
	public Integer selectWhatweekByClassId(@Param("classId") int classId) {
		
		return oaXsbWeekTestMapper.selectWhatweekByClassId(classId);
	}

	@Override
	public List<OaXsbWeekTest> selectAllWeekByClassId(
			@Param("classId") int classId) {
		return oaXsbWeekTestMapper.selectAllWeekByClassId(classId);
	}

	@Override
	public Integer xgzk(Integer id, Integer jc, Integer gradeId,Integer score,Integer i) {
		// TODO Auto-generated method stub
		return oaXsbWeekTestMapper.xgzk(id, jc, gradeId,score,i);
	}
	
	

}
