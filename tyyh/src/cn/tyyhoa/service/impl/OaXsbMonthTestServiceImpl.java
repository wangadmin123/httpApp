package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaXsbMonthTestMapper;
import cn.tyyhoa.pojo.OaXsbMonthly;
import cn.tyyhoa.service.OaXsbMonthTestService;

@Service("OaXsbMonthTestService")
public class OaXsbMonthTestServiceImpl implements OaXsbMonthTestService {
	@Autowired
	OaXsbMonthTestMapper oaXsbMonthTestMapper;

	public void setOaXsbMonthTestMapper(
			OaXsbMonthTestMapper oaXsbMonthTestMapper) {
		this.oaXsbMonthTestMapper = oaXsbMonthTestMapper;
	}

	@Override
	public List<OaXsbMonthly> getMonthtest(@Param("classId") int classId) {
		return oaXsbMonthTestMapper.getMonthtest(classId);
	}

	@Override
	public boolean insertMonthly(List<OaXsbMonthly> oaXsbMonthly) {
		int row = oaXsbMonthTestMapper.insertMonthly(oaXsbMonthly);
		if (row > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<OaXsbMonthly> selectMonthByClassIdAndCreateTime(
			@Param("classId") int classId, @Param("createTime") String createTime) {

		return oaXsbMonthTestMapper.selectMonthByClassIdAndCreateTime(classId,
				createTime);
	}

	@Override
	public OaXsbMonthly selectMonthByStuId(int studentId) {
		// TODO Auto-generated method stub
		return oaXsbMonthTestMapper.selectMonthByStuId(studentId);
	}

	@Override
	public Integer xgyk(Integer id, String time, Integer gradeId, Integer score, Integer i) {
		// TODO Auto-generated method stub
		return oaXsbMonthTestMapper.xgyk(id, time, gradeId, score, i);
	}

}
