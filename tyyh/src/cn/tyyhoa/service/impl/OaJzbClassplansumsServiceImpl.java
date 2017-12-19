package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbClassplansumMapper;
import cn.tyyhoa.pojo.OaJzbClassplansum;
import cn.tyyhoa.service.OaJzbClassplansumsService;
@Service("OaJzbClassplansumsService")
public class OaJzbClassplansumsServiceImpl implements OaJzbClassplansumsService {
	@Autowired
	OaJzbClassplansumMapper oaJzbClassplansumMapper;
	//显示带班计划老师总结
	@Override
	public List<OaJzbClassplansum> ShowClassplanSum(int id) {
		// TODO Auto-generated method stub
		return oaJzbClassplansumMapper.getClassplanSumByID(id);
	}
	
	@Override
	public int deleteClassplansum(int great_id) {
		// TODO Auto-generated method stub
		return oaJzbClassplansumMapper.deleteClassplansum(great_id);
	}

	@Override
	public int addDbjhSum(int great_id, String SUM, int emp_name_id,Date date2) {
		// TODO Auto-generated method stub
		return oaJzbClassplansumMapper.addDbjhSum(great_id, SUM, emp_name_id,date2);
	}

	@Override
	public int UpdateClassplanSum(String sum, int classplansum_id) {
		// TODO Auto-generated method stub
		return oaJzbClassplansumMapper.UpdateClassplanSum(sum, classplansum_id);
	}

}
