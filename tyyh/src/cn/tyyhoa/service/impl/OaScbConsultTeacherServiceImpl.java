package cn.tyyhoa.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbPaystatus;
import cn.tyyhoa.pojo.OaScbPaytype;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;
import cn.tyyhoa.service.OaScbConsultTeacherService;
import cn.tyyhoa.dao.OaScbConsultTeacherMapper;
import cn.tyyhoa.dao.OaScbConsulterMapper;

/**
 * 咨询师
 * @author lenovo
 *
 */
@Service("oaScbConsultTeacherService")
public class OaScbConsultTeacherServiceImpl implements OaScbConsultTeacherService {
	

	
	@Autowired
	OaScbConsultTeacherMapper OaScbConsultTeacherMapper;

	/**
	 * 查询所有的咨询师
	 */
	public List<OaRlzybEmployee> ConsultTeacherFind() {
		
		return OaScbConsultTeacherMapper.ConsultTeacherFind();
	}

	
	@Override
	public List<OaScbConsulter> selectConsulter(Map<String, Object> map) {
	
		return OaScbConsultTeacherMapper.selectConsulter(map);
	}

	@Override
	public OaScbConsulter findConsulter(int id) {
		
		return OaScbConsultTeacherMapper.findConsulter(id);
	}

	@Override
	public boolean updateConsulter(OaScbConsulter oaScbConsulter) {
		
		int row =OaScbConsultTeacherMapper.updateConsulter(oaScbConsulter);
		if(row==1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean invalidConsulter(String uselessCause,int id) {
		int row = OaScbConsultTeacherMapper.invalidConsulter(uselessCause, id);
		if(row==1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean displayConsulter(int id) {
		int row = OaScbConsultTeacherMapper.displayConsulter(id);
		if(row==1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean enrollStatusConsulter(OaScbConsulter oaScbConsulter) {
		int row = OaScbConsultTeacherMapper.enrollStatusConsulter(oaScbConsulter);
		if(row==1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<OaScbVisit>  queryvisit(Integer consultId) {
		return OaScbConsultTeacherMapper.queryvisit(consultId);
	}


	@Override
	public List<OaScbConsulter> selectConsulterCount(OaScbConsulter oaScbConsulter) {
		
		return OaScbConsultTeacherMapper.selectConsulterCount(oaScbConsulter);
	}


	@Override
	public List<OaScbConsulter> consultqueryvisit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return OaScbConsultTeacherMapper.consultqueryvisit(map);
	}


	@Override
	public List<OaScbPaytype> selectpayType() {
		
		return OaScbConsultTeacherMapper.selectpayType();
	}


	@Override
	public List<OaScbPaystatus> selectpaystatus() {
		List<OaScbPaystatus> list=OaScbConsultTeacherMapper.selectpaystatus();
		for (OaScbPaystatus oaScbPaystatus : list) {
			System.out.println(oaScbPaystatus.getPayStatus());
		}
		return list;
	}


	@Override
	public OaScbConsulter findbaoshen(int id) {
		// TODO Auto-generated method stub
		return OaScbConsultTeacherMapper.findbaoshen(id);
	}


	@Override
	public boolean StatusConsulter(OaScbConsulter oaScbConsulter) {
		int row =OaScbConsultTeacherMapper.StatusConsulter(oaScbConsulter);
		if(row==1){
			return true;
		}else{
			return false;
		}
	}


	@Override
	public OaScbConsulter consultquerybaoshen(int id) {
		
		return OaScbConsultTeacherMapper.consultquerybaoshen(id);
	}


	@Override
	public List<OaRlzybEmployee> selectPosition() {
		
		return OaScbConsultTeacherMapper.selectPosition();
	}


	@Override
	public int updatePosition(Map<String, Object> map) {
		
		return OaScbConsultTeacherMapper.updatePosition(map);
	}


	@Override
	public int visitrecord(OaScbVisit oaScbVisit) {		
		return OaScbConsultTeacherMapper.visitrecord(oaScbVisit);
	}





	@Override
	public int maxId() {
		
		return OaScbConsultTeacherMapper.maxId();
	}


	@Override
	public int insertRecord(OaScbRecord oaScbRecord) {
		
		return OaScbConsultTeacherMapper.insertRecord(oaScbRecord);
	}


	@Override
	public List<OaScbConsulter> selectTeacherConsulter(Map<String, Object> map) {
		
		return OaScbConsultTeacherMapper.selectTeacherConsulter(map);
	}


	@Override
	public List<OaScbConsulter> selectConsulterone(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return OaScbConsultTeacherMapper.selectConsulterone(map);
	}


	@Override
	public List<OaScbConsulter> selectConsulterthree(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return OaScbConsultTeacherMapper.selectConsulterthree(map);
	}


	@Override
	public List<OaScbConsulter> selectConsultersave(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return OaScbConsultTeacherMapper.selectConsultersave(map);
	}
	@Override
	public List<OaScbConsulter> selectConsultersaveup(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return OaScbConsultTeacherMapper.selectConsultersaveup(map);
	}


	@Override
	public Integer Update(Integer id) {
		// TODO Auto-generated method stub
		return OaScbConsultTeacherMapper.Update(id);
	}


	


	
	

}
