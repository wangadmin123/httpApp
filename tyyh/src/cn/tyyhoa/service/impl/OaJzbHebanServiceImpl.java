package cn.tyyhoa.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbHebanMapper;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJwbMotor;
import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.service.OaJzbHebanService;
@Service("OaJzbHebanService")
public class OaJzbHebanServiceImpl implements OaJzbHebanService {
	
	@Resource(name="oaJzbHebanMapper")
	private OaJzbHebanMapper ojhm;

	@Override
	public List<OaRlzybEmployee> selectJY() {
		// TODO Auto-generated method stub
		return ojhm.selectJY();
	}

	@Override
	public List<OaRlzybEmployee> selectBZR() {
		// TODO Auto-generated method stub
		return ojhm.selectBZR();
	}

	@Override
	public List<OaRlzybEmployee> selectJYLS() {
		// TODO Auto-generated method stub
		return ojhm.selectJYLS();
	}

	@Override
	public List<OaJwbMotor> selectJF() {
		// TODO Auto-generated method stub
		return ojhm.selectJF();
	}

	@Override
	public Integer insertGrade(OaJwbGrade ojg) {
		// TODO Auto-generated method stub
		return ojhm.insertGrade(ojg);
	}

	@Override
	public Integer selectZDGrade(String name) {
		// TODO Auto-generated method stub
		return ojhm.selectZDGrade(name);
	}

	@Override
	public Integer deleteZDGrade(Integer id, Integer id2) {
		// TODO Auto-generated method stub
		return ojhm.deleteZDGrade(id, id2);
	}

	@Override
	public List<OaJzbSpecialty> selectGradeType() {
		// TODO Auto-generated method stub
		return ojhm.selectGradeType();
	}

	@Override
	public Integer updateMotor(Integer id) {
		// TODO Auto-generated method stub
		return ojhm.updateMotor(id);
	}

	@Override
	public Integer updateStuGrade(Integer yId, Integer yId2, Integer xId) {
		// TODO Auto-generated method stub
		return ojhm.updateStuGrade(yId, yId2, xId);
	}

	@Override
	public List<OaJwbGrade> selectGrade() {
		// TODO Auto-generated method stub
		return ojhm.selectGrade();
	}

	@Override
	public Integer updateMotorKY(Integer id, Integer id2) {
		// TODO Auto-generated method stub
		return ojhm.updateMotorKY(id, id2);
	}

	@Override
	public List<OaJwbSemester> selectsemester() {
		// TODO Auto-generated method stub
		return ojhm.selectsemester();
	}

	@Override
	public OaJwbGrade selectGradeId(Integer id) {
		// TODO Auto-generated method stub
		return ojhm.selectGradeId(id);
	}
	
	public OaJzbHebanMapper getOjhm() {
		return ojhm;
	}

	public void setOjhm(OaJzbHebanMapper ojhm) {
		this.ojhm = ojhm;
	}
}
