package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.tyyhoa.dao.OaJzbPatrolgradeMapper;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbPatrolgrade;
import cn.tyyhoa.pojo.OaJzbQuestion;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.service.OaJzbPatrolgradeService;

@Service("patrolgradeservice")
public class OaJzbPatrolgradeServiceImpl implements OaJzbPatrolgradeService{
	
	@Autowired
	OaJzbPatrolgradeMapper oajzbpatrolgrademapper;

	@Override
	public List<OaJzbPatrolgrade> selectpatrolgrade(int grade_id) {
		return oajzbpatrolgrademapper.selectpatrolgrade(grade_id);
	}

	@Override
	public List<OaJwbGrade> selectgradelist(int classTeacherID) {
		
		return oajzbpatrolgrademapper.selectgradelist(classTeacherID);
	}

	@Override
	public List<OaJzbStudent> selectstudentlist(int grade_id) {
		
		return oajzbpatrolgrademapper.selectstudentlist(grade_id);
	}

	@Override
	public List<OaJzbQuestion> selectquestlist() {
		
		return oajzbpatrolgrademapper.selectquestlist();
	}

	@Override
	public int addpatrolgrade(OaJzbPatrolgrade patrol) {
		
		return oajzbpatrolgrademapper.addpatrolgrade(patrol);
	}

	@Override
	public OaJzbPatrolgrade selectclassteacherid(int grade_id) {
		
		return oajzbpatrolgrademapper.selectclassteacherid(grade_id);
	}

	@Override
	public int delpatrolgrade(int id) {
		
		return oajzbpatrolgrademapper.delpatrolgrade(id);
	}

	@Override
	public OaJzbPatrolgrade selectpatrol(int id) {
		
		return oajzbpatrolgrademapper.selectpatrol(id);
	}



	@Override
	public int updatepatrolgrade(int problem, int id) {
		// TODO Auto-generated method stub
		return oajzbpatrolgrademapper.updatepatrolgrade(problem, id);
	}

	@Override
	public int delxunbanbeizhu(int id) {
		// TODO Auto-generated method stub
		return oajzbpatrolgrademapper.delxunbanbeizhu(id);
	}

	@Override
	public OaJzbPatrolgrade selectxunbanbeizhu(int id) {
		// TODO Auto-generated method stub
		return oajzbpatrolgrademapper.selectxunbanbeizhu(id);
	}

	@Override
	public int updatexunbanbeizhu(String problem, int id) {
		// TODO Auto-generated method stub
		return oajzbpatrolgrademapper.updatexunbanbeizhu(problem, id);
	}

}
