package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbPraiseMapper;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbPraise;
import cn.tyyhoa.pojo.OaJzbStudentstatus;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaScbConsultstatus;
import cn.tyyhoa.pojo.OaScbPaystatus;
import cn.tyyhoa.pojo.OaScbPaytype;
import cn.tyyhoa.service.OaJzbPraiseService;

@Service("PraiseService")
public class OaJzbPraiseServiceimpl implements OaJzbPraiseService{
	
	@Autowired
	OaJzbPraiseMapper oajzbpraisemapper;

	@Override
	public List<OaJzbPraise> selectpraiselist(int depart_id,int Teacher_id,
			String consultant_name, int payStauts,int currentPage,int pageSize) {
		List<OaJzbPraise> OaJzbPraises= oajzbpraisemapper.selectpraiselist(depart_id,Teacher_id, consultant_name, payStauts,(currentPage-1)*pageSize,pageSize);
		return OaJzbPraises;
	}
	
	@Override
	public int selectpraiseCount(int depart_id,int Teacher_id, String consultant_name,
			int payStauts) {
		// TODO Auto-generated method stub
		return oajzbpraisemapper.selectpraiseCount(depart_id,Teacher_id, consultant_name, payStauts);
	}
	
	@Override
	public List<OaScbPaystatus> selectpaytype() {
		return oajzbpraisemapper.selectpaytype();
	}

	@Override
	public OaJzbPraise selectpariseinfo(int id) {
		
		return oajzbpraisemapper.selectpariseinfo(id);
	}

	@Override
	public OaJzbPraise selectpariseinfo2s(int id) {
		
		return oajzbpraisemapper.selectpariseinfo2s(id);
	}
	
	@Override
	public boolean inOaJzbPraise(OaJzbPraise oaJzbPraise) {
		int row=oajzbpraisemapper.inOaJzbPraise(oaJzbPraise);
		if(row==1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public OaJzbPraise selectdepartmentid(int Teacher_id) {
		// TODO Auto-generated method stub
		return oajzbpraisemapper.selectdepartmentid(Teacher_id);
	}

	@Override
	public List<OaScbConsultstatus> findShowZxStatus() {
		// TODO Auto-generated method stub
		return oajzbpraisemapper.ZXStatus();
	}

	@Override
	public List<OaJwbGrade> findShowGrade() {
		// TODO Auto-generated method stub
		return oajzbpraisemapper.showGrade();
	}

	@Override
	public List<OaRlzybEmployee> findEmpNameShow() {
		// TODO Auto-generated method stub
		return oajzbpraisemapper.empNameShow();
	}

	@Override
	public boolean findaddConsult(String consultant_name,int consultant_age,int sex,int status,String contact_way,String contacts,
    		int Record_id,Date date,String follow,String comments) {
		// TODO Auto-generated method stub
		int row=oajzbpraisemapper.addConsult(consultant_name, consultant_age, sex, status, contact_way, contacts, Record_id, date, follow,comments);
		if(row!=0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean findEditConsultId(Date date,String consultant_name,String contact_way,int consultant_age) {
		// TODO Auto-generated method stub
		int row=oajzbpraisemapper.editConsultId(date, consultant_name, contact_way,consultant_age);
		if(row!=0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<OaJwbGrade> findshowTeachId(int emp_id) {
		// TODO Auto-generated method stub
		return oajzbpraisemapper.showTeachId(emp_id);
	}
	
}
