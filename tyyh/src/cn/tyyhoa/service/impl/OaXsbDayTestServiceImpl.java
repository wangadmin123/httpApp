package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaXsbDailypaperMapper;
import cn.tyyhoa.dao.OaXsbDayTestMapper;
import cn.tyyhoa.pojo.OaXsbDayTest;
import cn.tyyhoa.service.OaXsbDayTestService;

@Service("oaXsbDayTestService")
public class OaXsbDayTestServiceImpl implements OaXsbDayTestService {

	@Autowired
	private OaXsbDayTestMapper oaXsbDayTestMapper;

	public void setOaXsbDailypaperMapper(
			OaXsbDailypaperMapper oaXsbDailypaperMapper,
			OaXsbDayTestMapper oaXsbDayTestMapper) {
		this.oaXsbDayTestMapper = oaXsbDayTestMapper;
	}

	@Override
	public List<OaXsbDayTest> getAlldaytest(@Param("classId") int classId) {
		return oaXsbDayTestMapper.getAlldaytest(classId);
	}

	@Override
	public boolean insertDay(List<OaXsbDayTest> oaXsbDayTestList) {
		int row = oaXsbDayTestMapper.insertDay(oaXsbDayTestList);
		if (row > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<OaXsbDayTest> selectDatByClassIdAndCreateTime(
			@Param("classId") int classId, @Param("createTime") Date createTime) {

		return oaXsbDayTestMapper.selectDatByClassIdAndCreateTime(classId,
				createTime);
	}

	@Override
	public Integer xg(Integer id, Integer score,String time) {
		// TODO Auto-generated method stub
		return oaXsbDayTestMapper.xg(id, score,time);
	}

	@Override
	public Integer ck(Integer studentClassId, String dateStyle) {
		// TODO Auto-generated method stub
		return oaXsbDayTestMapper.ck(studentClassId, dateStyle);
	}

}
