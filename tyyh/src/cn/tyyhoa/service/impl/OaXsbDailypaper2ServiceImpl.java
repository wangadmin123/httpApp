package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaXsbDailypaper2Mapper;
import cn.tyyhoa.dao.OaXsbDailypaperMapper;
import cn.tyyhoa.dao.OaXsbDayTestMapper;
import cn.tyyhoa.pojo.OaXsbDailypaper2;
import cn.tyyhoa.service.OaXsbDailypaper2Service;

@Service("oaXsbDailypaper2Service")
public class OaXsbDailypaper2ServiceImpl implements OaXsbDailypaper2Service {
	@Autowired
	private OaXsbDailypaper2Mapper oaXsbDailypaperMapper2;

	public OaXsbDailypaper2Mapper getOaXsbDailypaperMapper2() {
		return oaXsbDailypaperMapper2;
	}

	public void setOaXsbDailypaperMapper2(OaXsbDailypaper2Mapper oaXsbDailypaperMapper2) {
		this.oaXsbDailypaperMapper2 = oaXsbDailypaperMapper2;
	}

	@Override
	public int add(OaXsbDailypaper2 OaXsbDailypaper2Mapper2) {
		// TODO Auto-generated method stub
		return oaXsbDailypaperMapper2.add(OaXsbDailypaper2Mapper2);
	}

	@Override
	public List<OaXsbDailypaper2> selectOaXsbDailypaper2(int grade_id, Date writeTimeDate2) {
		// TODO Auto-generated method stub
		return oaXsbDailypaperMapper2.selectOaXsbDailypaper2(grade_id, writeTimeDate2);
	}

}
