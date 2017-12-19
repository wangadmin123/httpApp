package cn.tyyhoa.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJybVisitMapper;
import cn.tyyhoa.pojo.OaJybVisit;
import cn.tyyhoa.service.OaJybHuifangService;
@Service(value="OaJybHuifangService")
public class OaJybHuifangServiceImpl implements OaJybHuifangService{
    @Autowired
    OaJybVisitMapper oaJybVisitMapper;
	public OaJybVisitMapper getOaJybVisitMapper() {
		return oaJybVisitMapper;
	}
	public void setOaJybVisitMapper(OaJybVisitMapper oaJybVisitMapper) {
		this.oaJybVisitMapper = oaJybVisitMapper;
	}
	@Override
	public List<OaJybVisit> GetHuifang(String studentname,
    		String gradename,int index, int pageSize,int position_id, int emp_id) {
		// TODO Auto-generated method stub
		return oaJybVisitMapper.GetHuifang(studentname, gradename, (index-1)*pageSize, pageSize, position_id,  emp_id);
	}
	@Override
	public int Gethfcounts(String studentname, String gradename,int position_id, int emp_id) {
		// TODO Auto-generated method stub
		return oaJybVisitMapper.Gethfcounts(studentname, gradename, position_id,  emp_id);
	}
	@Override
	public List<OaJybVisit> GetHuifangById(int visit_studentId) {
		// TODO Auto-generated method stub
		return oaJybVisitMapper.GetHuifangById(visit_studentId);
	}
	@Override
	public int insertSelective(OaJybVisit record) {
		// TODO Auto-generated method stub
		return oaJybVisitMapper.insertSelective(record);
	}
	
	@Override
	public int insertId(int visit_studentId) {
		// TODO Auto-generated method stub
		return oaJybVisitMapper.insertId(visit_studentId);
	}
	@Override
	public List<OaJybVisit> GetGrades(int position_id, int emp_id) {
		// TODO Auto-generated method stub
		return oaJybVisitMapper.GetGrades(position_id, emp_id);
	}

}
