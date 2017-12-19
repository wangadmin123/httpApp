package cn.tyyhoa.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJwbGradeMapper;
import cn.tyyhoa.dao.OaKfbMettingMapper;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaKfbMetting;
import cn.tyyhoa.service.OaKfbMettingService;


@Service(value="oaKfbMettingService")
public class OaKfbMettingServiceImpl implements OaKfbMettingService {
	@Autowired
	OaKfbMettingMapper  oaKfbMettingMapper;
	@Autowired
	OaJwbGradeMapper oaJwbGradeMapper;
	/**
	 * 组长查看会议记录
	 */
	@Override
	public List<OaKfbMetting> selectHy(Integer uid,String starttime) {
		// TODO Auto-generated method stub,Date starttime,starttime
		 
		 
		 
		return oaKfbMettingMapper.selectHy(uid,starttime);
	}

/**
 * 组长添加会议记录
 */
	@Override
	public boolean insertSelective(OaKfbMetting record) {
		// TODO Auto-generated method stub
		if(oaKfbMettingMapper.addSelective(record)==1){
			return true;
		}
		return false;
	}

/**
 * 经理查看会议记录
 */
	@Override
	public List<OaKfbMetting> selectJlHy(){
		return oaKfbMettingMapper.selectJlHy();
	}


	/**
	 * 组长修改会议记录
	 */
	@Override
	public boolean updateByGroupid(OaKfbMetting record) {
		if(oaKfbMettingMapper.updateByGroupid(record)==1){
			return true;
		}
		return false;
	}

	@Override
	public OaKfbMetting selectHyByIdAndUId(Integer id) {
		// TODO Auto-generated method stub
		return oaKfbMettingMapper.selectHyByIdAndUid( id);
	}

	@Override
	public List<OaKfbMetting> selectJlHyByTj(Integer groupid, Date starttime) {
		// TODO Auto-generated method stub
		return oaKfbMettingMapper.selectJlHyByTj(groupid, starttime);
	}

	@Override
	public List<OaKfbMetting> selectJlHyByid(Integer groupid) {
		// TODO Auto-generated method stub
		return oaKfbMettingMapper.selectJlHyByid(groupid);
	}
	
	@Override
	public List<OaKfbMetting> gethistoryMet(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return oaKfbMettingMapper.SelectHistoryMetting(paramMap);
	}


	
}
