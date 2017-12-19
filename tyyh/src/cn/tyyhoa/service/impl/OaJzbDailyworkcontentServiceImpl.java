package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJzbDailyworkcontentMapper;
import cn.tyyhoa.pojo.OaJzbDailyschedule;
import cn.tyyhoa.pojo.OaJzbDailyworkcontent;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.service.OaJzbDailyworkcontentService;
@Service("OaJzbDailyworkcontentService")
public class OaJzbDailyworkcontentServiceImpl implements
		OaJzbDailyworkcontentService {
	@Autowired
	OaJzbDailyworkcontentMapper oaJzbDailyworkcontentMapper;
	@Override
	public List<OaJzbDailyworkcontent> getDailyWorkcontents(int emp_id,int pageindex,int pagesize,Date bieTime,Date outTime) {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.getDailyWorkcontents(emp_id,(pageindex-1)*pagesize,pagesize,bieTime,outTime);
	}
	@Override
	public List<OaRlzybEmployee> getJzbEmp_names() {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.getJzbEmp_names();
	}
	@Override
	public int getCount(int emp_id,Date bieTime,Date outTime) {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.getCount(emp_id,bieTime,outTime);
	}
	@Override
	public OaJzbDailyworkcontent getDailyworkcontentById(Date Entrytime,
			int teacher_id) {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.getDailyworkcontentById(Entrytime, teacher_id);
	}
	@Override
	public List<OaJzbDailyschedule> getDailyschedulsByteacher_id(
			Date Entrytime, int teacher_id) {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.getDailyschedulsByteacher_id(Entrytime, teacher_id);
	}
	@Override
	public int UpdateDailyworkconte(String TheContentOfThework,
			String Morningwork, String Afternoonjobcontent, String remarks,int Dailyworkcontent_id) {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.UpdateDailyworkconte(TheContentOfThework, Morningwork, Afternoonjobcontent, remarks,Dailyworkcontent_id);
	}
	@Override
	public int UpdateDailschedul(String Contentsoftheclass, int Dailyschedule_id) {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.UpdateDailschedul(Contentsoftheclass, Dailyschedule_id);
	}
	@Override
	public int addDailyschedule(Date Starttime, Date Outtime, Date Entrytime,
			String Contentsoftheclass, int classteacher_id) {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.addDailyschedule(Starttime, Outtime, Entrytime, Contentsoftheclass, classteacher_id);
	}
	@Override
	public int addDailyworkconten(Date Entrytime, int teacher_id,
			String TheContentOfThework, String Morningwork,
			String Afternoonjobcontent, String remarks) {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.addDailyworkconten(Entrytime, teacher_id, TheContentOfThework, Morningwork, Afternoonjobcontent, remarks);
	}
	@Override
	public int deleteDaily(int Dailyworkcontent_id) {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.deleteDaily(Dailyworkcontent_id);
	}
	@Override
	public int deleteDilyworkcontent(Date Entrytime, int classteacher_id) {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.deleteDilyworkcontent(Entrytime, classteacher_id);
	}
	@Override
	public List<OaJzbDailyworkcontent> getDailyWorkcontent(int emp_id,
			int pageindex, int pagesize, Date bieTime, Date outTime) {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.getDailyWorkcontent(emp_id, pageindex, pagesize, bieTime, outTime);
	}
	@Override
	public int getCountDaily(int emp_id, Date bieTime, Date outTime) {
		// TODO Auto-generated method stub
		return oaJzbDailyworkcontentMapper.getCountDaily(emp_id, bieTime, outTime);
	}

}
